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
package org.eclipse.lsp.cobol.service;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.eventbus.Subscribe;
import com.google.common.util.concurrent.ExecutionError;
import com.google.common.util.concurrent.UncheckedExecutionException;
import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.annotation.CheckThreadInterruption;
import org.eclipse.lsp.cobol.core.annotation.ThreadInterruptAspect;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

import static java.lang.String.join;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;

/**
 * This service processes copybook requests and returns content by its name. The service also caches
 * copybook to reduce filesystem load.
 */
@Slf4j
@Singleton
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
    dataBus.subscribe(this);
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
    } catch (ExecutionException | UncheckedExecutionException | ExecutionError e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return new CopybookModel(copybookName, null, null);
    }
  }

  @Override
  public void store(CopybookModel copybookModel) {
    copybookCache.put(copybookModel.getName(), copybookModel);
  }

  @CheckThreadInterruption
  CopybookModel resolveSync(
      @NonNull String copybookName,
      @NonNull String documentUri,
      @NonNull CopybookProcessingMode copybookProcessingMode)
      throws ExecutionException, InterruptedException {
    String cobolFileName = files.getNameFromURI(documentUri);
    String uri =
        retrieveURI(
            settingsService
                .getConfiguration(COPYBOOK_RESOLVE.label, cobolFileName, copybookName)
                .get());
    if (uri.isEmpty()) {
      if (copybookProcessingMode.download && cobolFileName != null) {
        Optional.ofNullable(copybooksForDownloading.computeIfAbsent(cobolFileName, s -> ConcurrentHashMap.newKeySet()))
            .ifPresent(it -> it.add(copybookName));
      }
      return new CopybookModel(copybookName, null, null);
    }
    Path file = files.getPathFromURI(uri);
    if (files.fileExists(file)) {
      return new CopybookModel(copybookName, uri, files.getContentByPath(file));
    } else {
      return new CopybookModel(copybookName, null, null);
    }
  }

  /**
   * Sends downloading requests to the Client for copybooks not presented locally, if any.
   *
   * <p>A list of missed copybooks grouped by document URI, including nested copybooks.
   *
   * @param event - document analysis done
   */
  @Subscribe
  public void handleAnalysisFinishedEvent(AnalysisFinishedEvent event) {
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
              .map(
                  copybook ->
                      join(
                          ".",
                          COPYBOOK_DOWNLOAD.label,
                          getUserInteractionType(event.getCopybookProcessingMode()),
                          document,
                          copybook))
              .collect(toList());
      if (!copybooksToDownload.isEmpty()) {
        settingsService.getConfigurations(copybooksToDownload);
      }
    }
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
