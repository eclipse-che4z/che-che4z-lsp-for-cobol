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
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.AnalysisFinishedEvent;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.service.utils.FileSystemService;
import com.google.common.base.Joiner;
import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.net.URI;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;
import java.util.stream.Collectors;

import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.ANALYSIS_FINISHED_EVENT;
import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.REQUIRED_COPYBOOK_EVENT;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_OPEN;
import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.COPYBOOK_RESOLVE;
import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.COPYBOOK_DOWNLOAD;
import static java.util.Optional.ofNullable;

/** This service processes copybook requests and returns content by its name */
@Slf4j
@Singleton
@SuppressWarnings("unchecked")
public class CopybookServiceImpl implements CopybookService {
  private final DataBusBroker dataBus;
  private final SettingsService settingsService;
  private final FileSystemService files;

  private final Map<String, Path> copybookPaths = new ConcurrentHashMap<>(8, 0.9f, 1);
  private final Map<String, Set<String>> copybooksForDownloading = new ConcurrentHashMap<>(8, 0.9f, 1);

  @Inject
  public CopybookServiceImpl(
      DataBusBroker dataBus, SettingsService settingsService, FileSystemService files) {
    this.dataBus = dataBus;
    this.settingsService = settingsService;
    this.files = files;

    dataBus.subscribe(REQUIRED_COPYBOOK_EVENT, this);
    dataBus.subscribe(ANALYSIS_FINISHED_EVENT, this);
  }

  @Override
  public void invalidateURICache() {
    copybookPaths.clear();
    copybooksForDownloading.clear();
  }

  /**
   * Depends on DataEvent type it will be handled with appropriate handler:
   * {@link #handleRequiredCopybookEvent} or {@link #handleAnalysisFinishedEvent}.
   *
   * @param event the instance of {@link RequiredCopybookEvent} or {@link AnalysisFinishedEvent}
   */
  @Override
  public void observerCallback(DataEvent event) {
    if (event instanceof RequiredCopybookEvent) {
      handleRequiredCopybookEvent((RequiredCopybookEvent) event);
    } else if (event instanceof AnalysisFinishedEvent) {
      handleAnalysisFinishedEvent((AnalysisFinishedEvent) event);
    } else {
      log.error("Unexpected DataEvent: {}", event);
    }
  }

  /**
   * Retrieve copybook content by its name, and the document name {@see RequiredCopybookEvent}. It
   * will apply a file system calls only if the {@link TextDocumentSyncType is DID_OPEN} in order to
   * avoid obtaining the copybooks with incomplete names.
   *
   * <p>The retrieved URIs stored in the cache. If the URI points to non-existing file, then the
   * cache invalidated and new request applied.
   *
   * <p>Replies with copybook content and its URI if exists, or with an empty response if the
   * copybook not found. The response sends in any case.
   *
   * @param event - copybook request params
   */
  private void handleRequiredCopybookEvent(RequiredCopybookEvent event) {
    String requiredCopybookName = event.getName();

    if (copybookPaths.containsKey(requiredCopybookName)) {
      Path file = copybookPaths.get(requiredCopybookName);
      if (files.fileExists(file)) {
        sendResponse(requiredCopybookName, files.getContentByPath(file), file);
        return;
      } else {
        copybookPaths.remove(requiredCopybookName);
      }
    }
    if (DID_OPEN.name().equals(event.getTextDocumentSyncType())) {
      String cobolFileName = files.getNameFromURI(event.getDocumentUri());
      settingsService
              .getConfiguration(COPYBOOK_RESOLVE.label, cobolFileName, requiredCopybookName)
              .thenAccept(sendResponse(cobolFileName, requiredCopybookName));
    } else {
      sendResponse(requiredCopybookName, null, null);
    }
  }

  /**
   * Sends downloading requests to the Client for copybooks not presented locally, if any.
   *
   * <p>A list of missed copybooks grouped by document URI.
   *
   * @param event - document analysis done
   */
  private void handleAnalysisFinishedEvent(AnalysisFinishedEvent event) {
    String cobolFileName = files.getNameFromURI(event.getDocumentUri());
    if (copybooksForDownloading.containsKey(cobolFileName)) {
      settingsService
              .getConfigurations(copybooksForDownloading.remove(cobolFileName).stream()
                      .map(copybook -> Joiner.on(".").join(COPYBOOK_DOWNLOAD.label, cobolFileName, copybook))
                      .collect(Collectors.toList()));
    }
  }

  private Consumer<List<Object>> sendResponse(String cobolFileName, String requiredCopybookName) {
    return result -> {
      String uri = retrieveURI(result);
      if (uri.isEmpty()) {
        copybooksForDownloading.computeIfAbsent(cobolFileName, s -> ConcurrentHashMap.newKeySet())
                .add(requiredCopybookName);
      }
      dataBus.postData(fetchCopybook(requiredCopybookName, uri));
    };
  }

  private void sendResponse(String requiredCopybookName, String content, Path path) {
    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(toURI(path))
            .content(content)
            .build());
  }

  private FetchedCopybookEvent fetchCopybook(String requiredCopybookName, String uri) {
    if (uri.isEmpty()) {
      return FetchedCopybookEvent.builder().name(requiredCopybookName).build();
    }
    Path file = files.getPathFromURI(uri);
    if (file == null) {
      return FetchedCopybookEvent.builder().name(requiredCopybookName).build();
    }
    copybookPaths.put(requiredCopybookName, file);

    return FetchedCopybookEvent.builder()
        .name(requiredCopybookName)
        .uri(toURI(file))
        .content(files.getContentByPath(file))
        .build();
  }

  private String toURI(Path file) {
    return ofNullable(file).map(Path::toUri).map(URI::toString).orElse(null);
  }

  private String retrieveURI(List<Object> result) {
    if (result == null || result.isEmpty()) return "";
    Object obj = result.get(0);
    if (!(obj instanceof JsonPrimitive)) return "";

    return ((JsonPrimitive) obj).getAsString();
  }
}
