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
import com.broadcom.lsp.domain.cobol.databus.model.RegistryId;
import com.broadcom.lsp.domain.cobol.event.model.*;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Stream;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl implements CobolWorkspaceService {
  private final ExecutorService threadPool;
  private final DefaultDataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;
  private Provider<LanguageClient> clientProvider;

  @Inject
  public CobolWorkspaceServiceImpl(
      DefaultDataBusBroker dataBus, Provider<LanguageClient> clientProvider) {
    this.dataBus = dataBus;
    this.clientProvider = clientProvider;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);

    // create a thread pool fixed
    threadPool = Executors.newCachedThreadPool();
  }

  @Override
  public CompletableFuture<List<? extends SymbolInformation>> symbol(WorkspaceSymbolParams params) {
    throw new UnsupportedOperationException();
  }

  /**
   * This is a notification triggered automatically when the user modify configuration settings in
   * the client
   *
   * @param params - LSPSpecification -> The actual changed settings; Actually -> null all the time.
   */
  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams params) {
    /** section and scope has to be set to whatever we agree on for the dependencies graph */
    try {
      fetchSettings(null, null)
          .thenAccept(
              e -> {
                dataBus.postData(FetchedSettingsEvent.builder().content(e).build());
              });
    } catch (Exception e) {
      log.info(e.getMessage());
    }
  }

  /**
   * After client notifies the server that there is a setting change we need to request the client
   * those changing by sending a workspace/configuration JSON request
   *
   * @param section - The configuration section asked for.
   * @param scope - The scope to get the configuration section for.
   * @return - CompletedFuture which contains an object with the settings asked for.
   */
  private CompletableFuture<List<Object>> fetchSettings(String section, String scope) {
    LanguageClient client = clientProvider.get();
    ConfigurationParams params = new ConfigurationParams();
    List<ConfigurationItem> itemList = new ArrayList<>();
    elemToList(itemList, section, scope);
    params.setItems(itemList);

    return client.configuration(params);
  }

  @Nonnull
  private List<ConfigurationItem> elemToList(
      List<ConfigurationItem> list, String section, String scope) {
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(section);
    item.setScopeUri(scope);
    list.add(item);
    return list;
  }

  @Override
  public void didChangeWatchedFiles(@Nonnull DidChangeWatchedFilesParams params) {
    dataBus.invalidateCache();
    log.info("Cache invalidated due to a copybooks file watcher was triggered");
    dataBus.postData(new RunAnalysisEvent());
  }

  /**
   * @param copybookName (i.e. COPYTEST)
   * @return String that represent the content of a found copybook under the workspace folder or
   *     null if copybook is not found
   */
  @Override
  public String getContentByCopybookName(String copybookName) {
    return Optional.ofNullable(getURIByCopybookName(copybookName))
        .map(this::retrieveContentByURI)
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
  @Override
  public Path getURIByCopybookName(String fileName) {
    return getWorkspaceFolders().stream()
        .map(this::getWorkspaceFolderPath)
        .map(it -> searchInDirectory(fileName, it))
        .map(it -> it.orElse(null))
        .filter(Objects::nonNull)
        .findAny()
        .orElse(null);
  }

  /**
   * @param it workspace folder
   * @return the Path of the workspace folder
   * @throws IllegalArgumentException if the URI of WorkspaceFolder is not valid
   */
  @Nonnull
  private Path getWorkspaceFolderPath(WorkspaceFolder it) {
    try {
      return Paths.get(new URI(it.getUri()));
    } catch (URISyntaxException e) {
      throw new IllegalArgumentException("Workspace URI not valid");
    }
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

  /** create the task and pass it to the executor service */
  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    threadPool.submit(
        () -> {
          String name = event.getName();
          Path path = getURIByCopybookName(name);
          String content = Optional.ofNullable(path).map(this::retrieveContentByURI).orElse(null);
          dataBus.postData(
              FetchedCopybookEvent.builder()
                  .name(name)
                  .uri(Optional.ofNullable(path).map(Path::toUri).map(URI::toString).orElse(null))
                  .content(content)
                  .build());
        });
  }

  /**
   * @param uriForFileName of copybook found under workspace folder
   * @return content of the file as String content
   */
  @Nullable
  private String retrieveContentByURI(Path uriForFileName) {
    String content = null;
    try (Stream<String> stream = Files.lines(uriForFileName)) {
      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return content;
  }

  /**
   * Delegated method to search in directory
   *
   * @param fileName name provided by preprocessor
   * @param workspaceFolderPath NIO Path of workspace folder
   * @return a valid path of the copybook file or null if not found
   */
  private Optional<Path> searchInDirectory(String fileName, Path workspaceFolderPath) {
    return Optional.ofNullable(applySearch(fileName, workspaceFolderPath));
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
      log.error(Arrays.toString(e.getStackTrace()));
      return null;
    }
  }

  private boolean isValidExtension(String filePath) {
    List<String> validExtensions = Arrays.asList("cpy", "cbl", "cobol", "cob");
    return validExtensions.stream()
        .anyMatch(ext -> ext.equals(filePath.substring(filePath.lastIndexOf('.') + 1)));
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }
}
