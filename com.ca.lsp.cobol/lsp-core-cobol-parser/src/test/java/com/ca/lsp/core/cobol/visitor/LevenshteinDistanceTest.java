/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *   Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.visitor;

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.Token;
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
    when(node.getStart()).thenReturn(createNewToken("MOVES"));
    visitor.visitStatement(node);
    errors.forEach(errs -> System.out.println(errs.getSuggestion()));
    assertEquals(2, errors.size());
    assertEquals("Misspelled word, maybe you want to put MOVE", errors.get(1).getSuggestion());
  }

  private Token createNewToken(String text) {
    return new CommonToken(0, text);
  }
}
