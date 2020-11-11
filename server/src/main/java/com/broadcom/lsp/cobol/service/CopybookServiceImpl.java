/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.core.annotation.CheckThreadInterruption;
import com.broadcom.lsp.cobol.core.annotation.ThreadInterruptAspect;
import com.broadcom.lsp.cobol.core.model.CopybookModel;
import com.broadcom.lsp.cobol.domain.databus.api.DataBusBroker;
import com.broadcom.lsp.cobol.domain.event.model.AnalysisFinishedEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.service.utils.FileSystemService;
import com.google.common.base.Strings;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import static com.broadcom.lsp.cobol.domain.event.model.DataEventType.ANALYSIS_FINISHED_EVENT;
import static com.broadcom.lsp.cobol.service.utils.SettingsParametersEnum.*;
import static java.lang.String.join;
import static java.util.stream.Collectors.toList;

/**
 * This service processes copybook requests and returns content by its name. The service also caches
 * copybook to reduce filesystem load.
 */
@Slf4j
@Singleton
@SuppressWarnings("WeakerAccess")
public class CopybookServiceImpl implements CopybookService, ThreadInterruptAspect {
  private final SettingsService settingsService;
  private final FileSystemService files;

  private final Map<String, Set<String>> copybooksForDownloading =
      new ConcurrentHashMap<>(8, 0.9f, 1);

  private final Cache<String, CopybookModel> copybookCache;

  @Inject
  public CopybookServiceImpl(
      DataBusBroker dataBus,
      SettingsService settingsService,
      FileSystemService files,
      @Named("CACHE-MAX-SIZE") int cacheSize,
      @Named("CACHE-DURATION") int duration,
      @Named("CACHE-TIME-UNIT") String timeUnitName) {
    this.settingsService = settingsService;
    this.files = files;
    copybookCache =
        CacheBuilder.newBuilder()
            .expireAfterWrite(duration, TimeUnit.valueOf(timeUnitName))
            .maximumSize(cacheSize)
            .build();
    dataBus.subscribe(ANALYSIS_FINISHED_EVENT, this);
  }

  @Override
  public void invalidateCache() {
    copybooksForDownloading.clear();
    copybookCache.invalidateAll();
  }

  /**
   * Retrieve and return the copybook by its name. Copybook may cached to limit interactions with
   * the file system.
   *
   * <p>Resolving works in synchronous way. Resolutions with different copybook names will not block
   * each other.
   *
   * @param copybookName - the name of the copybook to be retrieved
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookProcessingMode - text document synchronization type
   * @return a CopybookModel that contains copybook name, its URI and the content
   */
  @CheckThreadInterruption
  public CopybookModel resolve(
      @NonNull String copybookName,
      @NonNull String documentUri,
      @NonNull CopybookProcessingMode copybookProcessingMode) {
    try {
      return copybookCache.get(
          copybookName, () -> resolveSync(copybookName, documentUri, copybookProcessingMode));
    } catch (ExecutionException e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return CopybookModel.empty(copybookName);
    }
  }

  @Override
  public void store(CopybookModel copybookModel) {
    copybookCache.put(copybookModel.getName(), copybookModel);
  }

  /**
   * Resolve the copybook content synchronously. Resolutions with different copybook names will not
   * block each other. The returning copybook model may be null if a copybook could not be resolved.
   *
   * @param copybookName - the name of the copybook to be retrieved
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookProcessingMode - text document synchronization type
   * @return a CopybookModel that contains copybook name, its URI and the content or an empty
   *     copybook if could not be resolved.
   */
  @CheckThreadInterruption
  CopybookModel resolveSync(
      @NonNull String copybookName,
      @NonNull String documentUri,
      @NonNull CopybookProcessingMode copybookProcessingMode) {
    String cobolFileName = files.getNameFromURI(documentUri);
    String uri = retrieveURI(copybookName, cobolFileName);
    if (Strings.isNullOrEmpty(uri)) {
      collectForDownloading(copybookName, copybookProcessingMode, cobolFileName);
      return CopybookModel.empty(copybookName);
    }
    Path file = files.getPathFromURI(uri);
    if (!files.fileExists(file)) {
      return CopybookModel.empty(copybookName);
    }
    return new CopybookModel(copybookName, uri, files.getContentByPath(file));
  }

  /**
   * Depends on DataEvent type it will be handled with {@link #handleAnalysisFinishedEvent} handler.
   *
   * @param event the instance of {@link AnalysisFinishedEvent}
   */
  @Override
  public void observerCallback(DataEvent event) {
    if (event instanceof AnalysisFinishedEvent) {
      handleAnalysisFinishedEvent((AnalysisFinishedEvent) event);
    } else {
      LOG.error("Unexpected DataEvent: {}", event);
    }
  }

  private void collectForDownloading(
      @NonNull String copybookName,
      @NonNull CopybookProcessingMode copybookProcessingMode,
      String cobolFileName) {
    if (copybookProcessingMode.download) {
      copybooksForDownloading
          .computeIfAbsent(cobolFileName, s -> ConcurrentHashMap.newKeySet())
          .add(copybookName);
    }
  }

  private String retrieveURI(@NonNull String copybookName, String cobolFileName) {
    try {
      return retrieveURI(
          settingsService
              .getConfiguration(COPYBOOK_RESOLVE.label, cobolFileName, copybookName)
              .get());
    } catch (InterruptedException | ExecutionException e) { // NOSONAR
      LOG.error(
          String.format(
              "An error occurred while resolving copybook name %s for %s",
              copybookName, cobolFileName),
          e);
    }
    return null;
  }

  /**
   * Sends downloading requests to the Client for copybooks not presented locally, if any.
   *
   * <p>A list of missed copybooks grouped by document URI, including nested copybooks.
   *
   * @param event - document analysis done
   */
  private void handleAnalysisFinishedEvent(AnalysisFinishedEvent event) {
    Set<String> uris = new HashSet<>(event.getCopybookUris());
    String documentUri = event.getDocumentUri();
    uris.add(documentUri);
    String document = files.getNameFromURI(documentUri);

    if (event.getCopybookProcessingMode().download) {
      List<String> copybooksToDownload =
          uris.stream()
              .map(files::getNameFromURI)
              .map(copybooksForDownloading::remove)
              .filter(Objects::nonNull)
              .flatMap(Set::stream)
              .map(joinCopybookPath(event, document))
              .collect(toList());
      if (!copybooksToDownload.isEmpty()) {
        settingsService.getConfigurations(copybooksToDownload);
      }
    }
  }

  private Function<String, String> joinCopybookPath(AnalysisFinishedEvent event, String document) {
    return copybook ->
        join(
            ".",
            COPYBOOK_DOWNLOAD.label,
            getUserInteractionType(event.getCopybookProcessingMode()),
            document,
            copybook);
  }

  private String getUserInteractionType(CopybookProcessingMode copybookProcessingMode) {
    return copybookProcessingMode.userInteraction ? VERBOSE.label : QUIET.label;
  }

  private String retrieveURI(List<Object> result) {
    if (result == null || result.isEmpty()) return "";
    Object obj = result.get(0);
    if (!(obj instanceof JsonPrimitive)) return "";

    return ((JsonPrimitive) obj).getAsString();
  }
}
