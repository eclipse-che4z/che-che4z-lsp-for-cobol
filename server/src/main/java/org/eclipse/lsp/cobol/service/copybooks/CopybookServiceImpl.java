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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.collect.ImmutableMap;
import com.google.common.eventbus.Subscribe;
import com.google.common.util.concurrent.ExecutionError;
import com.google.common.util.concurrent.UncheckedExecutionException;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookName;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProvider;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.FileContentProvider;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import static java.lang.String.join;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.PREF_IMPLICIT;
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
  public final TextPreprocessor preprocessor;

  private final Map<String, Set<CopybookName>> copybooksForDownloading =
      new ConcurrentHashMap<>(8, 0.9f, 1);

  private final CopybookCache copybookCache;

  @Inject
  public CopybookServiceImpl(
      DataBusBroker dataBus,
      SettingsService settingsService,
      FileSystemService files,
      TextPreprocessor preprocessor,
      CopybookCache copybookCache) {
    this.settingsService = settingsService;
    this.files = files;
    this.preprocessor = preprocessor;
    this.copybookCache = copybookCache;
    dataBus.subscribe(this);
  }

  @Override
  public void invalidateCache() {
    LOG.debug("Copybooks for downloading: {}", copybooksForDownloading);
    LOG.debug("Copybook cache: {}", copybookCache);
    LOG.debug("Cache invalidated");
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
   * @param programDocumentUri - the currently processing program document
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql
   *     server
   * @param preprocess - indicates if copybook needs to be preprocessed after resolving
   * @return a CopybookModel that contains copybook name, its URI and the content
   */
  public CopybookModel resolve(
      @NonNull CopybookName copybookName,
      @NonNull String programDocumentUri,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig,
      boolean preprocess) {
    try {
      return copybookCache.get(copybookName, programDocumentUri, () -> {
        CopybookModel copybookModel = resolveSync(copybookName, programDocumentUri, copybookConfig);
        if (preprocess) {
          copybookModel = cleanupCopybook(copybookModel);
        }
        return copybookModel;
      });
    } catch (ExecutionException | UncheckedExecutionException | ExecutionError e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return new CopybookModel(copybookName, null, null);
    }
  }

  @Override
  public void store(CopybookModel copybookModel, String documentUri) {
    copybookCache.store(copybookModel, documentUri);
  }

  private CopybookModel resolveSync(
      @NonNull CopybookName copybookName,
      @NonNull String programUri,
      @NonNull CopybookConfig copybookConfig) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    final String mainProgramFileName = files.getNameFromURI(programUri);
    LOG.debug(
        "Trying to resolve copybook {} for {}, using config {}",
        copybookName,
        programUri,
        copybookConfig);
    return tryResolveCopybookFromWorkspace(copybookName, mainProgramFileName)
        .orElseGet(
            () ->
                tryResolvePredefinedCopybook(copybookName, copybookConfig)
                    .orElseGet(() -> registerForDownloading(copybookName, mainProgramFileName)));
  }

  /**
   * Retrieve optional {@link CopybookModel} of the {@link PredefinedCopybooks} for the given name
   * if it is predefined.
   *
   * @param copybookName - the name of copybook to check
   * @param copybookConfig - configuration for copybook resolution
   * @return optional model of a predefined copybook if it exists
   */
  private Optional<CopybookModel> tryResolvePredefinedCopybook(
      CopybookName copybookName, CopybookConfig copybookConfig) {
    LOG.debug(
        "Trying to resolve predefined copybook {}, using config {}", copybookName, copybookConfig);
    final Optional<CopybookModel> copybookModel =
        Optional.ofNullable(PredefinedCopybooks.forName(copybookName.getQualifiedName()))
            .map(it -> {
              String uri = it.uriForBackend(copybookConfig.getSqlBackend());
              ContentProvider contentProvider = new FileContentProvider(files);
              return new CopybookModel(copybookName, PREF_IMPLICIT + uri, contentProvider.read(copybookConfig, uri));
            });
    LOG.debug("Predefined copybook: {}", copybookModel);
    return copybookModel;
  }

  private CopybookModel cleanupCopybook(CopybookModel dirtyCopybook) {
    String cleanText = preprocessor.cleanUpCode(dirtyCopybook.getUri(), dirtyCopybook.getContent()).getResult();
    return new CopybookModel(dirtyCopybook.getCopybookName(), dirtyCopybook.getUri(), cleanText);
  }

  private Optional<CopybookModel> tryResolveCopybookFromWorkspace(
      CopybookName copybookName, String mainProgramFileName) {
    LOG.debug(
        "Trying to resolve copybook copybook {} for {} from workspace",
        copybookName,
        mainProgramFileName);
    final Optional<CopybookModel> copybookModel =
        resolveCopybookFromWorkspace(copybookName, mainProgramFileName)
            .map(uri -> loadCopybook(uri, copybookName, mainProgramFileName));
    LOG.debug("Copybook from workspace: {}", copybookModel);
    return copybookModel;
  }

  @SuppressWarnings("java:S2142")
  private Optional<String> resolveCopybookFromWorkspace(
      CopybookName copybookName, String mainProgramFileName) {
    try {
      return SettingsService.getValueAsString(
          settingsService
              .getConfiguration(
                  COPYBOOK_RESOLVE.label,
                  mainProgramFileName,
                  copybookName.getQualifiedName(),
                  copybookName.getDialectType())
              .get());
    } catch (InterruptedException e) {
      // rethrowing the InterruptedException to interrupt the parent thread.
      throw new UncheckedExecutionException(e);
    } catch (ExecutionException e) {
      LOG.warn("An exception thrown while resolving a copybook from the workspace", e);
      return Optional.empty();
    }
  }

  private CopybookModel registerForDownloading(CopybookName copybookName, String cobolFileName) {
    LOG.debug("Registering copybook {} of {} for further downloading", copybookName, cobolFileName);
    Optional.of(
            copybooksForDownloading.computeIfAbsent(
                cobolFileName, s -> ConcurrentHashMap.newKeySet()))
        .ifPresent(it -> it.add(copybookName));
    return new CopybookModel(copybookName, null, null);
  }

  private CopybookModel loadCopybook(String uri, CopybookName copybookName, String cobolFileName) {
    Path file = files.getPathFromURI(uri);
    LOG.debug("Loading {} with URI {} for {} from path {}", copybookName, uri, cobolFileName, file);
    return files.fileExists(file)
        ? new CopybookModel(copybookName, uri, files.getContentByPath(Objects.requireNonNull(file)))
        : registerForDownloading(copybookName, cobolFileName);
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
    LOG.debug("Received event {}", event);
    LOG.debug("Copybooks expecting downloading: {}", copybooksForDownloading);
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
                          copybook.getQualifiedName(),
                          copybook.getDialectType()))
              .collect(toList());
      LOG.debug("Copybooks to download: {}", copybooksToDownload);
      if (!copybooksToDownload.isEmpty()) {
        settingsService.getConfigurations(copybooksToDownload);
      }
    }
  }

  @VisibleForTesting
  Map<String, Set<CopybookName>> getCopybooksForDownloading() {
    return ImmutableMap.copyOf(copybooksForDownloading);
  }

  private String getUserInteractionType(CopybookProcessingMode copybookProcessingMode) {
    return copybookProcessingMode.userInteraction ? VERBOSE.label : QUIET.label;
  }
}
