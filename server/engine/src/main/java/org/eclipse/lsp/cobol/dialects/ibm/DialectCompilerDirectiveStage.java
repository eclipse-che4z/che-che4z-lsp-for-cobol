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
package org.eclipse.lsp.cobol.dialects.ibm;

import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSDialect;

/** Stage to process dialect nodes */
@RequiredArgsConstructor
public class DialectCompilerDirectiveStage implements Stage<AnalysisContext, Void, Void> {
  private final DialectService dialectService;

  @Override
  public StageResult<Void> run(AnalysisContext context, StageResult<Void> prevStageResult) {
    List<CompilerDirectiveNode> dialectCompilerDirectiveNodes = new ArrayList<>();
    dialectService.updateDialects(context.getConfig().getDialectRegistry());
    DialectProcessingContext dialectProcessingContext =
        DialectProcessingContext.builder()
            .config(context.getConfig())
            .programDocumentUri(context.getExtendedDocument().getUri())
            .extendedDocument(context.getExtendedDocument())
            .build();
    List<CobolDialect> allAvailableDialect =
        new ArrayList<>(dialectService.getActiveImplicitDialects(context.getConfig()));
    context.getConfig().getDialects().stream()
        .map(dialectService::getDialectByName)
        .forEach(dia -> dia.ifPresent(allAvailableDialect::add));

    allAvailableDialect.forEach(
        dialect ->
            dialectCompilerDirectiveNodes.addAll(
                dialect.getCompilerDirectives(
                    dialectProcessingContext, context.getAccumulatedErrors())));
    context.getDialectNodes().addAll(dialectCompilerDirectiveNodes);
    List<String> opts =
        context
            .getPreprocessorsDirectives()
            .computeIfAbsent(CICSDialect.DIALECT_NAME, k -> new ArrayList<>());
    dialectCompilerDirectiveNodes.stream()
        .map(CompilerDirectiveNode::getDirectiveText)
        .map(StringUtils::trimQuotes)
        .forEach(opts::add);
    return (StageResult<Void>) StageResult.empty();
  }

  @Override
  public String getName() {
    return "dialects compiler directives processing";
  }
}
