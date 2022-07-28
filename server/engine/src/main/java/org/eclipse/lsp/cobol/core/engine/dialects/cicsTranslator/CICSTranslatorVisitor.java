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
package org.eclipse.lsp.cobol.core.engine.dialects.cicsTranslator;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.CICSTranslatorParser;
import org.eclipse.lsp.cobol.core.CICSTranslatorParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.dialects.TextReplacement;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.List;

/**
 * This extension of {@link CICSTranslatorParserBaseVisitor} applies the text replacement based on
 * the abstract syntax tree built by {@link CICSTranslatorParser}.
 */
@Slf4j
public class CICSTranslatorVisitor extends CICSTranslatorParserBaseVisitor<List<Node>> {
  private final TextReplacement textReplacement;

  public CICSTranslatorVisitor(String text) {
    textReplacement = new TextReplacement(text);
  }

  /**
   * @param ctx the parse tree
   * @return List of {@link Node}
   */
  @Override
  public List<Node> visitCicsTranslatorStmt(CICSTranslatorParser.CicsTranslatorStmtContext ctx) {
    textReplacement.addReplacementContext(ctx, "ADATA", "");
    return visitChildren(ctx);
  }

  public String getResultedText() {
    return textReplacement.getResultingText();
  }
}
