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

import com.google.common.collect.ImmutableList;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.AntlrCobolParser;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.AstBuilder;
import org.eclipse.lsp.cobol.core.SplitParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;

/**
 * Parser stage
 */
@RequiredArgsConstructor
public class ParserStage implements Stage<ParserStageResult, DialectOutcome> {
  private static final String WH_PARSER = "hw.parser";
  private final MessageService messageService;
  private final ParseTreeListener treeListener;

  @Override
  public StageResult<ParserStageResult> run(AnalysisContext context, StageResult<DialectOutcome> prevStageResult) {
    // Run parser;
    context.setDialectNodes(ImmutableList.<Node>builder()
            .addAll(context.getDialectNodes())
            .addAll(prevStageResult.getData().getDialectNodes())
            .build());
    ParserListener listener = new ParserListener(context.getExtendedDocument(), context.getCopybooksRepository());
    CobolErrorStrategy errorStrategy = new CobolErrorStrategy(messageService);
    AstBuilder parser = System.getProperty("WH_PARSER") == null
            ? new AntlrCobolParser(CharStreams.fromString(context.getExtendedDocument().toString()),
                listener, errorStrategy, treeListener)
            : new SplitParser(CharStreams.fromString(context.getExtendedDocument().toString()),
                listener, errorStrategy, treeListener);
    CobolParser.StartRuleContext tree = parser.runParser();
    context.getAccumulatedErrors().addAll(listener.getErrors());
    return new StageResult<>(new ParserStageResult(parser.getTokens(), tree));
  }

  @Override
  public String getName() {
    return "Parsing stage";
  }
}
