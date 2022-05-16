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

import com.google.common.collect.ImmutableList;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.IdmsCopyLexer;
import org.eclipse.lsp.cobol.core.IdmsCopyParser;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;

import java.util.List;

/**
 * Class implements idms copybook processing
 */
@RequiredArgsConstructor
class IdmsCopybookService {

  private final CopybookService copybookService;
  private final CopybookConfig copybookConfig;
  private final ParseTreeListener treeListener;
  private final MessageService messageService;

  /**
   * Process idms copybook
   * @param copybookModel - copybook model
   * @param parentLevel - copy statement parent level
   * @return - a list of generated nodes
   */
  public List<Node> processCopybook(CopybookModel copybookModel, int parentLevel) {
    return processNodes(copybookModel, parentLevel);
  }

  private List<Node> processNodes(CopybookModel copybookModel, int parentLevel) {
    if (copybookModel.getContent() == null) {
      return ImmutableList.of();
    }
    IdmsCopyLexer lexer = new IdmsCopyLexer(CharStreams.fromString(copybookModel.getContent()));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ParserListener listener = new ParserListener();
    lexer.addErrorListener(listener);

    IdmsCopyParser parser = getCobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);

    IdmsCopybookVisitor visitor = new IdmsCopybookVisitor(copybookService, copybookConfig, treeListener, messageService,
        copybookModel.getUri(), parentLevel);

    ParserRuleContext node = parser.startRule();
    return visitor.visit(node);
  }

  private IdmsCopyParser getCobolParser(CommonTokenStream tokens) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    return new IdmsCopyParser(tokens);
  }

}
