/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.hp;

import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;

/**
 * Cleanup preprocessor pipeline stage
 */
public class HpCleanupStage implements Stage<AnalysisContext, Void, Void> {

  private final CleanerPreprocessor preprocessor;

  public HpCleanupStage(CleanerPreprocessor preprocessor) {
    this.preprocessor = preprocessor;
  }

  @Override
  public StageResult<Void> run(AnalysisContext context, StageResult<Void> prevStageResult) {
    ResultWithErrors<ExtendedText> resultWithErrors = preprocessor.cleanUpCode(
        context.getDocumentUri(),
        context.getText());

    context.getAccumulatedErrors().addAll(resultWithErrors.getErrors());
    context.setExtendedDocument(new ExtendedDocument(resultWithErrors.getResult(), context.getText()));

    return new StageResult<>(null);
  }

  @Override
  public String getName() {
    return "Cleanup document processing";
  }

}
