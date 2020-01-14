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
import com.ca.lsp.core.cobol.model.Variable;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.utils.CustomToken;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class VariableDefinitionTest {
  private CobolVisitor visitor = new CobolVisitor();
  List<SyntaxError> errors = new CopyOnWriteArrayList<>();
  final SemanticContext semanticContext = new SemanticContext(new ArrayList<>());
  final String VARNAME = "custom";
  final String VARNAME2 = "notCustom";
  final String LEVEL_NUMBER = "05";
  final Variable VARIABLE = new Variable(LEVEL_NUMBER, VARNAME2);
  final Position VARIABLE_POSITION = new Position("", 1, 1, 1, 1);

  @Test
  public void testCheckIfVariableNotDefined() {
    semanticContext.getVariables().define(VARIABLE, VARIABLE_POSITION);
    CustomToken token = createNewToken(VARNAME);

    mockMethod(VARNAME, token);

    assertEquals(1, errors.size());
    assertEquals("Invalid definition for: " + VARNAME.toUpperCase(), errors.get(0).getSuggestion());
  }

  @Test
  public void checkIfVariableDefined() {
    semanticContext.getVariables().define(VARIABLE, VARIABLE_POSITION);
    CustomToken token = createNewToken(VARNAME2);

    mockMethod(VARNAME2, token);
    assertEquals(
        semanticContext
            .getVariables()
            .getDefinitions()
            .get(VARNAME2.toUpperCase())
            .iterator()
            .next(),
        VARIABLE_POSITION);
    assertEquals(0, errors.size());
  }

  private void mockMethod(String variableName, CustomToken token) {
    CobolParser.QualifiedDataNameFormat1Context node =
        mock(CobolParser.QualifiedDataNameFormat1Context.class);
    CobolParser.DataNameContext nodeData = mock(CobolParser.DataNameContext.class);

    when(node.dataName()).thenReturn(nodeData);
    when(nodeData.getStart()).thenReturn(token);
    when(nodeData.getText()).thenReturn(variableName);
    when(node.getStart()).thenReturn(token);

    visitor.setSemanticContext(semanticContext);
    visitor.setSemanticErrors(new SemanticListener(errors));
    visitor.visitQualifiedDataNameFormat1(node);
  }

  private CustomToken createNewToken(String text) {
    return new CustomToken(10, 10, text, 10, 10);
  }
}
