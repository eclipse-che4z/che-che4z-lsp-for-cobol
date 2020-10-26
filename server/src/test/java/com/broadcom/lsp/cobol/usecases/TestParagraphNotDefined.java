package com.broadcom.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestParagraphNotDefined extends NegativeUseCase {
    private static final String TEXT =
            "        IDENTIFICATION DIVISION.\r\n"
                    + "        PROGRAM-ID. test1.\r\n"
                    + "        DATA DIVISION.\r\n"
                    + "        WORKING-STORAGE SECTION.\r\n"
                    + "        PROCEDURE DIVISION.\r\n"
                    + "        PROGA.\r\n"
                    + "           PERFORM PRINT-DATA.";

    TestParagraphNotDefined() {
        super(TEXT);
    }

    @Test
    void testParagraphNotDefined() {
        super.test();
    }

    @Override
    protected void assertDiagnostics(List<Diagnostic> diagnostics) {
        assertEquals(1, diagnostics.size(), "Number of diagnostics");
        Diagnostic diagnostic = diagnostics.get(0);

        assertEquals(DiagnosticSeverity.Error, diagnostic.getSeverity());
        assertEquals("The following paragraph is not defined: PRINT-DATA", diagnostic.getMessage());
        assertEquals(new Range(new Position(6, 19), new Position(6, 29)), diagnostic.getRange());
    }
}
