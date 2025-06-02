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
import java.util.Map;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS RESYNC ENTRYNAME command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-resync-entryname">RESYNC ENTRYNAME
 * SP Command</a>
 *
 * <p>This class tests all variations of the RESYNC ENTRYNAME command found in the link above.
 */
public class TestCICSResyncEntrynameSP {
  private static final String RESYNC_VALID =
      "RESYNC ENTRYNAME({$varFour}) QUALIFIER({$varFour}) IDLIST({$varFour}) PARTIAL"
          + " IDLISTLENGTH({$varFour})";

  private static final String RESYNC_INVALID =
      "RESYNC {_ENTRYNAME({$varFour}) QUALIFIER({$varFour}) IDLISTLENGTH({$varFour})|error_}";
  private static final String RESYNC_NOLENGHT_INVALID =
      "RESYNC {_ENTRYNAME({$varFour}) QUALIFIER({$varFour}) IDLIST({$varFour}) PARTIAL|error_}";

  @Test
  void testResyncValid() {
    CICSTestUtils.noErrorTest(RESYNC_VALID, "SP");
  }

  @Test
  void testResyncInvalidAbcode() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: IDLISTLENGTH without IDLIST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RESYNC_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testResyncNoLengthInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: IDLISTLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RESYNC_NOLENGHT_INVALID, expectedDiagnostic, "SP", "NOLENGTH");
  }
}
