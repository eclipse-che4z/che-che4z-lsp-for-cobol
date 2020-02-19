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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.model.Variable;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.utils.CustomToken;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static com.ca.lsp.core.cobol.parser.CobolParser.DataNameContext;
import static com.ca.lsp.core.cobol.parser.CobolParser.QualifiedDataNameFormat1Context;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This tests checks the semantic analysis applied by the {@link CobolVisitor}, such as variables
 * usages for defined and not defined variables. The there is a usage of a variable that is not
 * found, then an error should be shown. Also, it should throw a suggestion if there is a typo in
 * keywords.
 */
public class VisitorSemanticAnalysisTest {
  private static final String WRONG_TOKEN = "MOVES";
  private static final String INVALID_VARIABLE = "defined";
  private static final String DEFINED_VARIABLE = "invalid";
  private static final String LEVEL_NUMBER = "05";

  private static final Position VARIABLE_POSITION = new Position("", 1, 1, 1, 1);

  /**
   * Check if there is an error shown the processing token if a variable do not present in the
   * semantic context.
   */
  @Test
  public void testVariableDefinitionNotFound() {
    CobolVisitor visitor = createVisitor(createSemanticContext(), INVALID_VARIABLE);

    List<SyntaxError> errors = visitor.getErrors();
    assertEquals(1, errors.size());
    assertEquals(
        "Invalid definition for: " + INVALID_VARIABLE.toUpperCase(), errors.get(0).getSuggestion());
  }

  /** Check if the usage of the variable that present in the semantic context found correctly. */
  @Test
  public void testDefinedVariableUsageIsFound() {
    SemanticContext semanticContext = createSemanticContext();
    CobolVisitor visitor = createVisitor(semanticContext, DEFINED_VARIABLE);

    assertEquals(
        VARIABLE_POSITION,
        semanticContext
            .getVariables()
            .getDefinitions()
            .get(DEFINED_VARIABLE.toUpperCase())
            .iterator()
            .next());
    assertEquals(0, visitor.getErrors().size());
  }

  /**
   * Check if visitor calculates distance between a wrong token and a keyword and returns a
   * suggestion with the closest keyword.
   */
  @Test
  public void testMisspelledKeywordDistance() {
    CobolVisitor visitor = new CobolVisitor(null, null);
    CobolParser.StatementContext node = mock(CobolParser.StatementContext.class);
    when(node.getStart()).thenReturn(createNewToken(WRONG_TOKEN));

    visitor.visitStatement(node);

    List<SyntaxError> errors = visitor.getErrors();
    assertEquals(1, errors.size());
    assertEquals("A misspelled word, maybe you want to put MOVE", errors.get(0).getSuggestion());
  }

  private CobolVisitor createVisitor(SemanticContext semanticContext, String variableName) {
    CobolVisitor visitor = new CobolVisitor(null, semanticContext);
    CustomToken token = createNewToken(variableName);

    visitor.visitQualifiedDataNameFormat1(mockMethod(token));

    return visitor;
  }

  private SemanticContext createSemanticContext() {
    SemanticContext semanticContext = new SemanticContext(new ArrayList<>());
    semanticContext
        .getVariables()
        .define(new Variable(LEVEL_NUMBER, DEFINED_VARIABLE), VARIABLE_POSITION);
    return semanticContext;
  }

  private QualifiedDataNameFormat1Context mockMethod(CustomToken token) {
    QualifiedDataNameFormat1Context node = mock(QualifiedDataNameFormat1Context.class);
    DataNameContext nodeData = mock(DataNameContext.class);

    when(node.dataName()).thenReturn(nodeData);
    when(nodeData.getStart()).thenReturn(token);
    when(nodeData.getText()).thenReturn(token.getText());
    when(node.getStart()).thenReturn(token);

    return node;
  }

  private CustomToken createNewToken(String text) {
    return new CustomToken(10, 10, text, 10, 10);
  }
}
