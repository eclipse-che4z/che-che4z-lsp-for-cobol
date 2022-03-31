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

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.core.DaCoLexer;
import org.eclipse.lsp.cobol.core.DaCoParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectParserListener;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;

import java.util.ArrayList;
import java.util.List;

/** Process the text according to the DaCo rules */
public final class DaCoDialect implements CobolDialect {
  public static final String NAME = "DaCo";

  /**
   * Processing the text according to the DaCo rules
   *
   * @param uri document URI
   * @param text document text
   * @param messageService error message service
   * @return the dialect processing result
   */
  @Override
  public ResultWithErrors<DialectOutcome> processText(String uri, String text, MessageService messageService) {
    DaCoLexer lexer = new DaCoLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    DaCoParser parser = new DaCoParser(tokens);
    DialectParserListener listener = new DialectParserListener(uri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    DaCoVisitor visitor = new DaCoVisitor(uri, text);
    List<Node> nodes = visitor.visitStartRule(parser.startRule());
    List<SyntaxError> errors = new ArrayList<>(listener.getErrors());
    return new ResultWithErrors<>(new DialectOutcome(visitor.getResultedText(), nodes), errors);
  }
}
