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

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

/**
 * Test CICS ENDBR  commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-endbr">ENDBR Command</a>
 *
 * <p>This class tests all variations of the ENDBR command found in the link above.
 */
public class TestCICSEndbr {
  private static final String ENDBR_FILE_VALID = "ENDBR  FILE({$varFour})";
  private static final String ENDBR_INVALID = "{ENDBR|error1|error2}";
  private static final String ENDBR_DATASET_VALID = "ENDBR  DATASET({$varFour})";
  private static final String ENDBR_FILE_DATASET_INVALID = "ENDBR  {FILE|error1}({$varFour}) {DATASET|error2}({$varFour})";
  private static final String ENDBR_FILE_REQID_VALID = "ENDBR FILE({$varFour}) REQID({$varOne})";
  private static final String ENDBR_FILE_SYSID_VALID = "ENDBR FILE({$varFour}) SYSID({$varOne})";
  private static final String ENDBR_FILE_REQID_SYSID_VALID = "ENDBR FILE({$varFour}) REQID({$varOne}) SYSID({$varFive})";

  @Test
  void testEndbrFileValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_VALID);
  }

  @Test
  void testEndbrInvalid() {
    CICSTestUtils.errorTest(ENDBR_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(new Position(13, 12), new Position(13, 12)),
                            "Exactly one option required, none provided: FILE or DATASET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(new Position(13, 12), new Position(13, 20)),
                            "Syntax error on 'END-EXEC'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
    }

  @Test
  void testEndbrDatasetValid() {
    CICSTestUtils.noErrorTest(ENDBR_DATASET_VALID);
  }

  @Test
  void testEndbrFileDatasetInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FILE or DATASET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FILE or DATASET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ENDBR_FILE_DATASET_INVALID, expectedDiagnostics);
  }
  @Test
  void testEndbrFileReqidValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_REQID_VALID);
  }

  @Test
  void testEndbrFileSysidValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_SYSID_VALID);
  }

  @Test
  void testEndbrFileReqidSysidValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_REQID_SYSID_VALID);
  }
}
