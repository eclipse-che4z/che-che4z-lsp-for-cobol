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
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS ADDRESS commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-address">ADDRESS Command</a>
 *
 * <p>This class tests all variations of the ADDRESS command: standard and SET.
 */
public class TestCICSAddress {
  private static final String ADDRESS_STANDARD_VALID_ONE =
          "ADDRESS ACEE({$varOne})";

  private static final String ADDRESS_STANDARD_VALID_TWO =
          "ADDRESS COMMAREA({$varOne}) CWA({$varTwo}) EIB({$varThree})";

  private static final String ADDRESS_STANDARD_VALID =
          "ADDRESS";

  private static final String ADDRESS_STANDARD_INVALID_ONE =
          "ADDRESS COMMAREA({$varOne}) {COMMAREA|errorOne}({$varOne}) CWA({$varTwo}) EIB({$varThree})";

  private static final String ADDRESS_SET_VALID =
          "ADDRESS SET({$varOne}) USING({$varTwo})";

  private static final String ADDRESS_SET_INVALID_ONE =
          "ADDRESS {_SET({$varOne})|errorOne_}";

  private static final String ADDRESS_SET_INVALID_TWO =
          "ADDRESS {_USING({$varOne})|errorOne_}";

  @Test
  void testAddressStandardValidOne() {
    CICSTestUtils.noErrorTest(ADDRESS_STANDARD_VALID_ONE);
  }

  @Test
  void testAddressStandardValidTwo() {
    CICSTestUtils.noErrorTest(ADDRESS_STANDARD_VALID_TWO);
  }

  @Test
  void testAddressStandardValid() {
    CICSTestUtils.noErrorTest(ADDRESS_STANDARD_VALID);
  }

  @Test
  void testAddressStandardInvalid() {
    CICSTestUtils.errorTest(ADDRESS_STANDARD_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: COMMAREA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));

  }

  @Test
  void testAddressSetValid() {
    CICSTestUtils.noErrorTest(ADDRESS_SET_VALID);
  }

  @Test
  void testAddressSetInvalidOne() {
    CICSTestUtils.errorTest(
            ADDRESS_SET_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: USING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testAddressSetInvalidTwo() {
    CICSTestUtils.errorTest(
            ADDRESS_SET_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: SET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
