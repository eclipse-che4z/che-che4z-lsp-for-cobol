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
import com.google.common.base.CharMatcher;
import com.google.common.collect.ImmutableMap;
import com.google.common.util.concurrent.ExecutionError;
import com.google.common.util.concurrent.UncheckedExecutionException;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.DocumentContentCache;

import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import static java.util.stream.Collectors.toList;

/**
 * This service processes copybook requests and returns content by its name. The service also caches
 * copybook to reduce filesystem load.
 */
@Slf4j
@Singleton
@SuppressWarnings("UnstableApiUsage")
public class CopybookServiceImpl implements CopybookService {

  private final Map<String, List<SyntaxError>> preprocessCopybookErrors = new ConcurrentHashMap<>();
  private final Provider<CobolLanguageClient> clientProvider;
  private final FileSystemService files;
  public final TextPreprocessor preprocessor;
  private static final String COBOL = "COBOL";

  private final Map<String, Set<CopybookName>> copybooksForDownloading =
      new ConcurrentHashMap<>(8, 0.9f, 1);

  private final CopybookCache copybookCache;
  private final DocumentContentCache contentCache;

  @Inject
  public CopybookServiceImpl(Provider<CobolLanguageClient> clientProvider,
      FileSystemService files,
      TextPreprocessor preprocessor,
      CopybookCache copybookCache,
      DocumentContentCache contentCache) {
    this.files = files;
    this.clientProvider = clientProvider;
    this.preprocessor = preprocessor;
    this.copybookCache = copybookCache;
    this.contentCache = contentCache;
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
   * Retrieve and return a CopybookModel by its name and preprocessed errors for
   * the Retrieved copybook wrapped inside {@link ResultWithErrors}.
   * Copybook may be cached to limit interactions with
   * the file system.
   *
   * <p>Resolving works in synchronous way. Resolutions with different copybook names will not
   * block
   * each other.
   *
   * @param copybookId         - the id of the copybook to be retrieved
   * @param copybookName       - the name of the copybook to be retrieved
   * @param programDocumentUri - the currently processing program document
   * @param documentUri        - the currently processing document that contains the copy statement
   * @param copybookConfig     - contains config info like: copybook processing mode, target backend
   *                           sql server
   * @param preprocess         - indicates if copybook needs to be preprocessed after resolving
   * @return a CopybookModel wrapped inside {@link ResultWithErrors} which contains copybook name, its URI and the content
   */
  public ResultWithErrors<CopybookModel> resolve(
      @NonNull CopybookId copybookId,
      @NonNull CopybookName copybookName,
      @NonNull String programDocumentUri,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig,
      boolean preprocess) {
    try {
      ThreadInterruptionUtil.checkThreadInterrupted();

      CopybookModel copybookModel = getFromCache(programDocumentUri, copybookId, copybookName,
          copybookConfig, preprocess);

      updateContent(copybookModel, preprocess);

      List<SyntaxError> errors = Optional.ofNullable(copybookModel.getUri())
          .map(d -> preprocessCopybookErrors.getOrDefault(d, Collections.emptyList()))
          .orElse(Collections.emptyList());

      return new ResultWithErrors<>(copybookModel, errors);
    } catch (ExecutionException | UncheckedExecutionException | ExecutionError e) {
      LOG.error("Can't resolve copybook '{}'.", copybookName, e);
      return new ResultWithErrors<>(new CopybookModel(copybookId, copybookName, null, null), Collections.emptyList());
    }
  }

  private void updateContent(CopybookModel copybookModel, boolean preprocess) {
    if (copybookModel.getUri() != null) {
      contentCache.get(copybookModel.getUri())
          .ifPresent(content -> {
            copybookModel.setContent(content);
            if (preprocess) {
              ResultWithErrors<CopybookModel> copybookModelResultWithErrors = cleanupCopybook(copybookModel);
              preprocessCopybookErrors.put(copybookModel.getUri(), copybookModelResultWithErrors.getErrors());
              copybookModel.setContent(copybookModelResultWithErrors.getResult().getContent());
            }
          });
    }
  }

  private CopybookModel getFromCache(String programDocumentUri, CopybookId copybookId,
                                     CopybookName copybookName, CopybookConfig copybookConfig, boolean preprocess) throws ExecutionException {
    return copybookCache.get(copybookId, () -> {
      CopybookModel copybookModel = resolveSync(copybookName, programDocumentUri, copybookConfig);
      if (preprocess && copybookModel.getUri() != null) {
        ResultWithErrors<CopybookModel> copybookModelResultWithErrors = cleanupCopybook(copybookModel);
        copybookModel = copybookModelResultWithErrors.getResult();
        preprocessCopybookErrors.put(copybookModel.getUri(), copybookModelResultWithErrors.getErrors());
      }
      return copybookModel;
    });
  }

  @Override
  public void store(CopybookModel copybookModel) {
    copybookCache.store(copybookModel);
  }

  @Override
  public void store(CopybookModel copybookModel, boolean doCleanUp) {
    if (doCleanUp) {
      ResultWithErrors<CopybookModel> processedCopybook = cleanupCopybook(copybookModel);
      copybookModel = processedCopybook.getResult();
      preprocessCopybookErrors.put(copybookModel.getUri(), processedCopybook.getErrors());
    }
    store(copybookModel);
  }

  private CopybookModel resolveSync(
      @NonNull CopybookName copybookName,
      @NonNull String programUri,
      @NonNull CopybookConfig copybookConfig) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    LOG.debug(
        "Trying to resolve copybook {} for {}, using config {}",
        copybookName,
        programUri,
        copybookConfig);
    Optional<CopybookModel> copybookModel = tryResolveCopybookFromWorkspace(copybookName, programUri);
    if (copybookModel.isPresent()) {
      return copybookModel.get();
    }
    Optional<CopybookModel> predefineCopybook = tryResolvePredefinedCopybook(copybookName, copybookConfig);
    return predefineCopybook.orElseGet(() -> registerForDownloading(copybookName, programUri));
  }

  /**
   * Retrieve optional {@link CopybookModel} of the {@link PredefinedCopybooks} for the given name
   * if it is predefined.
   *
   * @param copybookName   - the name of copybook to check
   * @param copybookConfig - configuration for copybook resolution
   * @return optional model of a predefined copybook if it exists
   */
  private Optional<CopybookModel> tryResolvePredefinedCopybook(
      CopybookName copybookName, CopybookConfig copybookConfig) {
    LOG.debug(
        "Trying to resolve predefined copybook {}, using config {}", copybookName, copybookConfig);

    Optional<CopybookModel> copybookModel = Optional.ofNullable(
            PredefinedCopybooks.forName(copybookName.getQualifiedName()))
        .map(c -> {
          String name = c.nameForBackend(copybookConfig.getSqlBackend());
          String content = files.readImplicitCode(name);
          return new CopybookModel(copybookName.toCopybookId(ImplicitCodeUtils.createFullUrl(name)), copybookName,
                  ImplicitCodeUtils.createFullUrl(name), content);
        });

    LOG.debug("Predefined copybook: {}", copybookModel);
    return copybookModel;
  }

  private ResultWithErrors<CopybookModel> cleanupCopybook(CopybookModel dirtyCopybook) {
    ResultWithErrors<ExtendedText> textTransformationsResultWithErrors = preprocessor.cleanUpCode(dirtyCopybook.getUri(), dirtyCopybook.getContent());
    String cleanText = CharMatcher.whitespace().trimTrailingFrom(textTransformationsResultWithErrors.getResult().toString());
    CopybookModel copybookModel = new CopybookModel(dirtyCopybook.getCopybookId(), dirtyCopybook.getCopybookName(), dirtyCopybook.getUri(), cleanText);
    return new ResultWithErrors<>(copybookModel, adjustErrorLocation(dirtyCopybook, textTransformationsResultWithErrors.getErrors()));
  }

  private List<SyntaxError> adjustErrorLocation(
      CopybookModel dirtyCopybook, List<SyntaxError> originalErrors) {
    return originalErrors.stream()
        .map(
            error ->
                error.toBuilder().location(getErrorOriginalLocation(dirtyCopybook, error)).build())
        .collect(toList());
  }

  private OriginalLocation getErrorOriginalLocation(CopybookModel dirtyCopybook, SyntaxError error) {
    return new OriginalLocation(
            Optional.ofNullable(error.getLocation()).map(OriginalLocation::getLocation).orElse(null),
            CopybooksRepository.toId(dirtyCopybook.getCopybookName().getQualifiedName(),
                    dirtyCopybook.getCopybookName().getDialectType(),
                    dirtyCopybook.getUri()));
  }

  private Optional<CopybookModel> tryResolveCopybookFromWorkspace(
      CopybookName copybookName, String programUri) {
    LOG.debug(
        "Trying to resolve copybook copybook {} for {} from workspace",
        copybookName,
        files.getNameFromURI(programUri));

    final Optional<CopybookModel> copybookModel =
        resolveCopybookFromWorkspace(copybookName, programUri)
            .map(uri -> loadCopybook(uri, copybookName, programUri));
    LOG.debug("Copybook from workspace: {}", copybookModel);
    return copybookModel;
  }

  @SuppressWarnings("java:S2142")
  private Optional<String> resolveCopybookFromWorkspace(CopybookName copybookName, String programUri) {
    try {
      CompletableFuture<String> future = clientProvider.get().resolveCopybook(
          programUri,
          copybookName.getDisplayName(),
          Optional.ofNullable(copybookName.getDialectType()).orElse(COBOL));

      if (future == null) {
        return Optional.empty();
      }
      return Optional.ofNullable(future.get());
    } catch (InterruptedException e) {
      // rethrowing the InterruptedException to interrupt the parent thread.
      throw new UncheckedExecutionException(e);
    } catch (ExecutionException e) {
      LOG.warn("An exception thrown while resolving a copybook from the workspace", e);
      return Optional.empty();
    }
  }

  private CopybookModel registerForDownloading(CopybookName copybookName, String programUri) {
    String cobolFileName = files.getNameFromURI(programUri);
    LOG.debug("Registering copybook {} of {} for further downloading", copybookName, cobolFileName);
    Optional.ofNullable(cobolFileName)
        .map(name -> copybooksForDownloading.computeIfAbsent(name, s -> ConcurrentHashMap.newKeySet()))
        .ifPresent(it -> it.add(copybookName));
    return new CopybookModel(copybookName.toCopybookId(programUri), copybookName, null, null);
  }

  private CopybookModel loadCopybook(String uri, CopybookName copybookName, String programUri) {
    Path file = files.getPathFromURI(uri);
    LOG.debug("Loading {} with URI {} for {} from path {}", copybookName, uri, files.getNameFromURI(programUri), file);
    return files.fileExists(file)
        ? new CopybookModel(copybookName.toCopybookId(programUri), copybookName, uri, files.getContentByPath(Objects.requireNonNull(file)))
        : registerForDownloading(copybookName, programUri);
  }

  @Override
  public void sendCopybookDownloadRequest(String documentUri, Collection<String> copybookUris, CopybookProcessingMode processingMode) {
    LOG.debug("Copybooks expecting downloading: {}", copybooksForDownloading);
    Set<String> uris = new HashSet<>(copybookUris);
    uris.add(documentUri);
    String document = files.getNameFromURI(documentUri);

    if (processingMode.download) {
      List<CopybookName> copybooksToDownload =
          uris.stream()
              .map(files::getNameFromURI)
              .map(copybooksForDownloading::remove)
              .filter(Objects::nonNull)
              .flatMap(Set::stream)
              .collect(toList());
      LOG.debug("Copybooks to download: {}", copybooksToDownload);
      if (!copybooksToDownload.isEmpty()) {
        clientProvider.get().downloadCopybooks(
            document,
            copybooksToDownload.stream().map(CopybookName::getQualifiedName).collect(toList()),
            Optional.ofNullable(copybooksToDownload.stream().findFirst().get().getDialectType()).orElse(COBOL), //NOSONAR
            !processingMode.userInteraction);
      }
    }
  }

  @VisibleForTesting
  Map<String, Set<CopybookName>> getCopybooksForDownloading() {
    return ImmutableMap.copyOf(copybooksForDownloading);
  }
}
