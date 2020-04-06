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
import com.ca.lsp.cobol.service.delegates.communications.Communications;
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

import static com.ca.lsp.cobol.service.delegates.communications.CopybookMessageInfo.*;
import static com.ca.lsp.cobol.service.utils.FileSystemUtils.*;

@Singleton
@Slf4j
public class CopybookServiceImpl implements CopybookService {
  private static final String COPYBOOK_FOLDER_NAME = ".copybooks";
  private final DataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;
  private List<Path> workspaceFolderPaths;

  private CopybookDependencyService dependencyService;
  private final Provider<ConfigurationSettingsStorable> configurationSettingsStorableProvider;
  private Communications communications;

  @Inject
  public CopybookServiceImpl(
      DataBusBroker dataBus,
      Provider<ConfigurationSettingsStorable> configurationSettingsStorableProvider,
      CopybookDependencyService dependencyService,
      Communications communications) {
    this.dataBus = dataBus;
    this.configurationSettingsStorableProvider = configurationSettingsStorableProvider;
    this.dependencyService = dependencyService;
    this.communications = communications;

    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  /**
   * Store the information about the workspace folders defined by the client IDE
   *
   * @param workspaceFolders list of workspace folders sent by the client to the server
   */
  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
    createPathListFromWorkspaceFolders();
    setPathListInDependencyFile();
  }

  private void createPathListFromWorkspaceFolders() {
    workspaceFolderPaths = getWorkspaceFoldersAsPathList();
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
  public Path findCopybook(String filename, List<String> paths) {
    return retrievePathOrNull(filename, generatePathListFromSettings(paths));
  public Path findCopybook(String filename, String profile, List<String> datasetList) {
    return retrievePathOrNull(
        filename,
        getPathList(
            getCopybookBaseFolder(workspaceFolderPaths.get(0)).toString(), profile, datasetList));
  }

  private Path retrievePathOrNull(String filename, List<Path> datasetPathList) {
    return datasetPathList.stream()
        .map(it -> applySearch(filename, it))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  private List<Path> generatePathListFromSettings(List<String> paths) {
    // can happen here that copybooks or internal structure is null
    return paths.stream()
        .map(it -> Paths.get(getCopybookFolder(getWorkspaceFoldersAsPathList().get(0)) + it))
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
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

  private List<Path> getWorkspaceFoldersAsPathList() {
    return Optional.ofNullable(getWorkspaceFolders())
        .map(Collection::stream)
        .orElseGet(Stream::empty)
        .filter(Objects::nonNull)
        .map(this::resolveURI)
        .collect(Collectors.toList());
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
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

    //changes coming from dev
      // dependencyService.addCopybookInDepFile(event, requiredCopybookName);
      //    resolveCopybookContent(requiredCopybookName);


    // search the copybook against the target folders provided from the settings
    path = findCopybook(requiredCopybookName, configurationSettingsStorable.getPaths());

    if (isFileExists(path)) {
      content = retrieveContentByPath(path);
    }

    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(Optional.ofNullable(path).map(Path::toUri).map(URI::toString).orElse(null))
            .content(content)
            .build());
  }

  private void selectAppropriateMessageForCommunication() {
    checkCopybookFolderNotDefined();
    checkSettingsNotDefined();
  }

  private void checkSettingsNotDefined() {
    if (settingsNotDefined()) {
      communications.notifyCopybookMessageInfo(NO_SETTINGS);
    } else if (datasetSettingsNotDefined()) {
      communications.notifyCopybookMessageInfo(NO_DATASET_IN_SETTINGS);
    }
  }

  private void checkCopybookFolderNotDefined() {
    if (copybookFolderNotDefined()) {
      communications.notifyLogMessageInfo(COPYBOOK_FOLDER_MISS);
    }
  }

  private boolean datasetSettingsNotDefined() {
    return configurationSettingsStorableProvider.get().getPaths().isEmpty();
  }

  /**
   * This method is delegated to check that the user have right settings to search for copybooks and
   * retrieve its content in the affermative case
   *
   * @param requiredCopybookName name of the copybook for what is necessary retrieve the content if
   *     exists.
   */
  private void resolveCopybookContent(String requiredCopybookName) {
    if (settingsAreIncomplete(requiredCopybookName)) {
      return;
    }

    ConfigurationSettingsStorable configurationSettingsStorable =
        configurationSettingsStorableProvider.get();

    Path path =
        findCopybook(
            requiredCopybookName,
            configurationSettingsStorable.getProfiles().toString(),
            configurationSettingsStorable.getPaths());
    if (isFileExists(path)) {
      publishOnDatabus(requiredCopybookName, getContentByPath(path), path);
    } else {
      publishOnDatabus(requiredCopybookName);
    }
  }

  private boolean settingsAreIncomplete(String requiredCopybookName) {
    if (copybookFolderNotDefined() || settingsNotDefined() || datasetSettingsNotDefined()) {
      publishMissingInfoForCopybooks(requiredCopybookName);
      return true;
    }
    return false;
  }

  private void publishMissingInfoForCopybooks(String requiredCopybookName) {
    selectAppropriateMessageForCommunication();
    publishOnDatabus(requiredCopybookName);
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

  private boolean settingsNotDefined() {
    return configurationSettingsStorableProvider.get() == null;
  }

  private boolean copybookFolderNotDefined() {
    return !getCopybookBaseFolder(workspaceFolderPaths.get(0)).toFile().exists();
  }
}
