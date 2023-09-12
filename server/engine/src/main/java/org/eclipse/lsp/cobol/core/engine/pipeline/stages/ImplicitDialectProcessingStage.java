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

import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/** Implicit dialects processing stage */
@RequiredArgsConstructor
public class ImplicitDialectProcessingStage implements Stage<DialectOutcome, CopybooksRepository> {
  private final DialectService dialectService;

  @Override
  public PipelineResult<DialectOutcome> run(
      AnalysisContext context, PipelineResult<CopybooksRepository> prevPipelineResult) {
    // Implicit dialect processing
    DialectOutcome dialectOutcome = processImplicitDialects(context, prevPipelineResult.getData());
    context.setCopybooksRepository(prevPipelineResult.getData());
    return new PipelineResult<>(dialectOutcome, dialectOutcome.isDialectMissed());
  }

  @Override
  public String getName() {
    return "Implicit dialects processing";
  }

  private DialectOutcome processImplicitDialects(
      AnalysisContext ctx, CopybooksRepository copybooksRepository) {
    CopybookConfig copybookConfig = ctx.getConfig().getCopybookConfig();
    DialectProcessingContext dialectProcessingContext =
        DialectProcessingContext.builder()
            .copybookConfig(copybookConfig)
            .programDocumentUri(ctx.getExtendedDocument().getUri())
            .extendedDocument(ctx.getExtendedDocument())
            .build();
    dialectProcessingContext.getExtendedDocument().commitTransformations();

    ResultWithErrors<DialectOutcome> dialectOutcomeResultWithErrors =
        dialectService.processImplicitDialects(ctx, new ArrayList<>(), dialectProcessingContext);

    DialectOutcome dialectOutcome = dialectOutcomeResultWithErrors.getResult();

    dialectOutcome.getDialectNodes().forEach(node -> node.getLocality().toOriginalLocation());
    Set<SyntaxError> actualErrors = new HashSet<>();
    dialectOutcomeResultWithErrors
        .getErrors()
        .forEach(
            error -> actualErrors.add(getOriginalErrorLocation(ctx, copybooksRepository, error)));
    ctx.getAccumulatedErrors().addAll(actualErrors);
    return dialectOutcome;
  }

  private SyntaxError getOriginalErrorLocation(
      AnalysisContext ctx, CopybooksRepository copybooksRepository, SyntaxError error) {
    Location location =
        ctx.getExtendedDocument().mapLocation(error.getLocation().getLocation().getRange());
    String copybookId = copybooksRepository.getCopybookIdByUri(location.getUri());
    OriginalLocation originalLocation = new OriginalLocation(location, copybookId);
    return error.toBuilder().location(originalLocation).build();
  }
}
