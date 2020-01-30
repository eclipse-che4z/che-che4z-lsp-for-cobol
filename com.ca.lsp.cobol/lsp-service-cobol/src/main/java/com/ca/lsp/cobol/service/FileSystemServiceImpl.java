/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.google.common.annotations.Beta;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.eclipse.lsp4j.WorkspaceFolder;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.*;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Singleton
@Slf4j
public class FileSystemServiceImpl implements FileSystemService {
  private static final String COBDEPS = ".cobdeps";
  private static final String COPYBOOK_FOLDER_NAME = "COPYBOOKS";
  public static final String DEP_EXTENSION = ".dep";
  private final DefaultDataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;

  @Inject
  public FileSystemServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  /**
   * Store the informations about the workspace folder defined by the client IDE
   *
   * @param workspaceFolders list of workspace folders sent by the client to the server
   */
  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  /**
   * @param copybookName (i.e. COPYTEST)
   * @return String that represent the content of a found copybook under the workspace folder or
   *     null if copybook is not found
   */
  @Override
  public String getContentByCopybookName(String copybookName) {
    return Optional.ofNullable(getPathByCopybookName(copybookName))
        .map(this::retrieveContentByPath)
        .orElse(null);
  }

  /**
   * From a given copybook name (without file extension) this method will return the URI of the file
   * * - if exists
   *
   * @param fileName (i.e. COPYTEST)
   * @return URI of file (i.e. file:///C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy) or *
   *     null if not found. This case should be covered by an appropriate diagnostic message * using
   *     the Communication service delegate object
   */
  protected Path getPathByCopybookName(String fileName) {
    return workspaceFoldersAsPathList().stream()
        .map(it -> searchInDirectory(fileName, it))
        .map(it -> it.orElse(null))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  private List<Path> workspaceFoldersAsPathList() {
    return getWorkspaceFolders().stream()
        .map(this::getPathFromWorkspaceFolder)
        .collect(Collectors.toList());
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  /**
   * @param it workspace folder
   * @return the Path of the workspace folder
   * @throws IllegalArgumentException if the URI of WorkspaceFolder is not valid
   */
  @Nonnull
  private Path getPathFromWorkspaceFolder(WorkspaceFolder it) {
    try {
      return Paths.get(new URI(it.getUri()));
    } catch (URISyntaxException e) {
      throw new IllegalArgumentException("Workspace URI not valid");
    }
  }

  /**
   * Delegated method to search in directory
   *
   * @param fileName name provided by preprocessor
   * @param workspaceFolderPath NIO Path of workspace folder
   * @return a valid path of the copybook file or null if not found
   */
  private Optional<Path> searchInDirectory(String fileName, Path workspaceFolderPath) {
    return Optional.ofNullable(applySearch(fileName, getCopybookFolderPath(workspaceFolderPath)));
  }

  private Path getCopybookFolderPath(Path workspaceFolderPath) {
    return Paths.get(workspaceFolderPath + filesystemSeparator() + COPYBOOK_FOLDER_NAME);
  }

  /**
   * @param fileName copybook name
   * @param workspaceFolderPath physical path of workspace where to search for the copybook
   * @return Path of the found copybook in the workspace folder
   */
  private Path applySearch(String fileName, Path workspaceFolderPath) {
    try (Stream<Path> pathStream =
        Files.find(
            workspaceFolderPath,
            100,
            (path, basicFileAttributes) -> {
              File resFile = path.toFile();
              return resFile.isFile()
                  && !resFile.isDirectory()
                  && resFile.getName().contains(".")
                  && resFile
                      .getName()
                      .substring(0, resFile.getName().lastIndexOf('.'))
                      .equalsIgnoreCase(fileName)
                  && isValidExtension(resFile.getAbsoluteFile().toString().toLowerCase());
            },
            FileVisitOption.FOLLOW_LINKS)) {
      return pathStream.findAny().orElse(null);
    } catch (IOException e) {
      log.error("[search in copybook folder]" + Arrays.toString(e.getStackTrace()));
      return null;
    }
  }

  // TODO: UT with syntax coming from zowe..
  // TODO: REFACTOR WITH STRING UTILS.
  private boolean isValidExtension(String filePath) {
    List<String> validExtensions = Arrays.asList("cpy", "cbl", "cobol", "cob");
    return validExtensions.stream()
        .anyMatch(ext -> ext.equals(filePath.substring(filePath.lastIndexOf('.') + 1)));
  }

  /**
   * @param uriForFileName of copybook found under workspace folder
   * @return content of the file as String content
   */
  @Nullable
  private String retrieveContentByPath(Path uriForFileName) {
    String content = null;
    try (Stream<String> stream = Files.lines(uriForFileName)) {
      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse(null);
    } catch (IOException e) {
      log.error("[retrieve content by path]" + Arrays.toString(e.getStackTrace()));
    }
    return content;
  }

  /** create the task and pass it to the executor service */
  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String requiredCopybookName = event.getName();
    Path path = getPathByCopybookName(requiredCopybookName);
    String content = Optional.ofNullable(path).map(this::retrieveContentByPath).orElse(null);

    try {
      addCopybookInDepFile(
          requiredCopybookName,
          FilenameUtils.getBaseName(
              Paths.get(new URI(event.getDocumentUri())).getFileName().toString()));
    } catch (URISyntaxException e) {
      e.printStackTrace();
    }

    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(Optional.ofNullable(path).map(Path::toUri).map(URI::toString).orElse(null))
            .content(content)
            .build());
  }

  @Beta
  void addCopybookInDepFile(String requiredCopybookName, String cobolFileName) {
    Path dependencyFolder = initializeDependencyFolder();
    Path dependencyFile = retrieveDependencyFile(dependencyFolder, cobolFileName);

    if (!depFileExists(dependencyFile)) {
      dependencyFile = generateDependencyFile(cobolFileName, dependencyFolder);
    }
    // check why dependency file path is sometimes null
    updateDependencyList(dependencyFile, requiredCopybookName);
  }

  private Path retrieveDependencyFile(Path dependencyFolderPath, String cobolFileName) {
    return Paths.get(dependencyFolderPath + filesystemSeparator() + cobolFileName + DEP_EXTENSION);
  }

  protected void updateDependencyList(Path dependencyFilePath, String requiredCopybookName) {
    System.out.println("UPDATE DEPENDENCY");
    if (dependencyFilePath != null) {
      List<String> lines = getContentFromDependencyFile(dependencyFilePath);
      System.out.println(lines.toString());
      System.out.println("UPDATE WITH cbl name" + requiredCopybookName);
      if (lines != null && !lines.contains(requiredCopybookName)) {
        writeOnFile(dependencyFilePath, requiredCopybookName);
      }
    }
  }

  private void writeOnFile(Path dependencyFilePath, String contents) {
    try {
      Files.write(dependencyFilePath, (contents + "\n").getBytes(), StandardOpenOption.APPEND);

    } catch (IOException e) {
      log.error("IO Exception write file" + Arrays.toString(e.getStackTrace()));
    }
  }

  private List<String> getContentFromDependencyFile(Path dependencyFilePath) {
    List<String> result = null;
    try {
      result = Files.readAllLines(dependencyFilePath);
      log.info(result.toString());
    } catch (IOException e) {
      log.error(e.getLocalizedMessage());
    }
    return result;
  }

  Path generateDependencyFile(String cobolFileName, Path dependencyFolder) {
    // verify that the dependency folder exists.
    System.out.println("GENERATE DEPENDENCY");
    try {
      if (dependencyFolder != null) {
        dependencyFolder = initializeDependencyFolder();
      }

      return Files.createFile(
          Paths.get(dependencyFolder + filesystemSeparator() + cobolFileName + DEP_EXTENSION));
    } catch (IOException e) {
      log.error("[CREATE DEPFILE EXCEPTION]" + e.getLocalizedMessage());
      return null;
    }
  }

  private boolean depFileExists(Path dependencyFile) {
    return dependencyFile.toFile().exists();
  }

  private String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  /**
   * This method create the .cobdeps folder that will contains all the dep files required.
   *
   * @return the .cobdeps path that will be used to create the dep file or null if some issue
   *     happens.
   */
  private Path initializeDependencyFolder() {
    Path folderPath;
    try {
      // if file already exists return its path
      folderPath =
          Paths.get(
              Paths.get(new URI(getWorkspaceFolders().get(0).getUri()))
                  + filesystemSeparator()
                  + COBDEPS
                  + filesystemSeparator());
      if (Files.exists(folderPath)) {
        return folderPath;
      } else {
        return Files.createDirectory(folderPath);
      }

    } catch (URISyntaxException | IOException e) {
      // exceptional case
      return null;
    }
  }
}
