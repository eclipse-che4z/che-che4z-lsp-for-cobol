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

package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

/** Test {@link SemanticElementOccurrences} */
class SemanticElementOccurrencesTest {

  private static final String TOKEN = "ANALYSIS";
  private static final String TEXT = "ANALYSIS SAMPLE TEXT";
  private static final String URI = "uri";
  private static final CobolDocumentModel DOCUMENT = new CobolDocumentModel(TEXT);
  private SemanticLocations semanticLocations_1;
  private SemanticLocations SemanticLocations_2;
  private SemanticElementOccurrences occurrences;

  @BeforeEach
  void getSemanticElementOccurrences() {
    semanticLocations_1 = mock(ParagraphLocations.class);
    SemanticLocations_2 = mock(ConstantLocations.class);
    occurrences = new SemanticElementOccurrences(Set.of(semanticLocations_1, SemanticLocations_2));
  }

  @Test
  void whenFindDefinitionsCalledWithNullParam_thenThrowException() {
    assertThrows(IllegalArgumentException.class, () -> occurrences.findDefinitions(null, null));
  }

  @Test
  void whenFindDefinitionsCalledWithNullModel_thenThrowException() {
    List<Location> definitions =
        occurrences.findDefinitions(null, new TextDocumentPositionParams());
    Assertions.assertEquals(0, definitions.size());
  }

  @Test
  void whenFindDefinitionsCalledWithEmptyPosition_thenThrowException() {
    assertThrows(
        IllegalArgumentException.class,
        () ->
            occurrences.findDefinitions(
                new CobolDocumentModel("TEST"), new TextDocumentPositionParams()));
  }

  @Test
  void whenFindDefinitionsBeforeAnalysis_thenReturnEmptyList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getMocksForBeforeAnalysis();
    List<Location> definitions = occurrences.findDefinitions(DOCUMENT, position);
    assertEquals(0, definitions.size());
    verify(semanticLocations_1).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2).containsToken(DOCUMENT, TOKEN);
  }

  @Test
  void whenFindDefinitionsAfterAnalysis_thenReturnDefnList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getAfterAnalysisMocks();
    List<Location> definitions = occurrences.findDefinitions(DOCUMENT, position);
    assertEquals(1, definitions.size());
    verify(semanticLocations_1).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2).containsToken(DOCUMENT, TOKEN);
  }

  @Test
  void whenFindReferenceBeforeAnalysis_thenReturnEmptyList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getMocksForBeforeAnalysis();
    List<Location> references =
        occurrences.findReferences(DOCUMENT, position, new ReferenceContext());
    assertEquals(0, references.size());
    verify(semanticLocations_1).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2).containsToken(DOCUMENT, TOKEN);
  }

  @Test
  void whenFindReferenceAfterAnalysis_thenReturnReferenceList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getAfterAnalysisMocks();
    List<Location> references =
        occurrences.findReferences(DOCUMENT, position, new ReferenceContext());
    assertEquals(1, references.size());
    verify(semanticLocations_1).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2).containsToken(DOCUMENT, TOKEN);
  }

  @Test
  void whenFindReferenceAfterAnalysisWithReferenceContext_thenReturnReferenceList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getAfterAnalysisMocks();
    List<Location> references =
        occurrences.findReferences(DOCUMENT, position, new ReferenceContext(true));
    assertEquals(2, references.size());
    verify(semanticLocations_1, times(2)).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2, times(2)).containsToken(DOCUMENT, TOKEN);
  }

  @Test
  void whenFindHighlightsBeforeAnalysis_thenReturnEmptyList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getMocksForBeforeAnalysis();
    List<DocumentHighlight> highlights = occurrences.findHighlights(DOCUMENT, position);
    assertEquals(0, highlights.size());
    verify(semanticLocations_1, times(2)).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2, times(2)).containsToken(DOCUMENT, TOKEN);
  }

  @Test
  void whenFindHighlightsAfterAnalysis_thenReturnList() {
    TextDocumentPositionParams position = getTextDocumentPositionParams();
    getAfterAnalysisMocks();
    List<DocumentHighlight> highlights = occurrences.findHighlights(DOCUMENT, position);
    assertEquals(2, highlights.size());
    verify(semanticLocations_1, times(2)).containsToken(DOCUMENT, TOKEN);
    verify(SemanticLocations_2, times(2)).containsToken(DOCUMENT, TOKEN);
  }

  private TextDocumentPositionParams getTextDocumentPositionParams() {
    TextDocumentPositionParams position = new TextDocumentPositionParams();
    TextDocumentIdentifier textDocument = new TextDocumentIdentifier(URI);
    position.setTextDocument(textDocument);
    position.setPosition(new Position(0, 0));
    return position;
  }

  private void getMocksForBeforeAnalysis() {
    when(semanticLocations_1.containsToken(any(CobolDocumentModel.class), anyString()))
        .thenReturn(false);
    when(SemanticLocations_2.containsToken(any(CobolDocumentModel.class), anyString()))
        .thenReturn(false);
  }

  private void getAfterAnalysisMocks() {
    when(semanticLocations_1.containsToken(any(CobolDocumentModel.class), anyString()))
        .thenReturn(false);
    when(SemanticLocations_2.containsToken(any(CobolDocumentModel.class), anyString()))
        .thenReturn(true);
    when(semanticLocations_1.definitions(DOCUMENT)).thenReturn(Map.of());
    when(SemanticLocations_2.definitions(DOCUMENT))
        .thenReturn(Map.of(TOKEN, List.of(new Location(URI, new Range()))));
    when(semanticLocations_1.references(DOCUMENT)).thenReturn(Map.of());
    when(SemanticLocations_2.references(DOCUMENT))
        .thenReturn(Map.of(TOKEN, List.of(new Location(URI, new Range()))));
  }
}
