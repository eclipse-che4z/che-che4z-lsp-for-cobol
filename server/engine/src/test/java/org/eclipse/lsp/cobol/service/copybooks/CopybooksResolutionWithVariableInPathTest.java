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
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Tests for copybook name resolution with variables in paths. */
class CopybooksResolutionWithVariableInPathTest {
  @Test
  void test() {
    SettingsService settings = mock(SettingsService.class);
    when(settings.fetchTextConfigurationWithScope(any(), eq("cpy-manager.paths-local")))
        .thenReturn(
            CompletableFuture.completedFuture(ImmutableList.of("my/${fileBasenameNoExtension}")));
    when(settings.fetchTextConfigurationWithScope(
            anyString(), eq("cpy-manager.copybook-extensions")))
        .thenReturn(CompletableFuture.completedFuture(ImmutableList.of(".cpy", "CPY")));
    when(settings.fetchTextConfigurationWithScope(any(), eq("dialects")))
        .thenReturn(CompletableFuture.completedFuture(ImmutableList.of()));

    FileSystemService files = mock(FileSystemService.class);
    when(files.getPathFromURI("/workspace"))
        .thenReturn(Paths.get(System.getProperty("user.dir"), "workspace"));
    when(files.listFilesInDirectory(
            System.getProperty("user.dir") + File.separator + "workspace/my/ABCPROG"))
        .thenReturn(ImmutableList.of("COPY1.CPY"));
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
