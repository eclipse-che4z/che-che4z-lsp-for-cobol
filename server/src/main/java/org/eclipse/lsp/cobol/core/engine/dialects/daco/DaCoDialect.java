/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.core.DaCoLexer;
import org.eclipse.lsp.cobol.core.DaCoParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectParserListener;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Process the text according to the DaCo rules
 */
@RequiredArgsConstructor
public final class DaCoDialect implements CobolDialect {
  public static final String NAME = "DaCo";
  private final Pattern dcdbPattern = Pattern.compile("^[\\s\\d]{7}D-[BC]", Pattern.MULTILINE);

  private final MessageService messageService;
  private final DaCoMaidProcessor maidProcessor;

  /**
   * Gets the name of the dialect
   *
   * @return the name of the dialect
   */
  @Override
  public String getName() {
    return DaCoDialect.NAME;
  }

  /**
   * Processing the text according to the DaCo rules
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    List<SyntaxError> errors = new ArrayList<>();
    DialectOutcome maidOutcome = maidProcessor.process(
            dcdbPattern.matcher(context.getText()).replaceAll("          "),
            context, errors);
    DaCoLexer lexer = new DaCoLexer(CharStreams.fromString(maidOutcome.getText()));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    DaCoParser parser = new DaCoParser(tokens);
    DialectParserListener listener = new DialectParserListener(context.getProgramDocumentUri());
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    DaCoVisitor visitor = new DaCoVisitor(context.getProgramDocumentUri(), maidOutcome.getText());
    List<Node> nodes = visitor.visitStartRule(parser.startRule());
    nodes.addAll(maidOutcome.getDialectNodes());
    errors.addAll(listener.getErrors());
    errors.addAll(visitor.getErrors());
    return new ResultWithErrors<>(new DialectOutcome(visitor.getResultedText(), nodes), errors);
  }
}
