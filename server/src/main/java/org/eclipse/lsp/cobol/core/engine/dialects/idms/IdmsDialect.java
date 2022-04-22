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
package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.IdmsLexer;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectParserListener;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;
import org.eclipse.lsp.cobol.service.SubroutineService;

import java.util.ArrayList;
import java.util.List;

/** Process the text according to the IDMS rules */
public final class IdmsDialect implements CobolDialect {
  public static final String NAME = "IDMS";
  private final CopybookService copybookService;
  private final ParseTreeListener treeListener;
  private final MessageService messageService;
  private final SubroutineService subroutineService;

  public IdmsDialect(CopybookService copybookService,
                     ParseTreeListener treeListener,
                     MessageService messageService,
                     SubroutineService subroutineService) {
    this.copybookService = copybookService;
    this.treeListener = treeListener;
    this.messageService = messageService;
    this.subroutineService = subroutineService;
  }

  /**
   * Gets the name of the dialect
   * @return the name of the dialect
   */
  @Override
  public String getName() {
    return NAME;
  }

  /**
   * Processing the text according to the IDMS rules
   *
   * @param uri document URI
   * @param text document text
   * @param copybookConfig is a copybook config
   * @return the dialect processing result
   */
  public ResultWithErrors<DialectOutcome> processText(String uri,
                                                      String text,
                                                      CopybookConfig copybookConfig) {
    IdmsLexer lexer = new IdmsLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    IdmsParser parser = new IdmsParser(tokens);
    DialectParserListener listener = new DialectParserListener(uri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    IdmsVisitor visitor = new IdmsVisitor(copybookService, treeListener, messageService, subroutineService, copybookConfig, uri, text);
    List<Node> nodes = visitor.visitStartRule(parser.startRule());
    List<SyntaxError> errors = new ArrayList<>(listener.getErrors());
    return new ResultWithErrors<>(new DialectOutcome(visitor.getResultedText(), nodes), errors);
  }
}
