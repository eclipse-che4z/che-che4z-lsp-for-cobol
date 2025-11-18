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
import com.google.common.collect.ImmutableSet;
import com.google.common.util.concurrent.ExecutionError;
import com.google.common.util.concurrent.UncheckedExecutionException;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.io.ResolveCopybookUri;
import org.eclipse.lsp.cobol.common.io.ResolveFileContent;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;

/**
 * This service processes copybook requests and returns content by its name. The service also caches
 * copybook to reduce filesystem load.
 */
@Slf4j
@Singleton
@SuppressWarnings("UnstableApiUsage")
public class CopybookServiceImpl implements CopybookService {

  private static final String COBOL = "COBOL";
  protected final Map<String, List<SyntaxError>> preprocessCopybookErrors =
      new ConcurrentHashMap<>();
  protected final Map<String, Set<CopybookModel>> copybookUsage = new ConcurrentHashMap<>();
  private final ResolveCopybookUri resolveCopybookUri;
  private final ResolveFileContent resolveFileContent;
  private final PredefinedCopybookStore predefinedCopybookStoreImpl;
  private final CopybookCache copybookCache;

  private final Map<String, Set<CopybookName>> copybooksForDownloading =
      new ConcurrentHashMap<>(8, 0.9f, 1);

  @Inject
  public CopybookServiceImpl(
      ResolveCopybookUri resolveCopybookUri,
      ResolveFileContent resolveFileContent,
      PredefinedCopybookStore predefinedCopybookStoreImpl,
      CopybookCache copybookCache) {
    this.resolveCopybookUri = resolveCopybookUri;
    this.resolveFileContent = resolveFileContent;
    this.predefinedCopybookStoreImpl = predefinedCopybookStoreImpl;
    this.copybookCache = copybookCache;
  }

  @Override
  public void invalidateCache(boolean onlyNonImplicit) {
    LOG.debug("Copybooks for downloading: {}", copybooksForDownloading);
    LOG.debug("Cache invalidated");
    copybookUsage.clear();
    copybooksForDownloading.clear();
    if (onlyNonImplicit) {
      copybookCache.invalidateAllNonImplicit();
    } else {
      copybookCache.invalidateAll();
    }
  }

  /**
   * Removes cache for the passed {@link CopybookId}
   *
   * @param copybookModel is a copybook model to be invalidated
   */
  @SuppressWarnings("unchecked")
  public void invalidateCache(CopybookModel copybookModel) {
    copybookCache.invalidate(copybookModel.getCopybookId());
  }

  /**
   * Retrieve and return a CopybookModel by its name and preprocessed errors for the Retrieved
   * copybook wrapped inside {@link ResultWithErrors}. Copybook may be cached to limit interactions
   * with the file system.
   *
   * <p>Resolving works in synchronous way. Resolutions with different copybook names will not block
   * each other.
   *
   * @param copybookId - the id of the copybook to be retrieved
   * @param copybookName - the name of the copybook to be retrieved
   * @param programDocumentUri - the currently processing program document
   * @param documentUri - the currently processing document that contains the copy statement
   * @param preprocessor - Cleanup preprocessor that will be used for new copybooks or null
   * @return a CopybookModel wrapped inside {@link ResultWithErrors} which contains copybook name,
   *     its URI and the content
   */
  public ResultWithErrors<CopybookModel> resolve(
      @NonNull CopybookId copybookId,
      @NonNull CopybookName copybookName,
      @NonNull String programDocumentUri,
      @NonNull String documentUri,
      CleanerPreprocessor preprocessor) {
    ThreadInterruptionUtil.checkThreadInterrupted();

    CopybookModel copybookModel;
    try {
      copybookModel =
          copybookCache.get(
              copybookId, () -> getCopybook(copybookName, programDocumentUri, preprocessor));
    } catch (ExecutionException e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return new ResultWithErrors<>(
          new CopybookModel(copybookId, copybookName, null, null), Collections.emptyList());
    }
    List<SyntaxError> errors =
        Optional.ofNullable(copybookModel.getUri())
            .map(d -> preprocessCopybookErrors.getOrDefault(d, Collections.emptyList()))
            .orElse(Collections.emptyList());
    return new ResultWithErrors<>(copybookModel, errors);
  }

  private CopybookModel getCopybook(
      CopybookName copybookName, String programDocumentUri, CleanerPreprocessor preprocessor) {
    try {
      String copybookUri =
          resolveCopybookUri
              .resolveCopybookUri(
                  programDocumentUri,
                  copybookName,
                  Optional.ofNullable(copybookName.getDialectType()).orElse(COBOL))
              .join();
      if (copybookUri == null) {
        ResultWithErrors<CopybookModel> predefinedCopybook =
            predefinedCopybookStoreImpl.resolve(copybookName, programDocumentUri);
        if (predefinedCopybook.getResult().getContent() == null) {
          return registerForDownloading(copybookName, programDocumentUri);
        }
        return predefinedCopybook.getResult();
      }
      String fileContent = resolveFileContent.getFileContent(copybookUri).join();

      if (fileContent == null) {
        return CopybookUtility.getDefaultCopybook(copybookName, programDocumentUri);
      }

      return processCopybookContent(
          copybookName, programDocumentUri, preprocessor, copybookUri, fileContent);
    } catch (UncheckedExecutionException | ExecutionError e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return CopybookUtility.getDefaultCopybook(copybookName, programDocumentUri);
    }
  }

  private CopybookModel processCopybookContent(
      CopybookName copybookName,
      String programDocumentUri,
      CleanerPreprocessor preprocessor,
      String copybookUri,
      String fileContent) {
    CopybookModel dirtyCopybook =
        new CopybookModel(
            copybookName.toCopybookId(programDocumentUri), copybookName, copybookUri, fileContent);
    ResultWithErrors<CopybookModel> copybookModelResultWithErrors =
        CopybookUtility.cleanupCopybook(dirtyCopybook, preprocessor);
    copybookUsage
        .computeIfAbsent(programDocumentUri, k -> new HashSet<>())
        .add(copybookModelResultWithErrors.getResult());
    preprocessCopybookErrors.put(dirtyCopybook.getUri(), copybookModelResultWithErrors.getErrors());
    return copybookModelResultWithErrors.getResult();
  }

  /**
   * @param copybookId - the id of the copybook to be retrieved
   * @param copybookName - the name of the copybook to be retrieved
   * @param programDocumentUri - the currently processing program document
   * @param documentUri - the currently processing document that contains the copy statement
   * @param preprocessor - Cleanup preprocessor that will be used for new copybooks or null
   * @return Runnable that adds fetched copybook to cache
   */
  public CompletableFuture<Runnable> prefetch(
      @NonNull CopybookId copybookId,
      @NonNull CopybookName copybookName,
      @NonNull String programDocumentUri,
      @NonNull String documentUri,
      CleanerPreprocessor preprocessor) {
    if (copybookCache.has(copybookId)) return null;
    return resolveCopybookUri
        .resolveCopybookUri(
            programDocumentUri,
            copybookName,
            Optional.ofNullable(copybookName.getDialectType()).orElse(COBOL))
        .thenCompose(
            (uri) -> {
              if (uri == null) return CompletableFuture.completedFuture(() -> {});
              return resolveFileContent
                  .getFileContent(uri)
                  .exceptionally(
                      ex -> {
                        LOG.warn(
                            "Failed to get copybook content URI: {} for program {}",
                            copybookName.getDisplayName(),
                            programDocumentUri,
                            ex);
                        return null;
                      })
                  .thenApply(
                      (content) -> {
                        return () -> {
                          if (content == null) return;
                          copybookCache.store(
                              processCopybookContent(
                                  copybookName, programDocumentUri, preprocessor, uri, content));
                        };
                      });
            });
  }

  private CopybookModel registerForDownloading(CopybookName copybookName, String programUri) {
    LOG.debug("Not resolved copybook {} of {}", copybookName, programUri);
    LOG.debug("Copybook download not supported any more.");
    return new CopybookModel(copybookName.toCopybookId(programUri), copybookName, null, null);
  }

  @Override
  public void store(CopybookModel copybookModel) {
    copybookCache.store(copybookModel);
  }

  @Override
  public void store(CopybookModel copybookModel, CleanerPreprocessor preprocessor) {
    if (preprocessor != null) {
      ResultWithErrors<CopybookModel> processedCopybook =
          CopybookUtility.cleanupCopybook(copybookModel, preprocessor);
      copybookModel = processedCopybook.getResult();
      preprocessCopybookErrors.put(copybookModel.getUri(), processedCopybook.getErrors());
    }
    store(copybookModel);
  }

  /**
   * Get the list of copybook used by a document
   *
   * @param documentUri current document uri.
   * @return Set of all the {@link CopybookModel} used by the passed document
   */
  public Set<CopybookModel> getCopybookUsage(String documentUri) {
    return Collections.unmodifiableSet(copybookUsage.getOrDefault(documentUri, ImmutableSet.of()));
  }

  @VisibleForTesting
  Map<String, Set<CopybookName>> getCopybooksForDownloading() {
    return ImmutableMap.copyOf(copybooksForDownloading);
  }
}
