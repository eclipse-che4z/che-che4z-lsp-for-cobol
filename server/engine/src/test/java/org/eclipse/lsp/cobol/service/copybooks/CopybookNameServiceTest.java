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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import com.google.inject.Provider;
import java.util.Arrays;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.net.URI;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_EXTENSIONS;
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
  private final List<String> copyNames = new ArrayList<>();
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
    when(settingsService.fetchTextConfiguration(CPY_LOCAL_PATHS.label))
        .thenReturn(CompletableFuture.completedFuture(copyNames));
  }

  static Stream<Arguments> collectCopybookNamesData() {
    return Stream.of(
        Arguments.of(
            Collections.singletonList("VALIDNAME2.CPY"),
            Collections.singletonList("VALIDNAME.CPY"),
            Arrays.asList("cpy", "CPY"),
            2),
        Arguments.of(
            Collections.singletonList("VALIDNAME2.CPY"),
            Collections.singletonList("VALIDNAME.CPY"),
            Collections.singletonList("cpy"),
            0), // lowercase extension, copybooks not found
        Arguments.of(
            Collections.emptyList(),
            Collections.emptyList(),
            Arrays.asList("cpy", "CPY"),
            0), // no folders with copybooks, nothing found
        Arguments.of(
            Collections.singletonList("VALIDNAME2.CPY"),
            Collections.singletonList("VALIDNAME.CPY"),
            Arrays.asList("abc", "cde"),
            0), // copybooks with extensions from config wasn't found.
        Arguments.of(
            Collections.singletonList("VALIDNAME2.abc"),
            Collections.singletonList("VALIDNAME.cde"),
            Arrays.asList("abc", "cde"),
            2)
    );
  }

  /** Test scenarios when the copybook local path exists in the settings. */
  @ParameterizedTest
  @MethodSource("collectCopybookNamesData")
  void
  testValidFoldersWithCopybooks(
      List<String> filesInWorkingDirectory,
      List<String> filesInCopybookDirectory,
      List<String> extensionsInCofig,
      int expectedCopybookFound
  ) {
    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);

    when(settingsService.fetchTextConfiguration(
        CPY_EXTENSIONS.label)).thenReturn(CompletableFuture.completedFuture(extensionsInCofig));

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

    when(files.listFilesInDirectory(wrkPath)).thenReturn(filesInWorkingDirectory);
    when(files.listFilesInDirectory(cpyPath)).thenReturn(filesInCopybookDirectory);

    copybookNameService.collectLocalCopybookNames();
    assertEquals(expectedCopybookFound, copybookNameService.getNames().size());
  }

  @Test
  void testNullPaths() {
    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);

    when(settingsService.fetchTextConfiguration(
        CPY_EXTENSIONS.label)).thenReturn(CompletableFuture.completedFuture(Collections.singletonList("cpy")));
    when(files.decodeURI(VALID_CPY_URI)).thenReturn(null);
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(null);
    when(cpyPath.resolve(VALID_CPY_URI)).thenReturn(null);

    copybookNameService.collectLocalCopybookNames();
    assertEquals(0, copybookNameService.getNames().size());
  }
}
