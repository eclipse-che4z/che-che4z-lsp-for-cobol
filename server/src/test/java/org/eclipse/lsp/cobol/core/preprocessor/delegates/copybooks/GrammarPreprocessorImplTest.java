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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static java.util.Collections.emptyList;
import static org.eclipse.lsp.cobol.service.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;
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

  @Test
  void testBuildingExtendedDocument() {
    GrammarPreprocessorListenerImpl listener = mock(GrammarPreprocessorListenerImpl.class);
    ReplacePreProcessorListener replaceListener = mock(ReplacePreProcessorListener.class);
    GrammarPreprocessorListenerFactory listenerFactory =
        mock(GrammarPreprocessorListenerFactory.class);
    ReplacePreprocessorFactory replacingFactory = mock(ReplacePreprocessorFactory.class);

    List<SyntaxError> errors = emptyList();

    NamedSubContext copybooks = new NamedSubContext();
    copybooks.addUsage(CPYNAME, CPYNAME_POS.toLocation());
    DocumentMapping mainMapping =
        new DocumentMapping(ImmutableList.of(CPYNAME_POS, COPY_POS), ImmutableMap.of(0, 2));
    DocumentMapping cpyMapping =
        new DocumentMapping(ImmutableList.of(RESULT_POS), ImmutableMap.of());

    ExtendedDocument expectedDocument =
        new ExtendedDocument(
            "", RESULT, copybooks, ImmutableMap.of(DOCUMENT, mainMapping, CPYNAME, cpyMapping));

    CopybookConfig cpyConfig = new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of());
    CopybookHierarchy hierarchy = new CopybookHierarchy();

    when(listenerFactory.create(
            eq(DOCUMENT), any(BufferedTokenStream.class), eq(cpyConfig), eq(hierarchy)))
        .thenReturn(listener);
    when(replacingFactory.create(eq(DOCUMENT), any(BufferedTokenStream.class), eq(hierarchy)))
        .thenReturn(replaceListener);
    when(listener.getResult()).thenReturn(new ResultWithErrors<>(expectedDocument, errors));
    when(replaceListener.getResult()).thenReturn(new ResultWithErrors<>(RESULT, errors));

    GrammarPreprocessor preprocessor =
        new GrammarPreprocessorImpl(listenerFactory, replacingFactory);

    ResultWithErrors<ExtendedDocument> extendedDocument =
        preprocessor.buildExtendedDocument(DOCUMENT, TEXT, cpyConfig, hierarchy);

    verify(listenerFactory)
        .create(eq(DOCUMENT), any(BufferedTokenStream.class), eq(cpyConfig), eq(hierarchy));
    verify(replacingFactory).create(eq(DOCUMENT), any(BufferedTokenStream.class), eq(hierarchy));
    assertEquals(RESULT, extendedDocument.getResult().getText());
    assertEquals(copybooks, extendedDocument.getResult().getCopybooks());
    assertEquals(mainMapping, expectedDocument.getDocumentMapping().get(DOCUMENT));
    assertEquals(cpyMapping, expectedDocument.getDocumentMapping().get(CPYNAME));
    assertEquals(errors, extendedDocument.getErrors());
  }
}
