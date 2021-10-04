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
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

import static java.lang.String.join;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.PREF_IMPLICIT;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;

/**
 * This service processes copybook requests and returns content by its name. The service also caches
 * copybook to reduce filesystem load.
 */
@Slf4j
@Singleton
@SuppressWarnings("UnstableApiUsage")
public class CopybookServiceImpl implements CopybookService {
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
   * Retrieve and return the copybook by its name. Copybook may be cached to limit interactions with
   * the file system.
   *
   * <p>Resolving works in synchronous way. Resolutions with different copybook names will not block
   * each other.
   *
   * @param copybookName - the name of the copybook to be retrieved
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql
   *     server
   * @return a CopybookModel that contains copybook name, its URI and the content
   */
  public CopybookModel resolve(
      @NonNull String copybookName,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig) {
    try {
      return copybookCache.get(
          copybookName, () -> resolveSync(copybookName, documentUri, copybookConfig));
    } catch (ExecutionException | UncheckedExecutionException | ExecutionError e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return new CopybookModel(copybookName, null, null);
    }
  }

  @Override
  public void store(CopybookModel copybookModel) {
    copybookCache.put(copybookModel.getName(), copybookModel);
  }

  private CopybookModel resolveSync(
      @NonNull String copybookName,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig)
      throws ExecutionException, InterruptedException {
    ThreadInterruptionUtil.checkThreadInterrupted();
    String cobolFileName = files.getNameFromURI(documentUri);

    return SettingsService.getValueAsString(
            settingsService
                .getConfiguration(COPYBOOK_RESOLVE.label, cobolFileName, copybookName)
                .get())
        .map(uri -> loadCopybook(uri, copybookName, cobolFileName))
        .orElseGet(() -> processEmptyUri(copybookName, copybookConfig, cobolFileName));
  }

  private CopybookModel processEmptyUri(
      String copybookName, CopybookConfig copybookConfig, String cobolFileName) {
    return retrievePredefinedCopybook(copybookName)
        .map(it -> it.uriForBackend(copybookConfig.getSqlBackend()))
        .map(
            uri ->
                new CopybookModel(
                    copybookName, PREF_IMPLICIT + uri, readContentForImplicitCopybook(uri)))
        .orElseGet(() -> registerForDownloading(copybookName, cobolFileName));
  }

  private CopybookModel registerForDownloading(String copybookName, String cobolFileName) {
    Optional.of(
            copybooksForDownloading.computeIfAbsent(
                cobolFileName, s -> ConcurrentHashMap.newKeySet()))
        .ifPresent(it -> it.add(copybookName));
    return new CopybookModel(copybookName, null, null);
  }

  private CopybookModel loadCopybook(String uri, String copybookName, String cobolFileName) {
    Path file = files.getPathFromURI(uri);
    return files.fileExists(file)
        ? new CopybookModel(copybookName, uri, files.getContentByPath(Objects.requireNonNull(file)))
        : registerForDownloading(copybookName, cobolFileName);
  }

  /**
   * Retrieve optional {@link PredefinedCopybooks} for the given name. Checks if the copybook name
   * is implicitly (not an explicit copybook file) defined.
   *
   * <p>Application can use SQLCA and SQLDA names to define communication and description areas as
   * copybooks and both are implicitly defined by either co-processor or pre-processor.
   *
   * @param copybookName - the name of copybook to check
   * @return true if copybook name is one of SQLDA or SQLCA
   */
  private Optional<PredefinedCopybooks.Copybook> retrievePredefinedCopybook(
      String copybookName) {
    return Optional.ofNullable(PredefinedCopybooks.forName(copybookName));
  }

  private String readContentForImplicitCopybook(String resourcePath) {
    InputStream inputStream = CopybookServiceImpl.class.getResourceAsStream(resourcePath);
    String content = null;
    try {
      content =
          files.readFromInputStream(Objects.requireNonNull(inputStream), StandardCharsets.UTF_8);
    } catch (IOException e) {
      LOG.error("Implicit copybook is not loaded. ", e);
    }
    return content;
  }

  /**
   * Send downloading requests to the Client for copybooks not presented locally, if any.
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
}
