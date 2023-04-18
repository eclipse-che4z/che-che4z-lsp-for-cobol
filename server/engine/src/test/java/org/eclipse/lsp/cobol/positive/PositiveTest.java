/*
 * Copyright (c) 2020 Broadcom.
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

import com.google.inject.Injector;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.*;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.UseCaseInitializer;
import org.eclipse.lsp.cobol.test.engine.PredefinedCopybookUtils;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ServiceLoader;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import static java.lang.System.getProperty;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.positive.CobolTextRegistry.DEFAULT_LISTING_PATH;
import static org.eclipse.lsp.cobol.positive.CobolTextRegistry.PATH_TO_LISTING_SNAP;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@Slf4j
class PositiveTest {
  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";
  private CobolTextRegistry cobolTextRegistry;
  private final Injector injector;
  private final CleanerPreprocessor preprocessor;

  PositiveTest() {
    ServiceLoader<UseCaseInitializer> loader = ServiceLoader.load(UseCaseInitializer.class);
    injector = StreamSupport.stream(loader.spliterator(), false).findFirst()
            .map(UseCaseInitializer::createInjector)
            .orElseThrow(() -> new RuntimeException("UseCase initializer not found"));
    preprocessor = injector.getInstance(CleanerPreprocessor.class);
  }

  @MethodSource("getSources")
  @DisplayName("Parameterized - positive tests")
  @ParameterizedTest
  @Execution(ExecutionMode.CONCURRENT)
  void textTest(CobolText text, CobolTextRegistry cobolTextRegistry) {
    if (text == null) {
      return;
    }
    this.cobolTextRegistry = cobolTextRegistry;
    String fileName = text.getFileName();
    LOG.debug("Processing: " + fileName);
    AnalysisConfig analysisConfig = AnalysisConfig.defaultConfig(ENABLED);
    UseCase useCase =
            UseCase.builder()
                    .documentUri(fileName)
                    .text(text.getFullText())
                    .copybooks(getFileSpecificCopybooks(cobolTextRegistry, fileName))
                    .sqlBackend(analysisConfig.getCopybookConfig().getSqlBackend())
                    .copybookProcessingMode(ENABLED)
                    .features(analysisConfig.getFeatures())
                    .dialects(analysisConfig.getDialects())
                    .dialectsSettings(analysisConfig.getDialectsSettings())
                    .build();
    AnalysisResult analyze = analyze(useCase);
    PositiveTestUtility.assetDefinitionsNReferencesFromSnap(
            analyze.getSymbolTableMap(),
            cobolTextRegistry.getSnapForFile(fileName),
            analyze.getRootNode(),
            fileName);
    assertNoError(fileName, analyze);
  }

  static Stream<Arguments> getSources() {
    List<String> paths = Arrays.stream(ofNullable(getProperty(PATH_TO_TEST_RESOURCES))
            .orElse("../../tests/test_files/Cobol85PositiveTestsSuite")
            .split(",")).map(String::trim).collect(Collectors.toList());
    List<Arguments> arguments = new ArrayList<>();
    for (String path : paths) {
      CobolTextRegistry cobolTextRegistry = new FolderTextRegistry(path);
      for (CobolText text : cobolTextRegistry.getPositives()) {
        arguments.add(Arguments.arguments(text, cobolTextRegistry));
      }
    }
    return arguments.stream();
  }

  @AfterEach
  void check() {
    String listingSnap = ofNullable(getProperty(PATH_TO_LISTING_SNAP)).orElse(DEFAULT_LISTING_PATH);
    boolean updateFlag = ofNullable(getProperty("UpdateSnapListing")).orElse("false").equals("false");
    if (Files.exists(Paths.get(listingSnap)) && !updateFlag) {
      FolderTextRegistry textRegistry = (FolderTextRegistry) cobolTextRegistry;
      textRegistry.createListingSnap(textRegistry.getSnaps(), textRegistry.getTestResourcePath());
    }
  }

  void assertNoError(String fileName, AnalysisResult analyze) {
    List<Diagnostic> diagnostic = ofNullable(analyze.getDiagnostics().get(fileName))
            .map(diagnostics -> diagnostics.stream()
                    .filter(it -> it.getSeverity() == DiagnosticSeverity.Error)
                    .collect(toList()))
            .orElse(emptyList());
    assertEquals(0, diagnostic.size(), createErrorMessage(diagnostic, fileName));
  }

  private static String createErrorMessage(List<Diagnostic> diagnostics, String fileName) {
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

  protected List<CobolText> getFileSpecificCopybooks(CobolTextRegistry cobolTextRegistry, String fileName) {
    Stream<CobolText> cobolTextStream =
            cobolTextRegistry.getCopybooks().stream()
                    .filter(book -> cobolTextRegistry.getCopybooks(fileName.split("\\.")[0]).stream()
                            .noneMatch(b1 -> b1.getFileName().equals(book.getFileName())));
    return Stream.concat(
                    cobolTextStream, cobolTextRegistry.getCopybooks(fileName.split("\\.")[0]).stream())
            .collect(toList());
  }

  public AnalysisResult analyze(UseCase useCase) {
    CopybookService copybookService = injector.getInstance(CopybookService.class);
    PredefinedCopybookUtils.loadPredefinedCopybooks(useCase.getSqlBackend(), useCase.getCopybooks(), useCase.getDocumentUri())
            .forEach(pc -> copybookService.store(pc, true));

    useCase.getCopybooks()
            .forEach(cobolText -> {

              String copybookText = cobolText.getFullText();
              if (cobolText.isPreprocess()) {
                copybookText = preprocessor.cleanUpCode("uri", cobolText.getFullText())
                        .getResult().calculateExtendedText();
              }

              cobolText = new CobolText(cobolText.getFileName().toUpperCase(), cobolText.getDialectType(), copybookText);
              copybookService.store(UseCaseUtils.toCopybookModel(cobolText, useCase.getDocumentUri()), true);
            });

    SubroutineService subroutines = injector.getInstance(SubroutineService.class);
    useCase.getSubroutines().forEach(name -> subroutines.store(name, "URI:" + name));

    return injector
            .getInstance(LanguageEngineFacade.class)
            .analyze(useCase.getDocumentUri(), useCase.getText(), useCase.getAnalysisConfig());
  }

}
