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

import java.util.HashMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS TRANSFORM command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-transform-zos-communications-server-default">TRANSFORM
 * Command</a>
 *
 * <p>This class tests all variations of the TRANSFORM command found in the link above.
 */
public class TestCICSTransform {
  private static final String TRANSFORM_DATATOJSON_VALID =
      "TRANSFORM DATATOJSON CHANNEL({$varOne}) INCONTAINER({$varOne}) OUTCONTAINER({$varOne})"
          + " TRANSFORMER({$varOne})";
  private static final String TRANSFORM_JSONTODATA_VALID =
      "TRANSFORM JSONTODATA CHANNEL({$varOne}) INCONTAINER({$varOne}) OUTCONTAINER({$varOne})"
          + " TRANSFORMER({$varOne})";

  private static final String TRANSFORM_DATATOXML_VALID =
      "TRANSFORM DATATOXML CHANNEL({$varOne}) DATCONTAINER({$varOne}) ELEMNAME({$varOne})"
          + " ELEMNAMELEN({$varOne}) ELEMNS({$varOne}) ELEMNSLEN({$varOne}) TYPENAME({$varOne})"
          + " TYPENAMELEN({$varOne}) TYPENS({$varOne}) TYPENSLEN({$varOne}) XMLCONTAINER({$varOne})"
          + " XMLTRANSFORM({$varOne})";
  private static final String TRANSFORM_XMLTODATA_VALID =
      "TRANSFORM XMLTODATA CHANNEL({$varOne}) DATCONTAINER({$varOne}) ELEMNAME({$varOne})"
          + " ELEMNAMELEN({$varOne}) ELEMNS({$varOne}) ELEMNSLEN({$varOne}) NSCONTAINER({$varOne})"
          + " TYPENAME({$varOne}) TYPENAMELEN({$varOne}) TYPENS({$varOne}) TYPENSLEN({$varOne})"
          + " XMLCONTAINER({$varOne}) XMLTRANSFORM({$varOne})";

  private static final String TRANSFORM_JSONTODATA_INVALID =
      "TRANSFORM {_DATATOJSON INCONTAINER({$varOne}) OUTCONTAINER({$varOne}) TRANSFORMER({$varOne}"
          + " )|errorOne_}";
  private static final String TRANSFORM_DATATOJSON_INVALID =
      "TRANSFORM {_JSONTODATA CHANNEL({$varOne}) OUTCONTAINER({$varOne}) TRANSFORMER({$varOne}"
          + " )|errorOne_}";

  private static final String TRANSFORM_DATATOXML_INVALID =
      "TRANSFORM DATATOXML CHANNEL({$varOne}) DATCONTAINER({$varOne})"
          + " {NSCONTAINER|errorOne}({$varOne}) XMLCONTAINER({$varOne}) XMLTRANSFORM({$varOne})";
  private static final String TRANSFORM_XMLTODATA_INVALID =
      "TRANSFORM {_XMLTODATA DATCONTAINER({$varOne}) ELEMNAME({$varOne}) ELEMNAMELEN({$varOne})"
          + " ELEMNS({$varOne}) ELEMNSLEN({$varOne}) NSCONTAINER({$varOne}) TYPENAME({$varOne})"
          + " TYPENAMELEN({$varOne}) TYPENS({$varOne}) TYPENSLEN({$varOne}) XMLCONTAINER({$varOne})"
          + " XMLTRANSFORM({$varOne} )|errorOne_}";

  private static final String TRANSFORM_BOTH_JSON_INVALID =
      "TRANSFORM {DATATOJSON|errorOne} {JSONTODATA|errorTwo} CHANNEL({$varOne})"
          + " INCONTAINER({$varOne}) OUTCONTAINER({$varOne}) TRANSFORMER({$varOne})";
  private static final String TRANSFORM_BOTH_XML_INVALID =
      "TRANSFORM {DATATOXML|errorOne} {XMLTODATA|errorTwo} CHANNEL({$varOne})"
          + " DATCONTAINER({$varOne}) ELEMNAME({$varOne}) ELEMNAMELEN({$varOne}) ELEMNS({$varOne})"
          + " ELEMNSLEN({$varOne}) TYPENAME({$varOne}) TYPENAMELEN({$varOne}) TYPENS({$varOne})"
          + " TYPENSLEN({$varOne}) XMLCONTAINER({$varOne}) XMLTRANSFORM({$varOne})";

  private void callErrorTest(String newCommand, String errorMessage) {
    HashMap<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put(
        "errorOne",
        new Diagnostic(
            new Range(), errorMessage, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(newCommand, tempDiagnostic);
  }

  private void twoErrorTest(String newCommand, String errorMsg1, String errorMsg2) {
    HashMap<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put(
        "errorOne",
        new Diagnostic(
            new Range(), errorMsg1, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
    tempDiagnostic.put(
        "errorTwo",
        new Diagnostic(
            new Range(), errorMsg2, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(newCommand, tempDiagnostic);
  }

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

  // Invalid tests
  @Test
  protected void testInvalidDatatoJSON() {
    callErrorTest(TRANSFORM_DATATOJSON_INVALID, "Missing required option: INCONTAINER");
  }

  @Test
  protected void testInvalidJSONToData() {
    callErrorTest(TRANSFORM_JSONTODATA_INVALID, "Missing required option: CHANNEL");
  }

  @Test
  protected void testInvalidDataToXML() {
    callErrorTest(TRANSFORM_DATATOXML_INVALID, "Invalid option provided: NSCONTAINER");
  }

  @Test
  protected void testInvalidXMLToData() {
    callErrorTest(TRANSFORM_XMLTODATA_INVALID, "Missing required option: CHANNEL");
  }

  @Test
  protected void testInvalidBothJSON() {
    twoErrorTest(
        TRANSFORM_BOTH_JSON_INVALID,
        "Exactly one option required, options are mutually exclusive: DATATOJSON or JSONTODATA",
        "Exactly one option required, options are mutually exclusive: DATATOJSON or JSONTODATA");
  }

  @Test
  protected void testInvalidBothXML() {
    twoErrorTest(
        TRANSFORM_BOTH_XML_INVALID,
        "Exactly one option required, options are mutually exclusive: DATATOXML or XMLTODATA",
        "Exactly one option required, options are mutually exclusive: DATATOXML or XMLTODATA");
  }
}
