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
package org.eclipse.lsp.cobol.core.engine.pipeline.stages;

import java.util.HashSet;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;

/**
 * Dialect Processing Stage
 */
@RequiredArgsConstructor
public class DialectProcessingStage implements Stage<DialectOutcome, Void> {

  private final DialectService dialectService;

  @Override
  public StageResult<DialectOutcome> run(AnalysisContext context, StageResult<Void> prevStageResult) {
    // Dialect processing
    dialectService.updateDialects(context.getConfig().getDialectRegistry());
    DialectOutcome dialectOutcome = processDialects(context);
    return new StageResult<>(dialectOutcome, dialectOutcome.isDialectMissed());
  }

  @Override
  public String getName() {
    return "Dialects processing";
  }

  private DialectOutcome processDialects(AnalysisContext ctx) {
    dialectService.addDialectPredefinedCopybooks(ctx.getConfig());
    DialectProcessingContext dialectProcessingContext =
        DialectProcessingContext.builder()
            .config(ctx.getConfig())
            .programDocumentUri(ctx.getExtendedDocument().getUri())
            .extendedDocument(ctx.getExtendedDocument())
            .build();
    dialectProcessingContext.getExtendedDocument().commitTransformations();

    DialectOutcome dialectOutcome = dialectService
        .process(ctx.getConfig().getDialects(), dialectProcessingContext)
        .unwrap(ctx.getAccumulatedErrors()::addAll);
    Set<SyntaxError> errors = new HashSet<>(ctx.getAccumulatedErrors());
    ctx.getAccumulatedErrors().clear();
    ctx.getAccumulatedErrors().addAll(errors);
    return dialectOutcome;
  }

}
