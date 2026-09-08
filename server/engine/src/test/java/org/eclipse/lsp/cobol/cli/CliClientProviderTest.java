/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.cli;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mockStatic;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import org.eclipse.lsp.cobol.cli.modules.CliClientProvider;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;

/**
 * Test that {@link CliClientProvider} resolves a relative copybook folder against the current
 * working directory rather than against the COBOL source file's own directory.
 */
class CliClientProviderTest {

  private static final String COBOL_FILE_URI = Paths.get("COBPGM", "COOL").toUri().toString();

  @Test
  void relativeCopybookFolderIsResolvedAgainstCurrentWorkingDirectory() {
    Path expected = Paths.get("").toAbsolutePath().resolve("COBCOPY").resolve("SIMPLE.cpy");

    try (MockedStatic<Files> files = mockStatic(Files.class)) {
      files.when(() -> Files.exists(expected)).thenReturn(true);

      CobolLanguageClient client = buildClient(new File("COBCOPY"));
      String uri = client.resolveCopybookUri(COBOL_FILE_URI, "SIMPLE", "COBOL").join();

      assertEquals(expected.toUri().toString(), uri);
    }
  }

  @Test
  void absoluteCopybookFolderIsUsedAsIs() {
    File absoluteFolder = Paths.get("").toAbsolutePath().resolve("workspace_root/COBCOPY").toFile();
    Path expected = absoluteFolder.toPath().resolve("SIMPLE.cpy");

    try (MockedStatic<Files> files = mockStatic(Files.class)) {
      files.when(() -> Files.exists(expected)).thenReturn(true);

      CobolLanguageClient client = buildClient(absoluteFolder);
      String uri = client.resolveCopybookUri(COBOL_FILE_URI, "SIMPLE", "COBOL").join();

      assertEquals(expected.toUri().toString(), uri);
    }
  }

  @Test
  void missingCopybookResolvesToNull() {
    try (MockedStatic<Files> files = mockStatic(Files.class)) {
      files.when(() -> Files.exists(any(Path.class))).thenReturn(false);

      CobolLanguageClient client = buildClient(new File("COBCOPY"));
      String uri = client.resolveCopybookUri(COBOL_FILE_URI, "DOES-NOT-EXIST", "COBOL").join();

      assertNull(uri);
    }
  }

  private static CobolLanguageClient buildClient(File copybookFolder) {
    CliClientProvider provider = new CliClientProvider();
    provider.setCpyPaths(Collections.singletonList(copybookFolder));
    provider.setCpyExt(Collections.singletonList(".cpy"));
    return provider.get();
  }
}
