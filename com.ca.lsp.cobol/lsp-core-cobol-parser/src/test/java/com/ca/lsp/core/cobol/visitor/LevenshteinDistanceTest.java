/*
 *
 *  * Copyright (c) 2020 Broadcom.
 *  * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *  *
 *  * This program and the accompanying materials are made
 *  * available under the terms of the Eclipse Public License 2.0
 *  * which is available at https://www.eclipse.org/legal/epl-2.0/
 *  *
 *  * SPDX-License-Identifier: EPL-2.0
 *  *
 *  * Contributors:
 *  *   Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.visitor;

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenSource;
import org.junit.Test;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

public class LevenshteinDistanceTest {
  private CobolVisitor visitor = new CobolVisitor();
  List<SyntaxError> errors = new CopyOnWriteArrayList<>();

  @Test
  public void testDistance() {
    errors.add(new SyntaxError(new Position("", 1, 1, 1, 1, 1), null, 2, "addedSuggestion", 2));
    visitor.setSemanticErrors(new SemanticListener(errors));
    CobolParser.StatementContext node = mock(CobolParser.StatementContext.class);
    when(node.getStart())
        .thenReturn(
            new Token() {
              @Override
              public String getText() {
                return "MOVES";
              }

              @Override
              public int getType() {
                return 0;
              }

              @Override
              public int getLine() {
                return 0;
              }

              @Override
              public int getCharPositionInLine() {
                return 0;
              }

              @Override
              public int getChannel() {
                return 0;
              }

              @Override
              public int getTokenIndex() {
                return 0;
              }

              @Override
              public int getStartIndex() {
                return 0;
              }

              @Override
              public int getStopIndex() {
                return 0;
              }

              @Override
              public TokenSource getTokenSource() {
                return null;
              }

              @Override
              public CharStream getInputStream() {
                return null;
              }
            });
    visitor.visitStatement(node);
    errors.forEach(errs -> System.out.println(errs.getSuggestion()));
    assertEquals(2, errors.size());
    assertEquals("Misspelled word, maybe you want to put MOVE", errors.get(1).getSuggestion());
  }
}
