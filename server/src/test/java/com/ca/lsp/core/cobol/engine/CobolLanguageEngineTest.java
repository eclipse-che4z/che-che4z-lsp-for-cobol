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

import com.ca.lsp.cobol.service.CopybookProcessingMode;
import com.ca.lsp.core.cobol.model.*;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.semantics.outline.NodeType;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Collection;
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
  private static final CopybookProcessingMode PROCESSING_MODE = CopybookProcessingMode.ENABLED;

  @Test
  void testLanguageEngineRun() {
    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);
    CobolLanguageEngine engine = new CobolLanguageEngine(preprocessor);

    Locality locality =
        Locality.builder()
            .uri(URI)
            .range(new Range(new Position(0, 0), new Position(0, 0)))
            .build();
    SyntaxError error =
        SyntaxError.syntaxError()
            .locality(locality)
            .suggestion("suggestion")
            .severity(ERROR)
            .build();

    ExtendedDocument extendedDocument =
        new ExtendedDocument(
            TEXT,
            new NamedSubContext(),
            Map.of(
                URI,
                new DocumentMapping(
                    List.of(
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 0), new Position(0, 7)))
                            .token("       ")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 7), new Position(0, 20)))
                            .token("IDENTIFICATION")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 21), new Position(0, 22)))
                            .token(" ")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 22), new Position(0, 29)))
                            .token("DIVISION")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 30), new Position(0, 31)))
                            .token(".")
                            .build()),
                    Map.of())),
            Map.of());

    when(preprocessor.process(URI, TEXT, PROCESSING_MODE))
        .thenReturn(new ResultWithErrors<>(extendedDocument, List.of(error)));

    Range outlineRange =
        new Range(new org.eclipse.lsp4j.Position(0, 7), new org.eclipse.lsp4j.Position(0, 30));
    List<DocumentSymbol> expectedOutlineTree =
        List.of(
            new DocumentSymbol(
                "PROGRAM",
                NodeType.PROGRAM.getSymbolKind(),
                outlineRange,
                outlineRange,
                "",
                List.of(
                    new DocumentSymbol(
                        "IDENTIFICATION DIVISION",
                        NodeType.DIVISION.getSymbolKind(),
                        outlineRange,
                        outlineRange,
                        "",
                        List.of()))));

    ResultWithErrors<SemanticContext> expected =
        new ResultWithErrors<>(
            new SemanticContext(
                Map.of(),
                Map.of(),
                Map.of(),
                Map.of(),
                getConstantDefinitions(),
                Map.of(),
                Map.of(),
                Map.of(),
                expectedOutlineTree),
            List.of(error));

    ResultWithErrors<SemanticContext> actual = engine.run(URI, TEXT, PROCESSING_MODE);

    assertEquals(expected, actual);
  }

  private Map<String, Collection<Location>> getConstantDefinitions() {
    Location mockLocation = new Location();
    Multimap<String, Location> result = HashMultimap.create();
    result.put("EIBAID", mockLocation);
    result.put("EIBATT", mockLocation);
    result.put("EIBCALEN", mockLocation);
    result.put("EIBCOMPL", mockLocation);
    result.put("EIBCONF", mockLocation);
    result.put("EIBCPOSN", mockLocation);
    result.put("EIBDATE", mockLocation);
    result.put("EIBDS", mockLocation);
    result.put("EIBEOC", mockLocation);
    result.put("EIBERR", mockLocation);
    result.put("EIBERRCD", mockLocation);
    result.put("EIBFMH", mockLocation);
    result.put("EIBFN", mockLocation);
    result.put("EIBFREE", mockLocation);
    result.put("EIBNODAT", mockLocation);
    result.put("EIBRCODE", mockLocation);
    result.put("EIBRECV", mockLocation);
    result.put("EIBREQID", mockLocation);
    result.put("EIBRESP", mockLocation);
    result.put("EIBRESP2", mockLocation);
    result.put("EIBRLDBK", mockLocation);
    result.put("EIBRSRCE", mockLocation);
    result.put("EIBSIG", mockLocation);
    result.put("EIBSYNC", mockLocation);
    result.put("EIBSYNRB", mockLocation);
    result.put("EIBTASKN", mockLocation);
    result.put("EIBTIME", mockLocation);
    result.put("EIBTRMID", mockLocation);
    result.put("EIBTRNID", mockLocation);
    return result.asMap();
  }
}
