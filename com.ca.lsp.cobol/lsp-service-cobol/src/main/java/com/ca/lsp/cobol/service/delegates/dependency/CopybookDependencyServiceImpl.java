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

import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Objects;

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
    if (isFileInDidOpen(event) || isCopybookProcessed(event)) {
      writeCopybookInDepFile(requiredCopybookName, event.getDocumentUri());
    }
  }

  private boolean isCopybookProcessed(RequiredCopybookEvent event) {
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

//    writeDependency(
//        getPath(getDependencyFolderPath().toString(), cobolFileName + DEP_EXTENSION),
//        cobolFileName,
//        requiredCopybookName);
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
    if (isCopybookNotPresentInDepFile(copybookName, getContentFromFile(dependencyFilePath))) {
      writeInFile(dependencyFilePath, copybookName, StandardOpenOption.APPEND);
    }
  }

  private boolean isCopybookNotPresentInDepFile(String copybookName, List<String> lines) {
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
  public void observerCallback(CopybookDepEvent event) {
    // we are not checking .dep on DID_OPEN because on DID_OPEN the file is updated with the
    // required copybooks
    if (event.getTextDocumentSync().equals(TextDocumentSyncType.DID_CHANGE.name())) {
      Path dependencyFilePath = getDependencyFilePath(event);
      if (getCopybookPath(event) != null && isFileExists(dependencyFilePath)) {
        removeIfPresent(event.getCopybookName(), dependencyFilePath);
      }
    }
  }

  private Path getDependencyFilePath(CopybookDepEvent event) {
    return getPath(
        getWorkspaceFolderPaths().get(0).toString(),
        COBDEPS,
        getNameFromURI(event.getDocumentUri()) + DEP_EXTENSION);
  }

  private Path getCopybookPath(CopybookDepEvent event) {
    return getTargetFolders().stream()
        .map(it -> applySearch(event.getCopybookName(), it))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  private List<Path> getTargetFolders() {
    return getPathList(getCopybookFolder(), configurationSettingsStorableProvider.get().getPaths());
  }

  private String getCopybookFolder() {
    return getPath(workspaceFolderPaths.get(0).toString(), COPYBOOK_FOLDER_NAME).toString();
  }
}
