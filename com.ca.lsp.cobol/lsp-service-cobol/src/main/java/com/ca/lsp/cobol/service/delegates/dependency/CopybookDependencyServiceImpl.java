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

import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.service.CopybookServiceImpl;
import com.ca.lsp.cobol.service.TextDocumentSyncType;
import com.google.common.annotations.Beta;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import static com.ca.lsp.cobol.service.utils.FileSystemUtils.*;

/** This class is responsible for everything is related with the copybook dependency manangement */
@Slf4j
@Singleton
public class CopybookDependencyServiceImpl implements CopybookDependencyService {
  private static final String COBDEPS = ".cobdeps";
  private static final String DEP_EXTENSION = ".dep";
  @Getter private List<Path> workspaceFolderPaths;

  /**
   * TODO: Add description
   *
   * @param event contains information the copybook (document URI and event sync type)
   * @param requiredCopybookName name that represent the new copybook that is supposed to go into
   * @param targetPaths
   */
  @Override
  public void invoke(
      RequiredCopybookEvent event, String requiredCopybookName, List<Path> targetPaths) {
    setWorkspaceFolderPaths(targetPaths);
    if (isFileInDidOpen(event)) {
      addCopybookInDepFile(requiredCopybookName, event.getDocumentUri());
    }
  }

  /**
   * @param event
   * @return
   */
  @Override
  public boolean isFileInDidOpen(RequiredCopybookEvent event) {
    return event.getTextDocumentSyncType() != null
        && TextDocumentSyncType.valueOf(event.getTextDocumentSyncType())
            .equals(TextDocumentSyncType.DID_OPEN);
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
    String cobolFileName = getCobolFileNameFromUri(documentUri);
    Path dependencyFolder = createDependencyFileFolder();
    Path dependencyFile = retrieveDependencyFile(dependencyFolder, cobolFileName);

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

  private Path retrieveDependencyFile(Path dependencyFolderPath, String cobolFileName) {
    return Paths.get(dependencyFolderPath + filesystemSeparator() + cobolFileName + DEP_EXTENSION);
  }

  private String getCobolFileNameFromUri(String documentUri) {
    String result = null;
    try {
      result = FilenameUtils.getBaseName(Paths.get(new URI(documentUri)).getFileName().toString());
    } catch (URISyntaxException e) {
      log.error(e.getMessage());
    }
    return result;
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
}
