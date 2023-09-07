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

package org.eclipse.lsp.cobol.test.engine;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.JsonElement;
import lombok.Builder;
import lombok.Getter;
import lombok.Singular;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.test.CobolText;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/** Defines all the required data for the test */
@Getter
@Builder
public class UseCase {
  /** Text to analyze */
  String text;
  /** Name of the processing file */
  @Builder.Default String documentUri = UseCaseUtils.DOCUMENT_URI;
  /** List of the copybooks need for the analysis */
  @Singular List<CobolText> copybooks;
  /** List of available subroutine names */
  @Singular List<String> subroutines;
  /** Copybook processing mode for the analysis */
  @Builder.Default
  CopybookProcessingMode copybookProcessingMode = CopybookProcessingMode.ENABLED;
  /** SQL Backend for the analysis */
  @Builder.Default SQLBackend sqlBackend = SQLBackend.DB2_SERVER;
  /** Analysis features (SQL, CICS, etc.) */
  @Builder.Default List<EmbeddedLanguage> features = Collections.emptyList();
  /** Analysis dialects */
  @Builder.Default List<String> dialects = Collections.emptyList();
  /** Dialects config */
  @Builder.Default Map<String, JsonElement> dialectsSettings = ImmutableMap.of();

  /** Compile options config */
  @Builder.Default List<String> compilerOptions = Collections.emptyList();

  @Builder.Default boolean cicsTranslator = true;
  /**
   * Get the {@link AnalysisConfig} using the specified processing mode and the {@link SQLBackend}
   * see {@link CopybookConfig}
   *
   * @return CopybookConfig for the analysis
   */
  public AnalysisConfig getAnalysisConfig() {
    AnalysisConfig analysisConfig = new AnalysisConfig(
            new CopybookConfig(copybookProcessingMode, sqlBackend),
            features,
            dialects,
            cicsTranslator,
            ImmutableList.of(),
            dialectsSettings);
    analysisConfig.getCompilerOptions().addAll(compilerOptions);
    return analysisConfig;
  }
}
