/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.example;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/**
 * UseCase test example with subroutines
 */
class TestWithSubroutines {
  public static final String TEXT =
      "       Identification Division.\n"
          + "       Program-Id. 'P'.\n"
          + "       Procedure Division.\n"
          + "       {@*Mainline} Section.\n"
          + "           call {%\"FIRST\"}."
          + "           call {%\"SECOND\"|1}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "SECOND: Subroutine not found",
                DiagnosticSeverity.Information,
                SourceInfoLevels.INFO.getText())
        ),
        ImmutableList.of("FIRST"));
  }
}
