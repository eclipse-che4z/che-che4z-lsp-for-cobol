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

package com.broadcom.lsp.cobol.core.preprocessor.delegates.impl;

import com.broadcom.lsp.cobol.core.model.*;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorListenerFactory;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorListenerImpl;
import com.broadcom.lsp.cobol.core.semantics.NamedSubContext;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.ArrayDeque;
import java.util.List;
import java.util.Map;

import static java.util.Collections.emptyList;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * This test checks the logic of {@link GrammarPreprocessorImpl}, including building the extended
 * document, and merging the nested copybooks mappings.
 */
class GrammarPreprocessorImplTest {

  private static final String DOCUMENT = "document";
  private static final String TEXT = "COPY CPYNAME.";
  private static final String RESULT = "RESULT";
  private static final CopybookProcessingMode PROCESSING_MODE = CopybookProcessingMode.ENABLED;
  private static final String CPYNAME = "CPYNAME";

  private static final Locality RESULT_POS =
      Locality.builder()
          .uri(CPYNAME)
          .range(new Range(new Position(0, 0), new Position(0, 6)))
          .build();
  private static final Locality CPYNAME_POS =
      Locality.builder()
          .uri(DOCUMENT)
          .range(new Range(new Position(0, 5), new Position(0, 12)))
          .build();
  private static final Locality COPY_POS =
      Locality.builder()
          .uri(DOCUMENT)
          .range(new Range(new Position(0, 0), new Position(0, 4)))
          .build();
  private Multimap<Integer, CobolLine> positionCorrectionMap = ArrayListMultimap.create();

  @Test
  void testBuildingExtendedDocument() {
    GrammarPreprocessorListenerImpl listener = mock(GrammarPreprocessorListenerImpl.class);
    GrammarPreprocessorListenerFactory factory = mock(GrammarPreprocessorListenerFactory.class);

    List<SyntaxError> errors = emptyList();
    ArrayDeque<CopybookUsage> copybookStack = new ArrayDeque<>();

    NamedSubContext copybooks = new NamedSubContext();
    copybooks.addUsage(CPYNAME, CPYNAME_POS.toLocation());
    DocumentMapping mainMapping = new DocumentMapping(List.of(CPYNAME_POS, COPY_POS), Map.of(0, 2));
    DocumentMapping cpyMapping = new DocumentMapping(List.of(RESULT_POS), Map.of());

    ExtendedDocument expectedDocument =
        new ExtendedDocument(
            RESULT, copybooks, Map.of(DOCUMENT, mainMapping, CPYNAME, cpyMapping), Map.of());

    when(factory.create(
            eq(DOCUMENT),
            any(BufferedTokenStream.class),
            eq(copybookStack),
            eq(PROCESSING_MODE),
            eq(positionCorrectionMap)))
        .thenReturn(listener);
    when(listener.getErrors()).thenReturn(errors);
    when(listener.getResult()).thenReturn(expectedDocument);

    GrammarPreprocessor preprocessor = new GrammarPreprocessorImpl(factory);

    ResultWithErrors<ExtendedDocument> extendedDocument =
        preprocessor.buildExtendedDocument(
            DOCUMENT, TEXT, copybookStack, PROCESSING_MODE, positionCorrectionMap);

    verify(factory)
        .create(
            eq(DOCUMENT),
            any(BufferedTokenStream.class),
            eq(copybookStack),
            eq(PROCESSING_MODE),
            eq(positionCorrectionMap));
    assertEquals(RESULT, extendedDocument.getResult().getText());
    assertEquals(copybooks, extendedDocument.getResult().getCopybooks());
    assertEquals(mainMapping, expectedDocument.getDocumentMapping().get(DOCUMENT));
    assertEquals(cpyMapping, expectedDocument.getDocumentMapping().get(CPYNAME));
    assertEquals(errors, extendedDocument.getErrors());
  }
}
