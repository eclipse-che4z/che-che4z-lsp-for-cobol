/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.events.notifications;


import lombok.SneakyThrows;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.LspNotification;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.FileChangeType;
import org.eclipse.lsp4j.FileEvent;

import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/** LSP Notification event for didChangeWatchedFiles */
@Slf4j
public class DidChangeWatchedFiles implements LspNotification {

    private final DidChangeWatchedFilesParams params;
    private final SourceUnitGraph sourceUnitGraph;
    private final AsyncAnalysisService asyncAnalysisService;

    public DidChangeWatchedFiles(DidChangeWatchedFilesParams params, SourceUnitGraph sourceUnitGraph, AsyncAnalysisService asyncAnalysisService) {
        this.params = params;
        this.sourceUnitGraph = sourceUnitGraph;
        this.asyncAnalysisService = asyncAnalysisService;
    }

    @Override
    public void execute() {
        Set<FileEvent> changedFiles = new HashSet<>(params.getChanges());
        LOG.debug("Did Change Watched Files executed : {}", changedFiles);

        changedFiles.forEach(
                file -> {
                    URI uri = URI.create(file.getUri());
                    if ("file".equals(uri.getScheme())) {
                        Path path = Paths.get(uri);
                        if (file.getType() == FileChangeType.Deleted) {
                            path = path.getParent();
                        }
                        String uriString = uriDecodeService.decode(path.toUri().toString());
                        if (sourceUnitGraph.isFileOpened(uriString)) {
                            // opened files are taken care by textChange events
                            return;
                        }
                        boolean isDirectory = Files.isDirectory(path);
                        if (!isDirectory) {
                            triggerAnalysisForChangedFile(file.getUri());
                        } else {
                            triggerAnalysisForFilesInDirectory(path);
                        }
                    }
                });
    }

    @SneakyThrows
    private void triggerAnalysisForChangedFile(String uri) {
        try {
            List<String> uris = sourceUnitGraph.getAllAssociatedFilesForACopybook(uri);
            String fileContent = null;
            if (uris.isEmpty()) {
                asyncAnalysisService.reanalyseOpenedPrograms(false);
                return;
            }
            if (Files.exists(Paths.get(URI.create(uri)))) {
                sourceUnitGraph.updateContent(uri);
                fileContent = sourceUnitGraph.getContent(uri);
            }
            if (!sourceUnitGraph.isFileOpened(uri)) {
                asyncAnalysisService.reanalyseCopybooksAssociatedPrograms(
                        uris, uri, fileContent, SourceUnitGraph.EventSource.FILE_SYSTEM);
            }
        } catch (Exception e) {
            LOG.debug("[triggerAnalysisForChangedFile] exception: {}", e.getMessage());
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
    }
}
