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
package org.eclipse.lsp.cobol.core.engine.analysis;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;

import java.util.List;

/**
 * Generates nodes for embedded code
 */
@Singleton
public class EmbeddedCodeService {
  private final MessageService messageService;

  @Inject
  public EmbeddedCodeService(MessageService messageService) {
    this.messageService = messageService;
  }

  /**
   * Extract Embedded Code
   * @param extendedSource is extended source
   * @param listener a parser listener
   * @param tree a CST root
   * @param treeListener a Parse Tree Listener
   * @param programUri a program uri
   * @param features is a list of language features such as CICS or SQL
   * @return a list of embedded code nodes with errors
   */
  public ResultWithErrors<List<Node>> generateNodes(
      ExtendedSource extendedSource,
      ParserListener listener,
      CobolParser.StartRuleContext tree,
      ParseTreeListener treeListener,
      String programUri,
      List<EmbeddedLanguage> features) {

    EmbeddedCodeListener embeddedLanguagesListener = new EmbeddedCodeListener(messageService, treeListener, listener, programUri, features, extendedSource);
    new ParseTreeWalker().walk(embeddedLanguagesListener, tree);
    return new ResultWithErrors<>(embeddedLanguagesListener.getResultNodes(), embeddedLanguagesListener.getErrors());
  }

}
