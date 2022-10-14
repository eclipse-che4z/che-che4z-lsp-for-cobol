/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.service.utils;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mockStatic;
import static org.mockito.Mockito.times;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.stream.Stream;
import org.apache.commons.io.FileSystem;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.mockito.MockedStatic;

/** This test checks the logic File Service methods that do not interact with the file system */
class WorkspaceFileServiceTest {

  private static String pathPrefix() {
    return FileSystem.WINDOWS.equals(FileSystem.getCurrent()) ? "c:/" : "/";
  }

  private static String uriPrefix() {
    return "file:///" + pathPrefix();
  }

  @Test
  void getNameFromURIWithExtension() {
    assertEquals(
        "ACTSOAPI.cbl",
        new WorkspaceFileService()
            .getNameFromURI(uriPrefix() + "workspace/POSITIVE_TESTS/positive/ACTSOAPI.cbl"));
  }

  @Test
  void getNameFromURIWithoutExtension() {
    assertEquals(
        "ACTSOAPI",
        new WorkspaceFileService()
            .getNameFromURI(uriPrefix() + "workspace/POSITIVE_TESTS/positive/ACTSOAPI"));
  }

  @Test
  void getNameFromURIEmpty() {
    assertEquals("", new WorkspaceFileService().getNameFromURI(""));
  }

  @Test
  void getNameFromURIOnlyNameWithExtension() {
    assertEquals("document.cbl", new WorkspaceFileService().getNameFromURI("document.cbl"));
  }

  @Test
  void getNameFromURIOnlyName() {
    assertEquals("document", new WorkspaceFileService().getNameFromURI("document"));
  }

  @Test
  void getNameFromURIDataset() {
    assertEquals(
        "AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl",
        new WorkspaceFileService()
            .getNameFromURI(
                uriPrefix() + "workspace/POSITIVE_TESTS/.e4e/AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl"));
  }


  static Stream<Arguments> listFilesSource() {
    return Stream.of(
        Arguments.of(
            pathPrefix() + "workspace/POSITIVE_TESTS/",
            uriPrefix() + "workspace/POSITIVE_TESTS/",
            0),
        Arguments.of(
            pathPrefix() + "workspace/POSITIVE_TESTS/*",
            uriPrefix() + "workspace/POSITIVE_TESTS/",
            2),
        Arguments.of(
            pathPrefix() + "workspace/POSITIVE_TESTS/*/SUBFOLDER",
            uriPrefix() + "workspace/POSITIVE_TESTS/",
            3),
        Arguments.of(
            pathPrefix() + "workspace/POSITIVE_TESTS/${placeholder}/SUBFOLDER",
            uriPrefix() + "workspace/POSITIVE_TESTS/",
            3)
    );
  }

  @ParameterizedTest
  @MethodSource("listFilesSource")
  void listFilesInDirectory(
      String searchUri,
      String uriToTheFolder,
      int maxDepth
  ) {
    try (MockedStatic<Files> filesMock = mockStatic(Files.class)) {
      FileSystemService fileSystemService = new WorkspaceFileService();

      Path pathToTheFolder = fileSystemService.getPathFromURI(uriToTheFolder);

      filesMock.when(() -> Files.find(eq(pathToTheFolder), eq(maxDepth), any()))
          .thenReturn(Stream.of(fileSystemService.getPathFromURI("file:///")));

      fileSystemService.listFilesInDirectory(searchUri);

      filesMock.verify(
          () -> Files.find(eq(pathToTheFolder), eq(maxDepth), any()),
          times(1)
      );
    }
  }

  @Test
  void getNameFromURIWithQuery() {
    assertEquals(
        "CAWA02-version-0133ED5400EA4E17.cbl",
        new WorkspaceFileService()
            .getNameFromURI(
                "file:///c:/workspace/POSITIVE_TESTS/.e4e/CAWA02-version-0133ED5400EA4E17.cbl?%7B%22service%22:%7B%22credential%22:%7B%22"));
  }

  @Test
  void getNameFromURIWithQueryDataset() {
    assertEquals(
        "AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl",
        new WorkspaceFileService()
            .getNameFromURI(
                "file:///c:/workspace/POSITIVE_TESTS/.e4e/AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl?%7B%22service%22:%7B%22credential%22:%7B%22"));
  }
}
