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
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@Slf4j
class PositiveTest extends FileBasedTest {
  @ParameterizedTest
  @MethodSource("org.eclipse.lsp.cobol.positive.FileBasedTest#getTextsToTest")
  @DisplayName("Parameterized - positive tests")
  @NullSource
  void test(CobolText text) {
    if (text == null) {
      return;
    }
    String fileName = text.getFileName();
    Map<ReportSection, List<SysprintSnap>> dataNameRefs = getDataNameRefs(fileName);
    LOG.debug("Processing: " + fileName);
    AnalysisConfig analysisConfig = AnalysisConfig.defaultConfig(ENABLED);
    UseCase useCase =
        UseCase.builder()
            .fileName(fileName)
            .text(text.getFullText())
            .copybooks(getCopybooks())
            .sqlBackend(analysisConfig.getCopybookConfig().getSqlBackend())
            .copybookProcessingMode(analysisConfig.getCopybookConfig().getCopybookProcessingMode())
            .features(analysisConfig.getFeatures())
            .dialects(analysisConfig.getDialects())
            .predefinedParagraphs(analysisConfig.getCopybookConfig().getPredefinedParagraphs())
            .build();
    AnalysisResult analyze = UseCaseUtils.analyze(useCase);
    PositiveTestUtility.assetDefinitionsNReferencesFromSnap(dataNameRefs, analyze.getRootNode(), fileName);
    assertNoError(fileName, analyze);
  }

  @AfterAll
  void check() {
    updateSnaps();
  }
}
