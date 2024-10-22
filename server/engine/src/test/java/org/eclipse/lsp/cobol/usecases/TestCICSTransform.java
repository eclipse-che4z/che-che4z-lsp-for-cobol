/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.usecases;

import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.HashMap;

/**
 * Test CICS TRANSFORM command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-transform-zos-communications-server-default">TRANSFORM
 * Command</a>
 *
 * <p>This class tests all variations of the TRANSFORM command found in the link above.
 */
public class TestCICSTransform {

    // Main Building Blocks
    private static final String BASE_TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. ABCDEF.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    private static final String TRANSFORM_DATATOJSON_VALID = "TRANSFORM DATATOJSON CHANNEL(3) INCONTAINER(123) OUTCONTAINER(123) TRANSFORMER(123)";
    private static final String TRANSFORM_JSONTODATA_VALID = "TRANSFORM JSONTODATA CHANNEL(3) INCONTAINER(123) OUTCONTAINER(123) TRANSFORMER(123)";

    private static final String TRANSFORM_DATATOXML_VALID = "TRANSFORM DATATOXML CHANNEL(3) DATCONTAINER(123) ELEMNAME(123) ELEMNAMELEN(123) ELEMNS(123) ELEMNSLEN(123) TYPENAME(123) TYPENAMELEN(123) TYPENS(123) TYPENSLEN(123) XMLCONTAINER(123) XMLTRANSFORM(123)";
    private static final String TRANSFORM_XMLTODATA_VALID = "TRANSFORM XMLTODATA CHANNEL(3) DATCONTAINER(123) ELEMNAME(123) ELEMNAMELEN(123) ELEMNS(123) ELEMNSLEN(123) NSCONTAINER(123) TYPENAME(123) TYPENAMELEN(123) TYPENS(123) TYPENSLEN(123) XMLCONTAINER(123) XMLTRANSFORM(123)";


    private static final String TRANSFORM_DATATOXML_INVALID = "TRANSFORM DATATOXML CHANNEL(3) DATCONTAINER(123) {NSCONTAINER|errorOne}(123) XMLTRANSFORM(123)";


    @Test
    protected void testDataToJSON() {
        CICSTestUtils.noErrorTest(TRANSFORM_DATATOJSON_VALID);
    }

    @Test
    protected void testJSONToData() {
        CICSTestUtils.noErrorTest(TRANSFORM_JSONTODATA_VALID);
    }

    @Test
    protected void testDataToXML() {
        CICSTestUtils.noErrorTest(TRANSFORM_DATATOXML_VALID);
    }

    @Test
    protected void testXMLToData() {
        CICSTestUtils.noErrorTest(TRANSFORM_XMLTODATA_VALID);
    }


    @Test
    protected void testInvalidDataToXML() {
        HashMap<String, Diagnostic> tempDiagnostic = new HashMap<>();
        tempDiagnostic.put("errorOne",
                new Diagnostic(
                        new Range(),
                        "Invalid option provided: NSCONTAINER",
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(TRANSFORM_DATATOXML_INVALID, tempDiagnostic);
    }
}
