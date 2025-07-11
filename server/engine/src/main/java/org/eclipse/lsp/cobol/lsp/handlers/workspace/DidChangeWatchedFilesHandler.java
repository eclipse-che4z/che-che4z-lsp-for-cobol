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
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.AbstractMap;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
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

    Set<FileEvent> relevantChanges = filterRelevantChanges(params.getChanges());
    if (relevantChanges.isEmpty()) return;

    logFileChanges(relevantChanges);
    processFileEvents(relevantChanges);
  }

  private Set<FileEvent> filterRelevantChanges(List<FileEvent> changes) {
    return changes.stream()
        .filter(this::isRelevantFileChange)
        .collect(Collectors.toCollection(HashSet::new));
  }

  private boolean isRelevantFileChange(FileEvent change) {
    return !isGitMetadataFile(change.getUri())
        && !change.getUri().startsWith(GIT_SCHEME_PREFIX)
        && !isVscodeSchemaFile(change.getUri());
  }

  private boolean isGitMetadataFile(String uri) {
    return uri.startsWith("file:") && uri.contains("/.git/");
  }

  private boolean isVscodeSchemaFile(String uri) {
    return uri.startsWith(VSCODE_SCHEME_PREFIX);
  }

  private void logFileChanges(Set<FileEvent> changes) {
    LOG.info(
        "[File change event]: {}",
        changes.stream().map(FileEvent::getUri).collect(Collectors.joining(", ")));
  }

  private void processFileEvents(Set<FileEvent> changes) {
    Set<ChangeEvent> changeEvents =
        changes.stream().map(this::mapFileEventToChangeEvent).collect(Collectors.toSet());

    boolean hasNullEvent = changeEvents.stream().anyMatch(Objects::isNull);
    boolean hasDirectoryEvent =
        changeEvents.stream().filter(Objects::nonNull).anyMatch(ChangeEvent::isDirectory);
    if (hasDirectoryEvent || hasNullEvent) {
      analyzeAllOpenedDocuments();
    } else {
      Map<String, Set<String>> cobolSourceToCopybookUris =
          changeEvents.stream()
              .filter(e -> !e.shouldIgnore)
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
            if (!sourceUnitGraph.isFileOpened(cobolDocUri)) {
              asyncAnalysisService.reanalyseProgram(
                  cobolDocUri, copybookUris, SourceUnitGraph.EventSource.FILE_SYSTEM);
            }
          });
    }
  }

  private ChangeEvent mapFileEventToChangeEvent(FileEvent event) {
    try {
      URI uri = URI.create(event.getUri());
      if (FILE_SCHEME.equals(uri.getScheme())) {
        return getLocalFileSystemChange(event, uri);
      } else {
        return getEffectedSourceChangeEvent(event.getUri());
      }
    } catch (IllegalArgumentException e) {
      LOG.error("Invalid URI in FileEvent:{}, error:{}", event.getUri(), e.getMessage());
      return null;
    }
  }

  private ChangeEvent getLocalFileSystemChange(FileEvent event, URI uri) {
    try {
      Path path = getEffectivePath(event, uri);
      String fileUri = path.toUri().toString();

      if (isOpenInEditor(fileUri)) {
        LOG.debug("Ignoring change for open file: {}", fileUri);
        ChangeEvent changeEvent = new ChangeEvent(uri.getPath(), false);
        changeEvent.setShouldIgnore(true);
        return changeEvent;
      }

      if (Files.isDirectory(path)) {
        return new ChangeEvent(uri.getPath(), true);
      } else {
        return getEffectedSourceChangeEvent(fileUri);
      }
    } catch (Exception e) {
      LOG.error(
          "Error handling local file system change:{}, for uri {}", e.getMessage(), event.getUri());
      return null;
    }
  }

  private Path getEffectivePath(FileEvent event, URI uri) {
    Path path = Paths.get(uri);
    return event.getType() == FileChangeType.Deleted ? path.getParent() : path;
  }

  private boolean isOpenInEditor(String uri) {
    return sourceUnitGraph.isFileOpened(uri);
  }

  private ChangeEvent getEffectedSourceChangeEvent(String uri) {
    List<String> associatedUris = sourceUnitGraph.getAllAssociatedFilesForACopybook(uri);
    if (associatedUris.isEmpty()) {
      ChangeEvent event = new ChangeEvent(uri, associatedUris);
      event.setShouldIgnore(true);
      return event;
    }
    return new ChangeEvent(uri, associatedUris);
  }

  private void analyzeAllOpenedDocuments() {
    try {
      asyncAnalysisService.reanalyseOpenedPrograms(SourceUnitGraph.EventSource.FILE_SYSTEM);
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
    @Setter private boolean shouldIgnore;

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
      this.shouldIgnore = false;
    }
  }
}
