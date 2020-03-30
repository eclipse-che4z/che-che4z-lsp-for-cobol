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
package com.ca.lsp.cobol.service.delegates.dependency;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.CopybookDepEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.CopybookServiceImpl;
import com.ca.lsp.cobol.service.TextDocumentSyncType;
import com.google.common.annotations.Beta;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.*;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.ca.lsp.cobol.service.utils.FileSystemUtils.*;

/** This class is responsible for everything is related with the copybook dependency manangement */
@Slf4j
@Singleton
public class CopybookDependencyServiceImpl
    implements CopybookDependencyService, EventObserver<CopybookDepEvent> {
  private static final String COBDEPS = ".cobdeps";
  private static final String COPYBOOK_FOLDER_NAME = ".copybooks";
  private static final String DEP_EXTENSION = ".dep";
  @Getter private List<Path> workspaceFolderPaths;
  private final DataBusBroker dataBus;
  private final Provider<ConfigurationSettingsStorable> configurationSettingsStorableProvider;

  @Inject
  public CopybookDependencyServiceImpl(
      DataBusBroker dataBus,
      Provider<ConfigurationSettingsStorable> configurationSettingsStorableProvider) {
    this.dataBus = dataBus;
    this.configurationSettingsStorableProvider = configurationSettingsStorableProvider;
    this.dataBus.subscribe(DataEventType.COPYBOOK_DEP_EVENT, this);
  }

  /**
   * This method write the copybook name sent by the {@link CopybookServiceImpl} into the dependency
   * file.
   *
   * @param requiredCopybookName copybook name that should be written in the dependency file
   * @param documentUri extract the name of the cobol file from the URI
   */
  @Beta
  @Override
  public void addCopybookInDepFile(String requiredCopybookName, String documentUri) {
    String cobolFileName = getFileNameFromURI(documentUri);
    Path dependencyFolderPath = createDependencyFileFolder();
    Path dependencyFile = retrieveDependencyFile(dependencyFolderPath, cobolFileName);

    if (!isFileExists(dependencyFile)) {
      generateDependencyFile(cobolFileName);
    }
    // check why dependency file path is sometimes null
    updateDependencyList(dependencyFile, requiredCopybookName);
  }

  /**
   * This method update an already defined dependency file with a new copybook content
   *
   * @param dependencyFilePath reference to the dependency file
   * @param copybookName the copybook name that will be written in the dependency file
   */
  @Override
  public void updateDependencyList(Path dependencyFilePath, String copybookName) {
    if (dependencyFilePath != null) {
      List<String> lines = getContentFromDependencyFile(dependencyFilePath);
      if (lines != null && !lines.contains(copybookName)) {
        writeOnFile(dependencyFilePath, copybookName);
      }
    }
  }

  /**
   * This method retrieve the content of a dependency file and return it back to the callee.
   *
   * @param dependencyFilePath target path of the dependency file
   * @return the content of the dependency file or null if doesn't exists
   */
  private List<String> getContentFromDependencyFile(Path dependencyFilePath) {
    List<String> result = null;
    try {
      result = Files.readAllLines(dependencyFilePath);
    } catch (IOException e) {
      log.error(e.getMessage());
    }
    return result;
  }

  /**
   * @param workspaceFolderPaths list of target folders that contains copybooks. Thi information is
   *     provided by {@link com.ca.lsp.cobol.service.CopybookService}
   */
  @Override
  public void setWorkspaceFolderPaths(List<Path> workspaceFolderPaths) {
    this.workspaceFolderPaths = workspaceFolderPaths;
  }

  /**
   * This method generate a dependency file for a given name.
   *
   * @param cobolFileName name of the cobol file that will be used to create the dependency file
   */
  @Override
  public void generateDependencyFile(String cobolFileName) {
    try {
      Path dependencyFolder = createDependencyFileFolder();

      // check that the dependency file doesn't exists..
      Path dependencyFile =
          Paths.get(dependencyFolder + filesystemSeparator() + cobolFileName + DEP_EXTENSION);

      if (!isFileExists(dependencyFile)) {
        Files.createFile(
            Paths.get(dependencyFolder + filesystemSeparator() + cobolFileName + DEP_EXTENSION));
      }
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  /**
   * This method is triggered when on databus the postData method is called and contains
   * CopybookDepEvent; This method implements the update logic for .dep file, by update we
   * understand that if the copybook is present in the .copybook folder than its name should be
   * remove from .dep file
   *
   * @param event of type CopybookDepEvent
   */
  @Synchronized
  @Override
  public void observerCallback(CopybookDepEvent event) {
    // we are not checking .dep on DID_OPEN because on DID_OPEN the file is updated with the
    // required copybooks
    if (event.getTextDocumentSync().equals(TextDocumentSyncType.DID_CHANGE.name())) {

      Path path =
          findCopybook(
              event.getCopybookName(),
              configurationSettingsStorableProvider.get().getProfiles().toString(),
              configurationSettingsStorableProvider.get().getPaths());

      Path folderPath =
          Paths.get(
              getWorkspaceFolderPaths().get(0)
                  + filesystemSeparator()
                  + COBDEPS
                  + filesystemSeparator());

      Path dependencyFilePath =
          retrieveDependencyFile(folderPath, getFileNameFromURI(event.getDocumentUri()));

      if (path != null && isFileExists(dependencyFilePath)) {
        removeCpyFromDep(dependencyFilePath, event.getCopybookName());
      }
    }
  }

  /**
   * This method removes a given string from a given file
   *
   * @param dependencyFilePath - the path to .dep file
   * @param copybookName
   */
  private void removeCpyFromDep(Path dependencyFilePath, String copybookName) {
    try {
      List<String> result = Files.readAllLines(dependencyFilePath);
      List<String> updatedLines =
          result.stream().filter(s -> !s.equals(copybookName)).collect(Collectors.toList());
      // don't write if the lines were not modify
      if (!updatedLines.equals(result)) {
        Files.write(
            dependencyFilePath,
            updatedLines,
            StandardOpenOption.WRITE,
            StandardOpenOption.TRUNCATE_EXISTING);
      }
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  /**
   * This method create the .cobdeps folder that will contains all the dep files required.
   *
   * @return the .cobdeps path that will be used to create the dep file or null if some issue
   *     happens.
   */
  private Path createDependencyFileFolder() {
    Path folderPath =
        Paths.get(
            getWorkspaceFolderPaths().get(0)
                + filesystemSeparator()
                + COBDEPS
                + filesystemSeparator());

    try {
      return Files.createDirectory(folderPath);
    } catch (IOException e) {
      // folder already exists, return the path
      return folderPath;
    }
  }

  /**
   * This method is used to search for a copybook against a given configuration of datasets that
   * represent the sub-path of the copyooks folder
   *
   * @param filename copybook name
   * @return The path of the existent copybook or null if not found
   */
  private Path findCopybook(String filename, String profile, List<String> datasetList) {
    return retrievePathOrNull(filename, generatePathListFromSettings(profile, datasetList));
  }

  private Path retrievePathOrNull(String filename, List<Path> datasetPathList) {
    return datasetPathList.stream()
        .map(it -> applySearch(filename, it))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  /**
   * @param fileName copybook name
   * @param targetFolderPath physical path of workspace where to search for the copybook
   * @return Path of the found copybook in the target folder.
   */
  private Path applySearch(String fileName, Path targetFolderPath) {
    try (Stream<Path> pathStream =
        Files.find(
            targetFolderPath,
            100,
            (path, basicFileAttributes) -> isValidFileFound(path.toFile(), fileName),
            FileVisitOption.FOLLOW_LINKS)) {
      return pathStream.findAny().orElse(null);
    } catch (IOException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  private List<Path> generatePathListFromSettings(String profile, List<String> datasetList) {
    // can happen here that copybooks or internal structure is null
    return datasetList.stream()
        .map(
            it ->
                Paths.get(
                    getCopybookFolder(workspaceFolderPaths.get(0))
                        + filesystemSeparator()
                        + profile
                        + filesystemSeparator()
                        + it))
        .filter(Files::exists)
        .collect(Collectors.toList());
  }

  private Path getCopybookFolder(Path workspaceFolderPath) {
    return Paths.get(workspaceFolderPath + filesystemSeparator() + COPYBOOK_FOLDER_NAME);
  }

  private String getFileNameFromURI(String documentUri) {
    String result = null;
    try {
      result = FilenameUtils.getBaseName(Paths.get(new URI(documentUri)).getFileName().toString());
    } catch (URISyntaxException e) {
      log.error(e.getMessage());
    }
    return result;
  }
}
