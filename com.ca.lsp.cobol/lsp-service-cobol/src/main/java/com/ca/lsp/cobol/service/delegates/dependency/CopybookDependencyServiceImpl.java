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
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.TextDocumentSyncType;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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
   * This method is invoked to handle the insertion of a copybook name into the dependency file
   *
   * @param event contains information the copybook (document URI and event sync type)
   * @param requiredCopybookName name that represent the new copybook that is supposed to be written
   */
  @Override
  public void addCopybookInDepFile(RequiredCopybookEvent event, String requiredCopybookName) {
    if (isFileInDidOpen(event) || isProcessingACopybbok(event)) {
      writeCopybookInDepFile(requiredCopybookName, event.getDocumentUri());
    }
  }

  private boolean isProcessingACopybbok(RequiredCopybookEvent event) {
    return event
            .getTextDocumentSyncType()
            .equalsIgnoreCase(TextDocumentSyncType.DID_CHANGE.toString())
        && getExtensionFromURI(event.getDocumentUri()).equalsIgnoreCase("cpy");
  }

  /**
   * This method return true if the file is opened in DID_OPEN, false otherwise
   *
   * @param event sent on the databus
   * @return true if the file is opened in DID_OPEN mode, false otherwise
   */
  @Override
  public boolean isFileInDidOpen(RequiredCopybookEvent event) {
    return event.getTextDocumentSyncType() != null
        && TextDocumentSyncType.valueOf(event.getTextDocumentSyncType())
            .equals(TextDocumentSyncType.DID_OPEN);
  }

  private void createDependencyFileFolder() {
    createFolder(getDependencyFolderPath());
  }

  public void writeCopybookInDepFile(String requiredCopybookName, String documentUri) {
    String cobolFileName = getNameFromURI(documentUri);

    writeDependency(
        getPath(getDependencyFolderPath().toString(), cobolFileName + DEP_EXTENSION),
        cobolFileName,
        requiredCopybookName);
  }

  private Path getDependencyFolderPath() {
    return getPath(getWorkspaceFolderPaths().get(0).toString(), COBDEPS);
  }

  private void writeDependency(
      Path dependencyFolder, String cobolFileName, String requiredCopybookName) {

    if (!isFileExists(dependencyFolder)) {
      generateDependencyFile(cobolFileName);
    }
    updateDependencyList(dependencyFolder, requiredCopybookName);
  }

  /**
   * This method update an already defined dependency file with a new copybook content
   *
   * @param dependencyFilePath reference to the dependency file
   * @param copybookName the copybook name that will be written in the dependency file
   */
  @Override
  public void updateDependencyList(Path dependencyFilePath, String copybookName) {
    if (isCopybokNotPresentInDepFile(copybookName, getContentFromFile(dependencyFilePath))) {
      writeInFile(dependencyFilePath, copybookName);
    }
  }

  private boolean isCopybokNotPresentInDepFile(String copybookName, List<String> lines) {
    return lines != null && !lines.contains(copybookName);
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
    createDependencyFileFolder();
    createFile(getPath(getDependencyFolderPath().toString(), cobolFileName + DEP_EXTENSION));
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
  // TODO: Refactor
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
  // TODO: Refactor this..
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

  private List<Path> generatePathListFromSettings(String profile, List<String> datasetList) {
    // TODO: Check if is possible replace the filer..
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
