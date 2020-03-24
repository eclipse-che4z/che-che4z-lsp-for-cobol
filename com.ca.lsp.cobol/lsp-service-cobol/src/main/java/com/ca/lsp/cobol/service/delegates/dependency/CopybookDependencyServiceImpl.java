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

import java.nio.file.Path;
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
   * This method is invoked to handle the insertion of a copybook name into the dependency file
   *
   * @param event contains information the copybook (document URI and event sync type)
   * @param requiredCopybookName name that represent the new copybook that is supposed to be written
   * @param targetPaths the reference path where create or search a dependency file.
   */
  @Override
  public void addCopybookInDepFile(
      RequiredCopybookEvent event, String requiredCopybookName, List<Path> targetPaths) {
    setWorkspaceFolderPaths(targetPaths);
    if (isFileInDidOpen(event) || isNestedCopybookBeProcessed(event)) {
      writeCopybookInDepFile(requiredCopybookName, event.getDocumentUri());
    }
  }

  private boolean isNestedCopybookBeProcessed(RequiredCopybookEvent event) {
    return isDocumentInDidOpen(event)
        && getExtensionFromURI(event.getDocumentUri()).equalsIgnoreCase("cpy");
  }

  private boolean isDocumentInDidOpen(RequiredCopybookEvent event) {
    return event
        .getTextDocumentSyncType()
        .equalsIgnoreCase(TextDocumentSyncType.DID_CHANGE.toString());
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

  /**
   * This method write the copybook name sent by the {@link CopybookServiceImpl} into the dependency
   * file.
   *
   * @param requiredCopybookName copybook name that should be written in the dependency file
   * @param documentUri extract the name of the cobol file from the URI
   */
  @Beta
  @Override
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

  private void createDependencyFileFolder() {
    createFolder(getPath(getWorkspaceFolderPaths().get(0).toString(), COBDEPS));
  }
}
