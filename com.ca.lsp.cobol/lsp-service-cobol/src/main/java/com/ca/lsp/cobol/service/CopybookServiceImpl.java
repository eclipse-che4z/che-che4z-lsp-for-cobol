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

import javax.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.ca.lsp.cobol.service.delegates.communications.CopybookMessageInfo.*;
import static com.ca.lsp.cobol.service.utils.FileSystemUtil.*;

@Singleton
@Slf4j
public class CopybookServiceImpl implements CopybookService {
  private static final String COPYBOOK_FOLDER_NAME = ".copybooks";
  private final DataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;
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
   * Store the informations about the workspace folder defined by the client IDE
   *
   * @param workspaceFolders list of workspace folders sent by the client to the server
   */
  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  /**
   * @param uriForFileName of copybook found under workspace folder
   * @return content of the file as String content
   */
  @Nullable
  String retrieveContentByPath(Path uriForFileName) {
    String content = null;
    try (Stream<String> stream = Files.lines(uriForFileName)) {
      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse("");
    } catch (IOException e) {
      log.error(e.getMessage());
    }
    return content;
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
    return getWorkspaceFoldersAsPathList().stream()
        .map(it -> applySearch(fileName, getCopybookFolder(it)))
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
  public Path findCopybook(String filename, String profile, List<String> datasetList) {
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
    // can happen here that copybooks or internal structure is null
    return datasetList.stream()
        .map(
            it ->
                Paths.get(
                    getCopybookFolder(getWorkspaceFoldersAsPathList().get(0))
                        + filesystemSeparator()
                        + profile
                        + filesystemSeparator()
                        + it))
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
  }

  /**
   * @param fileName copybook name
   * @param targetFolderPath physical path of workspace where to search for the copybook
   * @return Path of the found copybook in the target folder.
   */
  protected Path applySearch(String fileName, Path targetFolderPath) {
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
        .map(this::resolveUriPath)
        .collect(Collectors.toList());
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  /**
   * Normalize the URI defined in the workspace to get a NIO Path object that will be used within
   * the FileSystemService, example: [input:
   * file:///C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy] --> [output:
   * C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy]
   *
   * @param it workspace folder
   * @return the Path of the workspace folder
   * @throws IllegalArgumentException if the URI of WorkspaceFolder is not valid
   */
  private Path resolveUriPath(WorkspaceFolder it) {
    try {
      return Paths.get(new URI(it.getUri()).normalize());
    } catch (URISyntaxException e) {
      log.error(e.getMessage());
    }
    return null;
  }

  private Path getCopybookFolder(Path workspaceFolderPath) {
    return Paths.get(workspaceFolderPath + filesystemSeparator() + COPYBOOK_FOLDER_NAME);
  }

  /** create the task and pass it to the executor service */
  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String requiredCopybookName = event.getName();
    String content = null;
    Path path;

    // if the document is in DID_OPEN mode is possible write on dependency file..
    if (isFileInDidOpen(event)) {
      dependencyService.setWorkspaceFolderPaths(getWorkspaceFoldersAsPathList());
      dependencyService.addCopybookInDepFile(requiredCopybookName, event.getDocumentUri());
    }

    if (missingInformationToSearchCopybooks()) {
      selectAppropriateMessageForCommunication();

      dataBus.postData(
          FetchedCopybookEvent.builder()
              .name(requiredCopybookName)
              .uri(null)
              .content(null)
              .build());
      return;
    }

    ConfigurationSettingsStorable configurationSettingsStorable =
        configurationSettingsStorableProvider.get();

    // search the copybook against the target folders provided from the settings
    path =
        findCopybook(
            requiredCopybookName,
            (String) configurationSettingsStorable.getProfiles(),
            configurationSettingsStorable.getPaths());

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
    if (copybookFolderNotDefined()) {
      communications.notifyCopybookMessageInfo(COPYBOOK_FOLDER_MISS);
    }

    if (settingsNotDefined()) {
      communications.notifyCopybookMessageInfo(NO_SETTINGS);
    } else if (datasetSettingsNotDefined()) {
      communications.notifyCopybookMessageInfo(NO_DATASET_IN_SETTINGS);
    }
  }

  private boolean datasetSettingsNotDefined() {
    return configurationSettingsStorableProvider.get().getPaths() == null;
  }

  private boolean missingInformationToSearchCopybooks() {
    return copybookFolderNotDefined() || settingsNotDefined() || datasetSettingsNotDefined();
  }

  private boolean settingsNotDefined() {
    return (configurationSettingsStorableProvider.get().getProfiles() == null)
        && (configurationSettingsStorableProvider.get().getPaths() == null);
  }

  private boolean copybookFolderNotDefined() {
    return !getCopybookFolder(getWorkspaceFoldersAsPathList().get(0)).toFile().exists();
  }

  private boolean isFileInDidOpen(RequiredCopybookEvent event) {
    return event.getTextDocumentSyncType() != null
        && TextDocumentSyncType.valueOf(event.getTextDocumentSyncType())
            .equals(TextDocumentSyncType.DID_OPEN);
  }
}
