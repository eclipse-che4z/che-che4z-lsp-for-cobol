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
 * Test CICS VERIFY commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-verify-password">VERIFY PASSWORD Command</a>
 *
 * <p>This class tests all variations of the VERIFY command: PASSWORD, PHRASE, and TOKEN.
 */
public class TestCICSVerify {
  private static final String VERIFY_PASSWORD_VALID =
          "VERIFY PASSWORD({$varOne}) USERID({$varTwo}) GROUPID({$varThree})";

  private static final String VERIFY_PASSWORD_INVALID =
          "VERIFY {_PASSWORD({$varOne}) GROUPID(123)|errorOne_}";

  private static final String VERIFY_PHRASE_VALID =
          "VERIFY PHRASE({$varOne}) PHRASELEN({$varTwo}) USERID({$varThree})";

  private static final String VERIFY_PHRASE_INVALID =
          "VERIFY {_PHRASE({$varOne})  USERID(123)|errorOne_}";

  private static final String VERIFY_TOKEN_VALID_ONE =
          "VERIFY TOKEN({$varOne}) TOKENLEN({$varTwo}) TOKENTYPE({$varThree}) DATATYPE({$varFour})";

  private static final String VERIFY_TOKEN_VALID_TWO =
          "VERIFY TOKEN({$varOne}) TOKENLEN({$varTwo}) TOKENTYPE({$varTwo}) DATATYPE({$varThree}) ENCRYPTKEY({$varThree})";

  private static final String VERIFY_TOKEN_INVALID_ONE =
          "VERIFY {_TOKEN({$varOne}) TOKENLEN(123)|errorOne_}";

  private static final String VERIFY_TOKEN_INVALID_TWO =
          "VERIFY TOKEN({$varOne}) TOKENLEN({$varTwo}) {TOKENTYPE|errorOne}({$varTwo}) {JWT|errorTwo} {KERBEROS|errorThree}";

  private static final String VERIFY_TOKEN_INVALID_THREE =
          "VERIFY TOKEN({$varOne}) TOKENLEN({$varTwo}) JWT {DATATYPE|errorOne}({$varTwo}) {BIT|errorTwo} {BASE64|errorThree}";

  private static final String VERIFY_TOKEN_INVALID_FOUR =
          "VERIFY {_TOKEN({$varOne}) TOKENLEN({$varTwo}) OUTTOKENLEN({$varTwo}) JWT|errorOne_}";

  private static final String VERIFY_TOKEN_INVALID_FIVE =
          "VERIFY {_TOKEN({$varOne}) TOKENLEN({$varTwo}) OUTTOKEN({$varTwo}) JWT|errorOne_}";

  @Test
  void testVerifyPasswordValid() {
    CICSTestUtils.noErrorTest(VERIFY_PASSWORD_VALID);
  }

  @Test
  void testVerifyPasswordInvalid() {
    CICSTestUtils.errorTest(
            VERIFY_PASSWORD_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: USERID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testVerifyPhraseValid() {
    CICSTestUtils.noErrorTest(VERIFY_PHRASE_VALID);
  }

  @Test
  void testVerifyPhraseInvalid() {
    CICSTestUtils.errorTest(
            VERIFY_PHRASE_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: PHRASELEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testVerifyTokenValidOne() {
    CICSTestUtils.noErrorTest(VERIFY_TOKEN_VALID_ONE);
  }

  @Test
  void testVerifyTokenValidTwo() {
    CICSTestUtils.noErrorTest(VERIFY_TOKEN_VALID_TWO);
  }

  @Test
  void testVerifyTokenInvalidOne() {
    CICSTestUtils.errorTest(
            VERIFY_TOKEN_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, none provided: TOKENTYPE or BASICAUTH or JWT or KERBEROS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testVerifyTokenInvalidTwo() {
    CICSTestUtils.errorTest(
            VERIFY_TOKEN_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TOKENTYPE or BASICAUTH or JWT or KERBEROS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TOKENTYPE or BASICAUTH or JWT or KERBEROS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TOKENTYPE or BASICAUTH or JWT or KERBEROS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testVerifyTokenInvalidThree() {
    CICSTestUtils.errorTest(
            VERIFY_TOKEN_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: BIT or DATATYPE or BASE64",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: BIT or DATATYPE or BASE64",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: BIT or DATATYPE or BASE64",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testVerifyTokenInvalidFour() {
    CICSTestUtils.errorTest(
            VERIFY_TOKEN_INVALID_FOUR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: OUTTOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testVerifyTokenInvalidFive() {
    CICSTestUtils.errorTest(
            VERIFY_TOKEN_INVALID_FIVE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: OUTTOKENLEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
