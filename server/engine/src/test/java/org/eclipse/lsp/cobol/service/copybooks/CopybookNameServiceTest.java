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

import static edu.emory.mathcs.backport.java.util.Collections.emptyList;
import static edu.emory.mathcs.backport.java.util.Collections.singletonList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_EXTENSIONS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_LOCAL_PATHS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.inject.Provider;
import java.net.URI;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Stream;
import org.apache.commons.io.FileSystem;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp.cobol.service.utils.WorkspaceFileService;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
@ExtendWith(MockitoExtension.class)
class CopybookNameServiceTest {
  private static String absoluteValidCpyPath;
  private static String relativeValidCpyPath;
  private static String workspaceProgramPath;
  private static String workspaceProgramUri;

  private final List<WorkspaceFolder> workspace = new ArrayList<>();
  private final List<String> copyNames = new ArrayList<>();
  private final SettingsService settingsService = mock(SettingsService.class);
  private final FileSystemService files = mock(WorkspaceFileService.class);
  private final Path cpyPath = mock(Path.class);
  private final Path wrkPath = mock(Path.class);
  @Mock private Provider<CobolLanguageClient> provider;
  @Mock private CobolLanguageClient client;

  @BeforeEach
  void setupMocks() {
    String pathPrefix = FileSystem.WINDOWS.equals(FileSystem.getCurrent()) ? "c:/" : "/";
    workspaceProgramPath = pathPrefix + "workspace";
    absoluteValidCpyPath = pathPrefix + "copybooks";
    relativeValidCpyPath = "copybooks";
    workspaceProgramUri = "file:///" + workspaceProgramUri;
    workspace.add(new WorkspaceFolder(workspaceProgramUri));
    copyNames.addAll(ImmutableList.of(absoluteValidCpyPath, relativeValidCpyPath, workspaceProgramPath));
    when(provider.get()).thenReturn(client);
    when(client.workspaceFolders()).thenReturn(CompletableFuture.completedFuture(workspace));
    when(settingsService.fetchTextConfiguration(CPY_LOCAL_PATHS.label))
        .thenReturn(CompletableFuture.completedFuture(copyNames));
    when(settingsService.fetchTextConfiguration(DIALECTS.label))
        .thenReturn(CompletableFuture.completedFuture(emptyList()));
  }

  static Stream<Arguments> collectCopybookNamesData() {
    return Stream.of(
        Arguments.of(
            Arrays.asList("VALIDNAME2.CPY", "VALIDNAME.CPY"),
            Arrays.asList(".cpy", ".CPY"),
            2),
        Arguments.of(
            Arrays.asList("VALIDNAME2.CPY", "VALIDNAME.CPY"),
            Collections.singletonList(".cpy"),
            0), // lowercase extension, copybooks not found
        Arguments.of(
            Collections.emptyList(),
            Arrays.asList(".cpy", ".CPY"),
            0), // no folders with copybooks, nothing found
        Arguments.of(
            Arrays.asList("VALIDNAME2.CPY", "VALIDNAME.CPY"),
            Arrays.asList(".abc", ".cde"),
            0), // copybooks with extensions from config wasn't found.
        Arguments.of(
            Arrays.asList("VALIDNAME2.abc", "VALIDNAME.cde"),
            Arrays.asList(".abc", ".cde"),
            2),
        Arguments.of(
            Arrays.asList("VALIDNAME2", "VALIDNAME"),
            singletonList(""),
            2)
    );
  }

  static Stream<Arguments> copybooksWithExtensionsOrderData() {
    return Stream.of(
        Arguments.of(
            Arrays.asList(".xyz", ".copy", ".COPY", ".cpy", ".CPY"),
            Optional.of(CopybookName.builder().displayName("A").extension("copy").build())
        ),
        Arguments.of(
            Arrays.asList(".xyz", ".CPY", ".cpy", ".COPY", ".copy"),
            Optional.of(CopybookName.builder().displayName("A").extension("CPY").build())
        ),
        Arguments.of(
            Arrays.asList(".xyz", ".acd"),
            Optional.empty()
        ),
        Arguments.of(
            Arrays.asList("", ".copy"),
            Optional.of(CopybookName.builder().displayName("A").extension("").build())
        ),
        Arguments.of(
            emptyList(),
            Optional.empty()
        ),
        Arguments.of(
            Arrays.asList(".COPY", ".copy"),
            Optional.of(CopybookName.builder().displayName("A").extension("COPY").build())
        )
    );
  }

  @ParameterizedTest
  @MethodSource("copybooksWithExtensionsOrderData")
  void testCopybooksWithExtensionsOrder(
      List<String> extensionsInConfig,
      Optional<CopybookName> copybookFound
  ) {

    validFoldersMock();
    when(settingsService.fetchTextConfiguration(
        CPY_EXTENSIONS.label)).thenReturn(CompletableFuture.completedFuture(extensionsInConfig));
    when(files.listFilesInDirectory(anyString())).thenReturn(emptyList());
    when(files.listFilesInDirectory(anyString())).thenReturn(Arrays.asList("A.CPY", "A.COPY", "A.cpy", "A.copy", "A"));

    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);
    copybookNameService.collectLocalCopybookNames();

    assertEquals(copybookFound, copybookNameService.findByName("A"));

  }

  /** Test scenarios when the copybook local path exists in the settings. */
  @ParameterizedTest
  @MethodSource("collectCopybookNamesData")
  void
  testValidFoldersWithCopybooks(
      List<String> filesInCopybookDirectory,
      List<String> extensionsInCofig,
      int expectedCopybookFound
  ) {
    validFoldersMock();
    when(settingsService.fetchTextConfiguration(
        CPY_EXTENSIONS.label)).thenReturn(CompletableFuture.completedFuture(extensionsInCofig));
    when(files.listFilesInDirectory(absoluteValidCpyPath)).thenReturn(filesInCopybookDirectory);

    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);
    copybookNameService.collectLocalCopybookNames();

    assertEquals(expectedCopybookFound, copybookNameService.getNames().size());
  }

  @Test
  void testNullPaths() {
    CopybookNameService copybookNameService =
        new CopybookNameServiceImpl(settingsService, files, provider);

    when(settingsService.fetchTextConfiguration(
        CPY_EXTENSIONS.label)).thenReturn(CompletableFuture.completedFuture(Collections.singletonList("cpy")));
    when(files.decodeURI(absoluteValidCpyPath)).thenReturn(null);
    when(files.getPathFromURI(absoluteValidCpyPath)).thenReturn(null);
    when(cpyPath.resolve(absoluteValidCpyPath)).thenReturn(null);

    copybookNameService.collectLocalCopybookNames();
    assertEquals(0, copybookNameService.getNames().size());
  }

  private void validFoldersMock() {
    when(wrkPath.toUri()).thenReturn(URI.create(workspaceProgramPath));
    when(cpyPath.toUri()).thenReturn(URI.create(absoluteValidCpyPath));

    when(files.getPathFromURI(workspaceProgramUri)).thenReturn(wrkPath);

    when(files.fileExists(wrkPath)).thenReturn(true);
    when(files.fileExists(cpyPath)).thenReturn(true);
  }
}
