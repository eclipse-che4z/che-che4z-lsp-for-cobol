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
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.UserInterruptException;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.FileChangeType;
import org.eclipse.lsp4j.FileEvent;

/** LSP DidChangeWatchedFiles Handler */
@Slf4j
public class DidChangeWatchedFilesHandler {
  private final DisposableLSPStateService disposableLSPStateService;
  private final SourceUnitGraph sourceUnitGraph;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public DidChangeWatchedFilesHandler(
      DisposableLSPStateService disposableLSPStateService,
      SourceUnitGraph sourceUnitGraph,
      AsyncAnalysisService asyncAnalysisService) {
    this.disposableLSPStateService = disposableLSPStateService;
    this.sourceUnitGraph = sourceUnitGraph;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Handle didChangeWatchedFiles LSP event.
   *
   * @param params DidChangeWatchedFilesParams
   */
  public void didChangeWatchedFiles(@NonNull DidChangeWatchedFilesParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
    if (isRelevant(params.getChanges())) {
      Set<FileEvent> changedFiles = new HashSet<>(params.getChanges());
      LOG.info(
          "[File change event] : {}",
          changedFiles.stream().map(FileEvent::getUri).collect(Collectors.joining(", ")));
      changedFiles.forEach(
          file -> {
            URI uri = URI.create(file.getUri());
            if ("file".equals(uri.getScheme())) {
              LOG.info("[File change event] uri in progress : {}", uri);
              Path path = Paths.get(uri);
              if (file.getType() == FileChangeType.Deleted) {
                path = path.getParent();
              }
              String uriString = path.toUri().toString();
              if (sourceUnitGraph.isFileOpened(uriString)) {
                LOG.debug("[File change event]  ignoring event for uri : {} as its already opened in editor", uri);
                // opened files are taken care by textChange events
                return;
              }
              boolean isDirectory = Files.isDirectory(path);
              if (!isDirectory) {
                triggerAnalysisForChangedFile(uriString);
              } else {
                triggerAnalysisForFilesInDirectory(path);
              }
            }
          });
    }
  }

  private boolean isRelevant(List<FileEvent> changes) {
    return changes.stream()
        .filter(c -> !isGitFolder(c.getUri()))
        .anyMatch(c -> !c.getUri().startsWith("git:"));
  }

  private static boolean isGitFolder(String uri) {
    return uri.startsWith("file:") && uri.contains("/.git/");
  }

  private void triggerAnalysisForChangedFile(String uri) {
    List<String> uris = sourceUnitGraph.getAllAssociatedFilesForACopybook(uri);
    String fileContent = null;
    if (uris.isEmpty()) {
      LOG.debug("[File change event]  trigger analysis for all opened document");
      analyseAllOpenedDocument();
      return;
    }
    if (Files.exists(Paths.get(URI.create(uri)))) {
      sourceUnitGraph.updateContent(uri);
      fileContent = sourceUnitGraph.getContent(uri);
    }
    if (!sourceUnitGraph.isFileOpened(uri)) {
      LOG.debug("[File change event]  trigger analysis for uris: {}", String.join(", ", uris));
      asyncAnalysisService.reanalyseCopybooksAssociatedPrograms(
          uris, uri, fileContent, SourceUnitGraph.EventSource.FILE_SYSTEM);
    }
  }

  private void triggerAnalysisForFilesInDirectory(Path path) {
    // Only care for deleted copybooks as they impact the diagnostics
    Set<String> affectedPrograms =
        sourceUnitGraph.getCopybookUriInsideFolder(path.toUri().toString()).stream()
            .flatMap(
                copybookUri ->
                    sourceUnitGraph.getAllAssociatedFilesForACopybook(copybookUri).stream())
            .collect(Collectors.toSet());

    affectedPrograms.forEach(this::triggerAnalysisForChangedFile);

    if (affectedPrograms.isEmpty()) {
      LOG.debug("[File change event]  trigger analysis for all opened document due to event for path: {}", path);
      analyseAllOpenedDocument();
    }
  }

  private void analyseAllOpenedDocument() {
    try {
      asyncAnalysisService.reanalyseOpenedPrograms(SourceUnitGraph.EventSource.FILE_SYSTEM);
    } catch (InterruptedException e) {
      throw new UserInterruptException("analysis interrupted by user");
    }
  }
}
