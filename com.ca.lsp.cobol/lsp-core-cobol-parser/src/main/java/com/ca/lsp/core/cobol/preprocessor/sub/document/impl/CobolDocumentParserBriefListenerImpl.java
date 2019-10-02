/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.ca.lsp.core.cobol.model.MappingToken;
import com.ca.lsp.core.cobol.model.Position;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolDocumentParserListener;
import org.antlr.v4.runtime.Token;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;

/**
 * ANTLR visitor, which preprocesses a given COBOL program by executing COPY and REPLACE statements.
 */
public class CobolDocumentParserBriefListenerImpl extends CobolPreprocessorBaseListener
    implements CobolDocumentParserListener {

  private final Deque<CobolDocumentContext> contexts = new ArrayDeque<>();
  private List<MappingToken> copybookDefinitions;

  public CobolDocumentParserBriefListenerImpl(List<MappingToken> copybookDefinitions) {
    contexts.push(new CobolDocumentContext());
    this.copybookDefinitions = copybookDefinitions;
  }

  @Override
  public CobolDocumentContext context() {
    return contexts.peek();
  }

  @Override
  public void exitCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {
    Position startPosition = convertToPosition(ctx.getStart());
    Position stopPosition = convertToPosition(ctx.getStop());

    String copybookName = ctx.getChildCount() > 0 ? ctx.getChild(1).getText() : "";
    MappingToken token = new MappingToken(copybookName, startPosition, stopPosition);
    copybookDefinitions.add(token);
  }

  private Position convertToPosition(Token start) {
    return new Position(
        start.getTokenIndex(),
        start.getStartIndex(),
        start.getStopIndex(),
        start.getLine(),
        start.getCharPositionInLine());
  }
}
