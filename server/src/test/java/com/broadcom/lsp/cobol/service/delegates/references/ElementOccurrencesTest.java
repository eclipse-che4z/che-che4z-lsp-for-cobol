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
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test {@link ElementOccurrences}
 */
class ElementOccurrencesTest {
    private static String URI = "uri";
    private static String URI2 = "uri2";
    private static String ELEMENT_NAME = "foo";

    @Test
    void simpleCaseOfDefinitionsAndUsages() {
        Location definition = new Location(URI, new Range(new Position(1, 2), new Position(2, 5)));
        Location usage = new Location(URI, new Range(new Position(3, 0), new Position(3, 5)));
        Position insideUsage = new Position(3, 1);
        AnalysisResult analysisResult = AnalysisResult.builder()
                .variableDefinitions(Map.of(ELEMENT_NAME, List.of(definition)))
                .variableUsages(Map.of(ELEMENT_NAME, List.of(usage)))
                .build();
        CobolDocumentModel cobolDocumentModel = new CobolDocumentModel("", analysisResult);
        TextDocumentPositionParams textDocumentPositionParams =
                new TextDocumentPositionParams(new TextDocumentIdentifier(URI), insideUsage);
        ElementOccurrences elementOccurrences = new ElementOccurrences();
        assertEquals(List.of(definition),
                elementOccurrences.findDefinitions(cobolDocumentModel, textDocumentPositionParams));
        assertEquals(List.of(usage),
                elementOccurrences.findReferences(cobolDocumentModel, textDocumentPositionParams, new ReferenceContext(false)));
        assertEquals(List.of(usage, definition),
                elementOccurrences.findReferences(cobolDocumentModel, textDocumentPositionParams, new ReferenceContext(true)));
    }

    @Test
    void findHighlights() {
        Range definitionRange = new Range(new Position(1, 2), new Position(2, 5));
        Location definition = new Location(URI, definitionRange);
        Range usageRange = new Range(new Position(3, 0), new Position(3, 5));
        Location usage = new Location(URI, usageRange);
        Location usageInOtherFile = new Location(URI2, new Range(new Position(3, 0), new Position(3, 5)));
        Position insideUsage = new Position(3, 1);
        AnalysisResult analysisResult = AnalysisResult.builder()
                .variableDefinitions(Map.of(ELEMENT_NAME, List.of(definition)))
                .variableUsages(Map.of(ELEMENT_NAME, List.of(usage, usageInOtherFile)))
                .build();
        List<DocumentHighlight> highlights = new ElementOccurrences().findHighlights(
                new CobolDocumentModel("", analysisResult),
                new TextDocumentPositionParams(new TextDocumentIdentifier(URI), insideUsage));
        List<DocumentHighlight> expectedHighlights = List.of(
                new DocumentHighlight(usageRange, DocumentHighlightKind.Text),
                new DocumentHighlight(definitionRange, DocumentHighlightKind.Text));
        assertEquals(expectedHighlights, highlights);
    }

    static Stream<Arguments> variousData() {
        Location definition = new Location(URI, new Range(new Position(1, 2), new Position(2, 5)));
        Map<String, List<Location>> definitionMap = Map.of(ELEMENT_NAME, List.of(definition));
        Location usage = new Location(URI, new Range(new Position(3, 0), new Position(3, 5)));
        Map<String, List<Location>> usageMap = Map.of(ELEMENT_NAME, List.of(usage));
        Location usageInOtherFile = new Location(URI2, new Range(new Position(3, 0), new Position(3, 5)));
        Position insideDefinition = new Position(1, 5);
        Position insideUsage = new Position(3, 1);
        return Stream.of(
                // find variables usage by usage position
                Arguments.of(
                        AnalysisResult.builder().variableDefinitions(definitionMap).variableUsages(usageMap).build(),
                        insideUsage,
                        List.of(usage)),
                // find variables usage by definition position
                Arguments.of(
                        AnalysisResult.builder().variableDefinitions(definitionMap).variableUsages(usageMap).build(),
                        insideDefinition,
                        List.of(usage)),
                // same position from other URI
                Arguments.of(
                        AnalysisResult.builder().variableDefinitions(definitionMap)
                                .variableUsages(Map.of(ELEMENT_NAME, List.of(usageInOtherFile))).build(),
                        insideUsage,
                        List.of()),
                // find paragraph usage by usage position
                Arguments.of(
                        AnalysisResult.builder().paragraphDefinitions(definitionMap).paragraphUsages(usageMap).build(),
                        insideUsage,
                        List.of(usage)),
                // find paragraph usage by definition position
                Arguments.of(
                        AnalysisResult.builder().paragraphDefinitions(definitionMap).paragraphUsages(usageMap).build(),
                        insideDefinition,
                        List.of(usage)),
                // find section usage by usage position
                Arguments.of(
                        AnalysisResult.builder().sectionDefinitions(definitionMap).sectionUsages(usageMap).build(),
                        insideUsage,
                        List.of(usage)),
                // find section usage by definition position
                Arguments.of(
                        AnalysisResult.builder().sectionDefinitions(definitionMap).sectionUsages(usageMap).build(),
                        insideDefinition,
                        List.of(usage)),
                // find constant usage by usage position
                Arguments.of(
                        AnalysisResult.builder().constantDefinitions(definitionMap).constantUsages(usageMap).build(),
                        insideUsage,
                        List.of(usage)),
                // find constant usage by definition position
                Arguments.of(
                        AnalysisResult.builder().constantDefinitions(definitionMap).constantUsages(usageMap).build(),
                        insideDefinition,
                        List.of(usage)),
                // find copybook usage by usage position
                Arguments.of(
                        AnalysisResult.builder().copybookDefinitions(definitionMap).copybookUsages(usageMap).build(),
                        insideUsage,
                        List.of(usage)),
                // find copybook usage by definition position
                Arguments.of(
                        AnalysisResult.builder().copybookDefinitions(definitionMap).copybookUsages(usageMap).build(),
                        insideDefinition,
                        List.of(usage)),
                // find subroutine usage by usage position
                Arguments.of(
                        AnalysisResult.builder().subroutineDefinitions(definitionMap).subroutineUsages(usageMap).build(),
                        insideUsage,
                        List.of(usage)),
                // find subroutine usage by definition position
                Arguments.of(
                        AnalysisResult.builder().subroutineDefinitions(definitionMap).subroutineUsages(usageMap).build(),
                        insideDefinition,
                        List.of(usage)),
                // find all variables usages in all files by usage position
                Arguments.of(
                        AnalysisResult.builder().variableDefinitions(definitionMap).variableUsages(
                                Map.of(ELEMENT_NAME, List.of(usage, usageInOtherFile))
                        ).build(),
                        insideUsage,
                        List.of(usage, usageInOtherFile)),
                // give only needed usage even if other kind use the same name
                Arguments.of(
                        AnalysisResult.builder()
                                .variableDefinitions(definitionMap)
                                .variableUsages(usageMap)
                                .paragraphUsages(Map.of(ELEMENT_NAME, List.of(usageInOtherFile)))
                                .build(),
                        insideUsage,
                        List.of(usage))
                );
    }

    @ParameterizedTest
    @MethodSource("variousData")
    void variousCases(AnalysisResult analysisResult, Position position, List<Location> expectedLocations) {
        List<Location> actualLocations = new ElementOccurrences().findReferences(
                new CobolDocumentModel("", analysisResult),
                new TextDocumentPositionParams(new TextDocumentIdentifier(URI), position),
                new ReferenceContext(false)
        );
        assertEquals(expectedLocations, actualLocations);
    }

    static Stream<Arguments> insideTestData() {
        Location location = new Location(URI, new Range(new Position(2, 5), new Position(5, 10)));
        Position firstLine = new Position(1, 20);
        Position secondLineBeforeLocation = new Position(2, 3);
        Position locationStart = new Position(2, 5);
        Position secondLineInsideLocation = new Position(2, 9);
        Position thirdLine = new Position(3, 4);
        Position fifthLineInsideLocation = new Position(5, 2);
        Position locationEnd = new Position(5, 10);
        Position fifthLineAfterLocation = new Position(5, 20);
        Position seventhLine = new Position(7, 4);
        return Stream.of(
                Arguments.of(URI, firstLine, location, false),
                Arguments.of(URI, secondLineBeforeLocation, location, false),
                Arguments.of(URI, locationStart, location, true),
                Arguments.of(URI, secondLineInsideLocation, location, true),
                Arguments.of(URI, thirdLine, location, true),
                Arguments.of(URI2, thirdLine, location, false),
                Arguments.of(URI, fifthLineInsideLocation, location, true),
                Arguments.of(URI, locationEnd, location, true),
                Arguments.of(URI, fifthLineAfterLocation, location, false),
                Arguments.of(URI, seventhLine, location, false)
        );
    }

    @ParameterizedTest
    @MethodSource("insideTestData")
    void isInsideTest(String uri, Position position, Location location, boolean result) {
        assertEquals(result, ElementOccurrences.isInside(
                new TextDocumentPositionParams(new TextDocumentIdentifier(uri), position),
                location));
    }

}
