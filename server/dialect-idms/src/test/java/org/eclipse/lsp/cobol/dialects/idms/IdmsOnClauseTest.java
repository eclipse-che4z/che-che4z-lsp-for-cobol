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
package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.base.Charsets;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.io.Files;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertNotNull;

/**
 * Test for ON clause in IDMS dialect
 */
@Slf4j
class IdmsOnClauseTest {
  @Test
  void positiveTest() throws IOException {

    List<File> files = getFiles("positive");

    for (File file : files) {
      AnalysisResult analysisResult = UseCaseEngine.runTestForDiagnostics(
          readFileContent(file),
          ImmutableList.of(),
          ImmutableMap.of(),
          ImmutableList.of(),
          DialectConfigs.getIDMSAnalysisConfig());

      assertNotNull(analysisResult);
    }
  }

  @Test
  void negativeTest() throws IOException {

    List<File> files = getFiles("negative");

    for (File file : files) {
      AnalysisResult analysisResult = UseCaseEngine.runTestForDiagnostics(
          readFileContent(file),
          ImmutableList.of(),
          ImmutableMap.of("1",
              new Diagnostic(
                  new Range(),
                  "ErrorStrategy.reportInputMismatch",
                  DiagnosticSeverity.Error,
                  ErrorSource.PARSING.getText())),
          ImmutableList.of(),
          DialectConfigs.getIDMSAnalysisConfig());

      assertNotNull(analysisResult);
    }
  }

  private List<File> getFiles(String subfolder) {
    Path negativePath = Paths.get("src", "test", "resources", subfolder);
    File negativeFolder = negativePath.toFile();
    return Optional.ofNullable(negativeFolder.listFiles())
        .map(Arrays::stream)
        .map(Stream::sorted)
        .map(stream -> stream.collect(Collectors.toList()))
        .orElseThrow(() -> new RuntimeException("Folder is empty"));
  }

  private String readFileContent(File file) throws IOException {
    LOG.info("Testing file: {}", file.getName());
    System.out.println("Testing file: " + file.getName());
    return Files.asCharSource(file, Charsets.UTF_8).read();
  }
}
