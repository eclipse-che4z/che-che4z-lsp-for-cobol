/*
 * Copyright (c) 2022 Broadcom.
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

import com.google.common.collect.ImmutableList;
import com.google.inject.Provider;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.net.URI;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_LOCAL_PATHS;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
@ExtendWith(MockitoExtension.class)
class CopybookNameServiceTest {
  private static final String VALID_CPY_URI = "file:///c%3A/copybooks";
  private static final String WORKSPACE_PROGRAM_URI = "file:///c%3A/workspace";

  private final List<WorkspaceFolder> workspace = new ArrayList<>();
  private final List<Object> copyNames = new ArrayList<>();
  private final List<String> resolvedCopyNames = new ArrayList<>();

  private final WorkspaceFolder folder = new WorkspaceFolder(WORKSPACE_PROGRAM_URI);
  private final SettingsService settingsService = mock(SettingsService.class);
  private final FileSystemService files = mock(FileSystemService.class);
  private final Path cpyPath = mock(Path.class);
  private final Path wrkPath = mock(Path.class);
  @Mock private Provider<CobolLanguageClient> provider;
  @Mock private CobolLanguageClient client;

  @BeforeEach
  void setupMocks() {
    workspace.add(folder);
    ImmutableList.of(VALID_CPY_URI, WORKSPACE_PROGRAM_URI)
        .forEach(
            it -> {
              copyNames.add(it);
              resolvedCopyNames.add(it);
            });
    when(provider.get()).thenReturn(client);
    when(client.workspaceFolders()).thenReturn(CompletableFuture.completedFuture(workspace));
    when(settingsService.getConfiguration(CPY_LOCAL_PATHS.label))
        .thenReturn(CompletableFuture.completedFuture(copyNames));
    when(settingsService.toStrings(copyNames)).thenReturn(resolvedCopyNames);
  }
  /** Test a main positive scenario when the copybook local path exists in the settings. */
  @Test
  void testValidFoldersWithCopybooks() {
    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);

    when(wrkPath.toUri()).thenReturn(URI.create(WORKSPACE_PROGRAM_URI));
    when(cpyPath.toUri()).thenReturn(URI.create(VALID_CPY_URI));

    when(files.decodeURI(WORKSPACE_PROGRAM_URI)).thenReturn(WORKSPACE_PROGRAM_URI);
    when(files.decodeURI(VALID_CPY_URI)).thenReturn(VALID_CPY_URI);

    when(files.getPathFromURI(WORKSPACE_PROGRAM_URI)).thenReturn(wrkPath);
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(cpyPath);

    when(wrkPath.resolve(WORKSPACE_PROGRAM_URI)).thenReturn(wrkPath);
    when(wrkPath.resolve(VALID_CPY_URI)).thenReturn(cpyPath);

    when(files.fileExists(wrkPath)).thenReturn(true);
    when(files.fileExists(cpyPath)).thenReturn(true);

    when(files.listFilesInDirectory(wrkPath)).thenReturn(Collections.singletonList("VALIDNAME2.CPY"));
    when(files.listFilesInDirectory(cpyPath)).thenReturn(Collections.singletonList("VALIDNAME.CPY"));

    copybookNameService.collectLocalCopybookNames();
    assertEquals(2, copybookNameService.getNames().size());
  }

  @Test
  void testNullPaths() {
    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);

    when(files.decodeURI(VALID_CPY_URI)).thenReturn(null);
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(null);
    when(cpyPath.resolve(VALID_CPY_URI)).thenReturn(null);

    copybookNameService.collectLocalCopybookNames();
    assertEquals(0, copybookNameService.getNames().size());
  }
}
