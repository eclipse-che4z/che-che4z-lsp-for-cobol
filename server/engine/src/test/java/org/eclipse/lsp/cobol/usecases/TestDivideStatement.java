/*
 * Copyright (c) 2023 Broadcom.
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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test cobol divide statement */
public class TestDivideStatement {

  public static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*USER-NUM1} PIC 9(9).\n"
          + "       01 {$*USER-NUM2} PIC 9(9).\n"
          + "       01 {$*USER-INFO}.\n"
          + "           05 {$*USER-INDEX} PIC 9(6).\n"
          + "           05 {$*USER-PHONE} PIC 9(6).\n"
          + "       Procedure Division.\n"
          + "           DIVIDE {$USER-NUM1} BY {$USER-NUM2} GIVING {$USER-INDEX}.\n"
          + "           DIVIDE {$USER-NUM1} BY {$USER-NUM2}{.|1}\n"
          + "           DIVIDE {$USER-NUM1} INTO {$USER-NUM2} \n"
          + "           GIVING {$USER-INDEX} ROUNDED REMAINDER {$USER-PHONE}.\n"
          + "       End program HELLO-WORLD.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on '.'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
