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

package org.eclipse.lsp.cobol.positive;

import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import static java.lang.System.getProperty;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.positive.FolderTextRegistry.DEFAULT_LISTING_PATH;
import static org.eclipse.lsp.cobol.positive.FolderTextRegistry.PATH_TO_LISTING_SNAP;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This abstract class encapsulates the common logic of all tests that use the positive test file
 * set.
 */
public abstract class FileBasedTest extends ConfigurableTest {

  static Stream<String> getSourceFolder() {
    return Arrays.stream(
        ofNullable(getProperty(PATH_TO_TEST_RESOURCES))
            .orElse("../../Cobol85PositiveTestsSuite")
            .split(","));
  }

  /**
   * Get the files to be analyzed by Language Server from {@link CobolTextRegistry} using file-based
   * implementation.
   *
   * @return the list of objects that would be passed to the constructor one by one
   */
  protected static List<CobolText> getTextsToTest(CobolTextRegistry textRegistry) {
    return textRegistry.getPositives();
  }
  /**
   * Get the copybooks to be passed to the Language Server while analyzing from {@link
   * CobolTextRegistry} using file-based implementation.
   *
   * @return the list of all defined copybooks
   */
  protected static List<CobolText> getCopybooks(CobolTextRegistry textRegistry) {
    return textRegistry.getCopybooks();
  }

  protected static Map<ReportSection, List<SysprintSnap>> getDataNameRefs(
      String filename, CobolTextRegistry textRegistry) {
    return textRegistry.getSnapForFile(filename);
  }

  /**
   * Check that there were no errors found.
   *
   * @param diagnostics list of diagnostic from the analysis result
   * @param fileName name of the file that has been tested
   */
  protected void assertNoSyntaxErrorsFound(List<Diagnostic> diagnostics, String fileName) {
    assertEquals(0, diagnostics.size(), createErrorMessage(diagnostics, fileName));
  }

  private String createErrorMessage(List<Diagnostic> diagnostics, String fileName) {
    StringBuilder result = new StringBuilder(fileName);
    result.append(" contains syntax errors:\r\n");
    diagnostics.forEach(
        it -> {
          result.append(it.getRange().getStart().getLine() + 1);
          result.append(":");
          result.append(it.getRange().getStart().getCharacter());
          result.append(" - ");
          result.append(it.getRange().getEnd().getLine() + 1);
          result.append(":");
          result.append(it.getRange().getEnd().getCharacter());
          result.append(" : ");
          result.append(it.getMessage());
          result.append("\r\n");
        });
    return result.toString();
  }

  void updateSnaps(CobolTextRegistry cobolTextRegistry) {
    String listingSnap = ofNullable(getProperty(PATH_TO_LISTING_SNAP)).orElse(DEFAULT_LISTING_PATH);
    String updateFlag = ofNullable(getProperty("UpdateSnapListing")).orElse("false");
    if (Files.exists(Paths.get(listingSnap)) && !updateFlag.equals("false")) {
      FolderTextRegistry textRegistry = (FolderTextRegistry) cobolTextRegistry;
      textRegistry.createListingSnap(textRegistry.getSnaps());
    }
  }

  void assertNoError(String fileName, AnalysisResult analyze) {
    List<Diagnostic> diagnostic =
        ofNullable(analyze.getDiagnostics().get(fileName))
            .map(
                diagnostics ->
                    diagnostics.stream()
                        .filter(it -> it.getSeverity() == DiagnosticSeverity.Error)
                        .collect(toList()))
            .orElse(emptyList());
    assertNoSyntaxErrorsFound(diagnostic, fileName);
  }
}
