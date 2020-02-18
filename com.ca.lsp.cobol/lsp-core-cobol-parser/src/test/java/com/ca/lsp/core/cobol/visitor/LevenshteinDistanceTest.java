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

import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolParser.StatementContext;
import com.ca.lsp.core.cobol.utils.CustomToken;
import org.antlr.v4.runtime.Token;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Test a Levenshtein distance calculation for the misspelled words. */
public class LevenshteinDistanceTest {
  private static final String WRONG_TOKEN = "MOVES";

  /** Test the distance between wrong token and the keyword. */
  @Test
  public void testDistance() {
    CobolVisitor visitor = new CobolVisitor();
    StatementContext node = mock(StatementContext.class);
    when(node.getStart()).thenReturn(createNewToken());

    visitor.visitStatement(node);

    List<SyntaxError> errors = visitor.getErrors();
    assertEquals(1, errors.size());
    assertEquals("A misspelled word, maybe you want to put MOVE", errors.get(0).getSuggestion());
  }

  private Token createNewToken() {
    return new CustomToken(10, 10, WRONG_TOKEN, 10, 10);
  }
}
