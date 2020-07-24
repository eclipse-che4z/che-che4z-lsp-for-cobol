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

package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.*;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessorListenerFactory;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.junit.Test;

import java.util.ArrayDeque;
import java.util.List;
import java.util.Map;

import static java.util.Collections.emptyList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * This test checks the logic of {@link GrammarPreprocessorImpl}, including building the extended
 * document, and merging the nested copybooks mappings.
 */
public class GrammarPreprocessorImplTest {

  private static final String DOCUMENT = "document";
  private static final String TEXT = "COPY CPYNAME.";
  private static final String RESULT = "RESULT";
  private static final String SYNC_TYPE = "DID_OPEN";
  private static final String CPYNAME = "CPYNAME";

  private static final Position RESULT_POS = new Position(CPYNAME, 0, 6, 0, 0, null);
  private static final Position CPYNAME_POS = new Position(DOCUMENT, 5, 12, 0, 5, null);
  private static final Position COPY_POS = new Position(DOCUMENT, 0, 4, 0, 0, null);

  @Test
  public void testBuildingExtendedDocument() {
    GrammarPreprocessorListenerImpl listener = mock(GrammarPreprocessorListenerImpl.class);
    GrammarPreprocessorListenerFactory factory = mock(GrammarPreprocessorListenerFactory.class);

    List<SyntaxError> errors = emptyList();
    ArrayDeque<CopybookUsage> copybookStack = new ArrayDeque<>();

    NamedSubContext copybooks = new NamedSubContext();
    copybooks.addUsage(CPYNAME, CPYNAME_POS);
    DocumentMapping mainMapping = new DocumentMapping(List.of(CPYNAME_POS, COPY_POS), Map.of(0, 2));
    DocumentMapping cpyMapping = new DocumentMapping(List.of(RESULT_POS), Map.of());

    ExtendedDocument expectedDocument =
        new ExtendedDocument(RESULT, copybooks, Map.of(DOCUMENT, mainMapping, CPYNAME, cpyMapping));

    when(factory.create(
            eq(DOCUMENT), any(BufferedTokenStream.class), eq(copybookStack), eq(SYNC_TYPE)))
        .thenReturn(listener);
    when(listener.getErrors()).thenReturn(errors);
    when(listener.getResult()).thenReturn(expectedDocument);

    GrammarPreprocessor preprocessor = new GrammarPreprocessorImpl(factory);

    ResultWithErrors<ExtendedDocument> extendedDocument =
        preprocessor.buildExtendedDocument(DOCUMENT, TEXT, copybookStack, SYNC_TYPE);

    verify(factory)
        .create(eq(DOCUMENT), any(BufferedTokenStream.class), eq(copybookStack), eq(SYNC_TYPE));
    assertEquals(RESULT, extendedDocument.getResult().getText());
    assertEquals(copybooks, extendedDocument.getResult().getCopybooks());
    assertEquals(mainMapping, expectedDocument.getDocumentMapping().get(DOCUMENT));
    assertEquals(cpyMapping, expectedDocument.getDocumentMapping().get(CPYNAME));
    assertEquals(errors, extendedDocument.getErrors());
  }
}
