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

package com.ca.lsp.core.cobol.engine;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.DocumentMapping;
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This test checks the logic of {@link CobolLanguageEngine}. It should first run {@link
 * CobolPreprocessor} to clean up the given COBOL text, then apply syntax and semantic analysis. If
 * the text doesn't have any semantic elements, it should return an empty {@link SemanticContext}
 */
class CobolLanguageEngineTest {

  private static final String TEXT = "       IDENTIFICATION DIVISION.";
  private static final String URI = "document.cbl";
  private static final String SYNC_TYPE = "DID_OPEN";

  @Test
  void testLanguageEngineRun() {
    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);
    CobolLanguageEngine engine = new CobolLanguageEngine(preprocessor);

    Position position = new Position(URI, 0, 0, 0, 0, "");
    SyntaxError error =
        SyntaxError.syntaxError()
            .position(position)
            .suggestion("suggestion")
            .severity(ERROR)
            .build();

    ExtendedDocument extendedDocument =
        new ExtendedDocument(
            TEXT, new NamedSubContext(), Map.of(URI, new DocumentMapping(List.of(), Map.of())));

    when(preprocessor.process(URI, TEXT, SYNC_TYPE))
        .thenReturn(new ResultWithErrors<>(extendedDocument, List.of(error)));

    ResultWithErrors<SemanticContext> expected =
        new ResultWithErrors<>(
            new SemanticContext(Map.of(), Map.of(), Map.of(), Map.of(), Map.of(), Map.of()),
            List.of(error));

    ResultWithErrors<SemanticContext> actual = engine.run(URI, TEXT, SYNC_TYPE);

    assertEquals(expected, actual);
  }
}
