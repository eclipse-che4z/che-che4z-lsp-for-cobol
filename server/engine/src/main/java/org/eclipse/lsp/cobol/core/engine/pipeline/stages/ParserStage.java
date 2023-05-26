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
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;

/**
 * Parser stage
 */
@RequiredArgsConstructor
public class ParserStage implements Stage<ParserStageResult, CopybooksRepository> {

  private final MessageService messageService;
  private final ParseTreeListener treeListener;

  @Override
  public PipelineResult<ParserStageResult> run(AnalysisContext context, PipelineResult<CopybooksRepository> prevPipelineResult) {
    // Run parser
    ParserListener listener = new ParserListener(context.getExtendedSource(), prevPipelineResult.getData());
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(context.getExtendedSource().extendedText()));
    lexer.removeErrorListeners();
    CommonTokenStream tokens = new CommonTokenStream(lexer);

    CobolParser.StartRuleContext tree = runParser(listener, lexer, tokens);

    context.getAccumulatedErrors().addAll(listener.getErrors());
    return new PipelineResult<>(new ParserStageResult(tokens, tree));
  }

  @Override
  public String getName() {
    return "Parsing stage";
  }

  private CobolParser.StartRuleContext runParser(ParserListener listener, CobolLexer lexer, CommonTokenStream tokens) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    lexer.addErrorListener(listener);
    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);
    return parser.startRule();
  }
}
