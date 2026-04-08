/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers.workspace;

import com.google.inject.Inject;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.AbstractMap;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.UserInterruptException;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.FileChangeType;
import org.eclipse.lsp4j.FileEvent;

/** Handles LSP DidChangeWatchedFiles events for COBOL language server */
@Slf4j
public class DidChangeWatchedFilesHandler {
  private static final String FILE_SCHEME = "file";
  private static final String GIT_SCHEME_PREFIX = "git:";
  private static final String VSCODE_SCHEME_PREFIX = "vscode:";

  private final DisposableLSPStateService lspStateService;
  private final SourceUnitGraph sourceUnitGraph;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public DidChangeWatchedFilesHandler(
      DisposableLSPStateService lspStateService,
      SourceUnitGraph sourceUnitGraph,
      AsyncAnalysisService asyncAnalysisService) {
    this.lspStateService = lspStateService;
    this.sourceUnitGraph = sourceUnitGraph;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Processes file system change notifications
   *
   * @param params LSP notification parameters containing file changes
   */
  public void didChangeWatchedFiles(@NonNull DidChangeWatchedFilesParams params) {
    if (lspStateService.isServerShutdown()) return;

    List<FileEvent> relevantChanges = filterRelevantChanges(params.getChanges());
    if (relevantChanges.isEmpty()) return;

    logFileChanges(relevantChanges.stream().map(FileEvent::getUri).collect(Collectors.toSet()));
    processFileEvents(relevantChanges);
  }

  private List<FileEvent> filterRelevantChanges(List<FileEvent> changes) {
    return changes.stream()
        .filter(this::isRelevantFileChange)
        .filter(
            event -> {
              final boolean inEditor = isOpenInEditor(event.getUri());
              if (inEditor) {
                LOG.debug("Ignoring change for open file: {}", event.getUri());
              }
              return !inEditor;
            })
        .collect(Collectors.toList());
  }

  private boolean isRelevantFileChange(FileEvent change) {
    return !isGitMetadataFile(change.getUri())
        && !change.getUri().startsWith(GIT_SCHEME_PREFIX)
        && !isVscodeSchemaFile(change.getUri())
        && !isZoweFspCacheFile(change.getUri());
  }

  private boolean isGitMetadataFile(String uri) {
    return uri.startsWith("file:") && uri.contains("/.git/");
  }

  private boolean isVscodeSchemaFile(String uri) {
    return uri.startsWith(VSCODE_SCHEME_PREFIX);
  }

  static final Pattern ZOWE_FSP_PATTERN = Pattern.compile(".*/zowe-fsp/v\\d+\\.[a-f0-9]{64}$");

  private boolean isZoweFspCacheFile(String uri) {
    return ZOWE_FSP_PATTERN.matcher(uri).matches();
  }

  private void logFileChanges(Set<String> changes) {
    LOG.info("[File change event]: {}", changes.stream().collect(Collectors.joining(", ")));
  }

  private void processFileEvents(List<FileEvent> changes) {
    if (changes.stream().anyMatch(DidChangeWatchedFilesHandler::isCreateOrDelete)) {
      analyzeAllOpenedDocuments();
      return;
    }

    final List<Pair<FileEvent, URI>> data =
        changes.stream()
            .map(event -> ImmutablePair.of(event, toUri(event)))
            .filter(p -> p.getRight() != null)
            .collect(Collectors.toList());

    if (data.stream()
        .map(p -> p.getRight())
        .anyMatch(DidChangeWatchedFilesHandler::isDirectoryUri)) {
      analyzeAllOpenedDocuments();
      return;
    }

    Set<ChangeEvent> changeEvents =
        data.stream()
            .map(p -> getEffectedSourceChangeEvent(p.getLeft().getUri()))
            .filter(Objects::nonNull)
            .collect(Collectors.toSet());

    Map<String, Set<String>> cobolSourceToCopybookUris =
        changeEvents.stream()
            .flatMap(
                e ->
                    e.getAffectedUris().stream()
                        .map(val -> new AbstractMap.SimpleEntry<>(val, e.getUri())))
            .collect(
                Collectors.groupingBy(
                    Map.Entry::getKey,
                    Collectors.mapping(Map.Entry::getValue, Collectors.toSet())));

    cobolSourceToCopybookUris.forEach(
        (cobolDocUri, copybookUris) -> {
          asyncAnalysisService.reanalyseProgram(cobolDocUri, copybookUris);
        });
  }

  private static boolean isCreateOrDelete(FileEvent event) {
    return event.getType() == FileChangeType.Deleted || event.getType() == FileChangeType.Created;
  }

  private static URI toUri(FileEvent event) {
    try {
      return URI.create(event.getUri());
    } catch (IllegalArgumentException e) {
      LOG.error("Invalid URI in FileEvent:{}, error:{}", event.getUri(), e.getMessage());
      return null;
    }
  }

  private static boolean isDirectoryUri(URI uri) {
    return FILE_SCHEME.equals(uri.getScheme()) && Files.isDirectory(Paths.get(uri));
  }

  private boolean isOpenInEditor(String uri) {
    return sourceUnitGraph.isFileOpened(uri);
  }

  private ChangeEvent getEffectedSourceChangeEvent(String uri) {
    List<String> associatedUris = sourceUnitGraph.getAllAssociatedFilesForACopybook(uri);
    if (associatedUris.isEmpty()) {
      return null;
    }
    return new ChangeEvent(uri, associatedUris);
  }

  private void analyzeAllOpenedDocuments() {
    try {
      asyncAnalysisService.reanalyseOpenedPrograms();
    } catch (InterruptedException e) {
      Thread.currentThread().interrupt();
      throw new UserInterruptException("Analysis interrupted", e);
    }
  }

  @Getter
  @EqualsAndHashCode
  private static final class ChangeEvent {
    private final String uri;
    private final boolean isDirectory;
    private final List<String> affectedUris;

    private ChangeEvent(String uri, boolean isDirectory) {
      this(uri, isDirectory, Collections.emptyList());
    }

    private ChangeEvent(String uri, List<String> affectedUris) {
      this(uri, false, affectedUris);
    }

    private ChangeEvent(String uri, boolean isDirectory, List<String> affectedUris) {
      this.uri = uri;
      this.isDirectory = isDirectory;
      this.affectedUris = affectedUris;
    }
  }
}
