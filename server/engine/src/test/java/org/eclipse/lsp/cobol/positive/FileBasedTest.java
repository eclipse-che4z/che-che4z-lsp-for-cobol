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

import static java.lang.System.getProperty;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.positive.FolderTextRegistry.DEFAULT_LISTING_PATH;
import static org.eclipse.lsp.cobol.positive.FolderTextRegistry.PATH_TO_LISTING_SNAP;
import static org.junit.jupiter.api.Assertions.assertEquals;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.Gson;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;

/**
 * This abstract class encapsulates the common logic of all tests that use the positive test file
 * set.
 */
public abstract class FileBasedTest extends ConfigurableTest {

  static Stream<String> getSourceFolder() {
    String path = ofNullable(getProperty(PATH_TO_TEST_RESOURCES)).orElse("../../tests/test_files");
    return searchFolderToTest(Paths.get(path)).stream().map(p -> p.toAbsolutePath().toString());
  }

  private static List<Path> searchFolderToTest(Path path) {
    return searchFolderToTest(ImmutableList.of(path.toFile()));
  }

  private static List<Path> searchFolderToTest(List<File> files) {
    List<Path> paths = new ArrayList<>();
    for (File file : files) {
      if (file.isHidden()) continue;
      if (file.isDirectory()) {
        if (isValidTestFolder(file)) {
          paths.add(file.toPath());
        }
        paths.addAll(searchFolderToTest(listFiles(file)));
      }
    }
    return paths;
  }

  private static List<File> listFiles(File file) {
    return Optional.ofNullable(file.listFiles())
        .map(Arrays::stream)
        .orElse(Stream.empty())
        .collect(Collectors.toList());
  }

  private static boolean isValidTestFolder(File file) {
    return Optional.ofNullable(file.listFiles())
        .map(Arrays::stream)
        .orElse(Stream.empty())
        .anyMatch(f -> f.getName().equals("positive"));
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

  /**
   * Get the copybooks to be passed to the Language Server while analyzing from {@link
   * CobolTextRegistry} using file-based implementation.
   *
   * @return the list of all defined copybooks
   */
  protected static List<CobolText> getCopybooks(CobolTextRegistry textRegistry, String filename) {
    return textRegistry.getCopybooks(filename);
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
      textRegistry.createListingSnap(textRegistry.getSnaps(), textRegistry.getTestResourcePath());
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

  /**
   * Get the copybooks specific to a cobol file, to be passed to the Language Server while analyzing
   * from {@link CobolTextRegistry} using file-based implementation.
   *
   * @param cobolTextRegistry {@link CobolTextRegistry}
   * @param fileName file to be analysed
   * @return List of copybooks
   */
  protected List<CobolText> getFileSpecificCopybooks(
      CobolTextRegistry cobolTextRegistry, String fileName) {
    Stream<CobolText> cobolTextStream =
        getCopybooks(cobolTextRegistry).stream()
            .filter(
                book ->
                    getCopybooks(cobolTextRegistry, fileName.split("\\.")[0]).stream()
                        .noneMatch(b1 -> b1.getFileName().equals(book.getFileName())));
    return Stream.concat(
            cobolTextStream, getCopybooks(cobolTextRegistry, fileName.split("\\.")[0]).stream())
        .collect(toList());
  }

  /**
   * Returns a {@link AnalysisConfig} based on passed system variables
   *
   * @return {@link AnalysisConfig}
   */
  protected AnalysisConfig getAnalysisConfiguration(String testDialectsLists) {
    if (testDialectsLists.contains("DaCo")) {
      return DialectConfigs.getDaCoAnalysisConfig();
    }

    if (testDialectsLists.contains("IDMS")) {
      return new AnalysisConfig(
              ENABLED,
          ImmutableList.of("IDMS"),
          true,
          ImmutableList.of(),
          ImmutableMap.of("target-sql-backend", new Gson().toJsonTree(SQLBackend.DB2_SERVER)));
    }
    return AnalysisConfig.defaultConfig(ENABLED);
  }
}
