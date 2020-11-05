package com.broadcom.lsp.cobol.service.delegates.completions;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Test to check SectionCompletion */
class SectionCompletionTest {
    private static final String TEXT =
            "       Identification Division. \n"
                    + "       Program-id.    ProgramId.\n"
                    + "       Data Division.\n"
                    + "       Working-Storage Section.\n"
                    + "       01   outer1.\n"
                    + "        02   INNER1      PIC 9(4) Binary. \n"
                    + "        02   inner2      PIC X(10).\n"
                    + "       Procedure Division section.\n"
                    + "       000-Main-Logic Section.\n"
                    + "           Perform 100-Test.\n"
                    + "           Stop Run.\n"
                    + "       100-Test Section.\n"
                    + "           Move INNER1 of OUTER1 to Str.\n"
                    + "       End program ProgramId.";

    /**
     * this test creates a test document, scans it for section names, adds them to completionItems,
     * then attempts to find the expected output
     */
    @Test
    void testSectionCompletion() {
        CobolDocumentModel document = createModel();

        Completions completions = new Completions(Set.of(new SectionCompletion()));
        List<CompletionItem> completionItems =
                completions.collectFor(document, createCompletionParams()).getItems();

        assertEquals(2, completionItems.size());
        checkContains(completionItems.get(0), List.of("100-Test", "000-Main-Logic"));
        checkContains(completionItems.get(1), List.of("100-Test", "000-Main-Logic"));

        assertEquals(CompletionItemKind.Function, completionItems.get(0).getKind());
    }

    private void checkContains(CompletionItem item, List<String> values) {
        assertTrue(values.stream().anyMatch(v -> item.getLabel().contains(v)));
    }

    private CompletionParams createCompletionParams() {
        return new CompletionParams(new TextDocumentIdentifier("id"), new Position(8, 0));
    }

    private CobolDocumentModel createModel() {
        Map<String, List<Location>> sectionDefinitions = new HashMap<>();
        sectionDefinitions.put(
                "000-Main-Logic",
                Collections.singletonList(
                        new Location(null, new Range(new Position(7, 6), new Position(7, 20)))));
        sectionDefinitions.put(
                "100-Test",
                Collections.singletonList(
                        new Location(null, new Range(new Position(10, 6), new Position(10, 14)))));

        AnalysisResult result = AnalysisResult.empty().toBuilder().sectionDefinitions(sectionDefinitions).build();

        return new CobolDocumentModel(TEXT, result);
    }
}
