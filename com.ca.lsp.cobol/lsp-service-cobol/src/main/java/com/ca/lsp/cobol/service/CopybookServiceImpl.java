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

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyService;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.net.URI;
import java.nio.file.Path;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.ca.lsp.cobol.service.utils.FileSystemUtils.*;

@Singleton
@Slf4j
public class CopybookServiceImpl implements CopybookService {
  private static final String COPYBOOK_FOLDER_NAME = ".copybooks";
  private final DataBusBroker dataBus;
  private List<Path> workspaceFolderPaths;

  private CopybookDependencyService dependencyService;
  private final Provider<ConfigurationSettingsStorable> configurationSettingsStorableProvider;

  @Inject
  public CopybookServiceImpl(
      DataBusBroker dataBus,
      Provider<ConfigurationSettingsStorable> configurationSettingsStorableProvider,
      CopybookDependencyService dependencyService) {
    this.dataBus = dataBus;
    this.configurationSettingsStorableProvider = configurationSettingsStorableProvider;
    this.dependencyService = dependencyService;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  /**
   * Store the information about the workspace folders defined by the client IDE
   *
   * @param workspaceFolders list of workspace folders sent by the client to the server
   */
  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    createPathListFromWorkspaceFolders(workspaceFolders);
    setPathListInDependencyFile();
  }

  private void createPathListFromWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    workspaceFolderPaths =
        Optional.ofNullable(workspaceFolders)
            .map(Collection::stream)
            .orElseGet(Stream::empty)
            .filter(Objects::nonNull)
            .map(this::resolveURI)
            .collect(Collectors.toList());
  }

  private void setPathListInDependencyFile() {
    dependencyService.setWorkspaceFolderPaths(workspaceFolderPaths);
  }

  /**
   * From a given copybook name (without file extension) this method will return the URI of the file
   * - if exists applying a deep search in the copybook folder. No filtered folders where to specify
   * the search are defined.
   *
   * @param fileName (i.e. COPYTEST)
   * @return NIO Path of file (i.e. C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy) or null
   *     if not found. This case should be covered by an appropriate diagnostic message using the
   *     Communication service delegate object.
   */
  @Override
  public Path findCopybook(String fileName) {
    return workspaceFolderPaths.stream()
        .map(it -> applySearch(fileName, getCopybookBaseFolder(it)))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  /**
   * This method is used to search for a copybook against a given configuration of datasets that
   * represent the sub-path of the copyooks folder
   *
   * @param filename copybook name
   * @return The path of the existent copybook or null if not found
   */
  @Override
  public Path findCopybook(String filename, List<String> datasetList) {
    return retrievePathOrNull(
        filename,
        getPathList(getCopybookBaseFolder(workspaceFolderPaths.get(0)).toString(), datasetList));
  }

  private Path retrievePathOrNull(String filename, List<Path> datasetPathList) {
    return datasetPathList.stream()
        .map(it -> applySearch(filename, it))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  private Path resolveURI(WorkspaceFolder workspaceFolder) {
    return getPathFromURI(workspaceFolder.getUri());
  }

  private Path getCopybookBaseFolder(Path workspaceFolderPath) {
    return getPath(workspaceFolderPath.toString(), COPYBOOK_FOLDER_NAME);
  }

  /** create the task and pass it to the executor service */
  @Override
  public void observerCallback(RequiredCopybookEvent event) {

    String requiredCopybookName = event.getName();
    dependencyService.addCopybookInDepFile(event, requiredCopybookName);
    resolveCopybookContent(requiredCopybookName);
  }

  /**
   * This method is delegated to check that the user have right settings to retrieve the content of
   * a copybook from a given name
   *
   * @param requiredCopybookName name of the copybook for what is necessary retrieve the content if
   *     exists.
   */
  private void resolveCopybookContent(String requiredCopybookName) {
    ConfigurationSettingsStorable configurationSettingsStorable =
        configurationSettingsStorableProvider.get();
    if (configurationSettingsStorable == null) {
      publishOnDatabus(requiredCopybookName);
      return;
    }

    Path path = findCopybook(requiredCopybookName, configurationSettingsStorable.getPaths());
    if (isFileExists(path)) {
      publishOnDatabus(requiredCopybookName, getContentByPath(path), path);
    } else {
      publishOnDatabus(requiredCopybookName);
    }
  }

  private void publishOnDatabus(String requiredCopybookName, String content, Path path) {
    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(Optional.ofNullable(path).map(Path::toUri).map(URI::toString).orElse(null))
            .content(content)
            .build());
  }

  private void publishOnDatabus(String requiredCopybookName) {
    dataBus.postData(FetchedCopybookEvent.builder().name(requiredCopybookName).build());
  }
}
