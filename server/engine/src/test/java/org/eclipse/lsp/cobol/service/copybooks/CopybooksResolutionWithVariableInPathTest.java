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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Tests for copybook name resolution with variables in paths.
 */
class CopybooksResolutionWithVariableInPathTest {
  @Test
  void test() {
    SettingsService settings = mock(SettingsService.class);
    JsonArray element = new JsonArray();
    element.add("my/${fileBasenameNoExtension}");
    when(settings.fetchConfigurations(any(), any()))
            .thenReturn(CompletableFuture.completedFuture(ImmutableList.of(element)));
    when(settings.fetchTextConfigurationWithScope(eq("cpy-manager.copybook-extensions"), anyString()))
            .thenReturn(CompletableFuture.completedFuture(ImmutableList.of(".cpy", "CPY")));
    when(settings.fetchTextConfiguration("dialects")).thenReturn(CompletableFuture.completedFuture(ImmutableList.of()));

    FileSystemService files = mock(FileSystemService.class);
    when(files.getPathFromURI("/workspace")).thenReturn(Paths.get("/", "workspace"));
    when(files.listFilesInDirectory("/workspace/my/ABCPROG")).thenReturn(ImmutableList.of("COPY1.CPY"));
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    WorkspaceFolder workspaceFolder = mock(WorkspaceFolder.class);
    when(workspaceFolder.getUri()).thenReturn("/workspace");
    List<WorkspaceFolder> workspaceFolders = ImmutableList.of(workspaceFolder);
    when(client.workspaceFolders()).thenReturn(CompletableFuture.completedFuture(workspaceFolders));


    CopybookNameService cns = new CopybookNameServiceImpl(settings, files, () -> client);
    List<CopybookName> copybooks = cns.getNames("ABCPROG.CPY");
    assertFalse(copybooks.isEmpty());
    assertEquals("COPY1", copybooks.get(0).getDisplayName());
  }
}
