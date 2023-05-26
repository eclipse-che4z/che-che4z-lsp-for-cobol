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
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.analysis.EmbeddedCodeService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;

import java.util.List;

/**
 * Parsing embedded code (CICS, SQL) stage
 */
@RequiredArgsConstructor
public class EmbeddedCodeStage implements Stage<Pair<ParserStageResult, List<Node>>, ParserStageResult> {

  private final EmbeddedCodeService embeddedCodeService;
  private final ParseTreeListener treeListener;

  @Override
  public PipelineResult<Pair<ParserStageResult, List<Node>>> run(AnalysisContext context, PipelineResult<ParserStageResult> prevPipelineResult) {
    // Parse embedded code
    List<Node> embeddedNodes = embeddedCodeService.generateNodes(context.getExtendedSource(), new ParserListener(context.getExtendedSource(), context.getCopybooksRepository()),
            prevPipelineResult.getData().getTree(), treeListener, context.getDocumentUri(), context.getConfig().getFeatures())
        .unwrap(context.getAccumulatedErrors()::addAll);

    context.getExtendedSource().commitTransformations();
    Pair<ParserStageResult, List<Node>> result = Pair.of(prevPipelineResult.getData(), embeddedNodes);
    return new PipelineResult<>(result);
  }

  @Override
  public String getName() {
    return "Embedded code processing";
  }
}
