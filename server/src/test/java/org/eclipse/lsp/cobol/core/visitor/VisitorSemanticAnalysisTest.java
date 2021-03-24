/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.core.visitor;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.core.utils.CustomToken;
import org.eclipse.lsp.cobol.service.SubroutineService;
import com.google.common.collect.ImmutableMap;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This tests checks the semantic analysis applied by the {@link CobolVisitor}, such as variables
 * usages for defined and not defined variables. The there is a usage of a variable that is not
 * found, then an error should be shown. Also, it should throw a suggestion if there is a typo in
 * keywords.
 */
class VisitorSemanticAnalysisTest {
  private static final String WRONG_TOKEN = "MOVES";
  private static final String INVALID_VARIABLE = "invalid";

  /**
   * Check if visitor calculates distance between a wrong token and a keyword and returns a
   * suggestion with the closest keyword.
   */
  @Test
  void testMisspelledKeywordDistance() {

    CustomToken token = createNewToken(WRONG_TOKEN);
    StatementContext node = mock(StatementContext.class);
    when(node.getStart()).thenReturn(token);
    when(node.getStop()).thenReturn(token);
    MessageService messageService = mock(MessageService.class);
    when(messageService.getMessage(matches("CobolVisitor.misspelledWord"), matches("MOVE")))
        .thenReturn("A misspelled word, maybe you want to put MOVE");
    CommonTokenStream tokenStream = mock(CommonTokenStream.class);

    CobolVisitor visitor =
        new CobolVisitor(
            "",
            new NamedSubContext(),
            tokenStream,
            ImmutableMap.of(
                token,
                Locality.builder()
                    .range(new Range(new Position(0, 0), new Position(0, 0)))
                    .token(WRONG_TOKEN)
                    .build()),
            messageService,
            mock(SubroutineService.class));

    visitor.visitStatement(node);

    List<SyntaxError> errors = visitor.finishAnalysis().getErrors();
    assertEquals(1, errors.size());
    assertEquals("A misspelled word, maybe you want to put MOVE", errors.get(0).getSuggestion());
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
