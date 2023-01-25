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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@Slf4j
class PositiveTest extends FileBasedTest {

  private CobolTextRegistry cobolTextRegistry;

  @ParameterizedTest
  @MethodSource("getSourceFolder")
  @DisplayName("Parameterized - positive tests")
  @NullSource
  void test(String testFolder) {
    cobolTextRegistry = retrieveTextsRegistry(testFolder);
    List<CobolText> textsToTest = getTextsToTest(cobolTextRegistry);
    for (CobolText text : textsToTest) {
      if (text == null) {
        return;
      }
      String fileName = text.getFileName();
      Map<ReportSection, List<SysprintSnap>> dataNameRefs =
          getDataNameRefs(fileName, cobolTextRegistry);
      LOG.debug("Processing: " + fileName);
      AnalysisConfig analysisConfig = getAnalysisConfiguration();
      UseCase useCase =
          UseCase.builder()
              .documentUri(fileName)
              .text(text.getFullText())
              .copybooks(getFileSpecificCopybooks(cobolTextRegistry, fileName))
              .sqlBackend(analysisConfig.getCopybookConfig().getSqlBackend())
              .copybookProcessingMode(ENABLED)
              .features(analysisConfig.getFeatures())
              .dialects(analysisConfig.getDialects())
              .predefinedSections(analysisConfig.getCopybookConfig().getPredefinedSections())
              .build();
      AnalysisResult analyze = UseCaseUtils.analyze(useCase);
      PositiveTestUtility.assetDefinitionsNReferencesFromSnap(analyze.getSymbolTableMap(), dataNameRefs, analyze.getRootNode(), fileName);
      assertNoError(fileName, analyze);
    }
  }

  @AfterEach
  void check() {
    updateSnaps(cobolTextRegistry);
  }
}
