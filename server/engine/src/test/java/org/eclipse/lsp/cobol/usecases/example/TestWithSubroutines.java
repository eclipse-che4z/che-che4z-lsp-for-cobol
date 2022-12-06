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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** UseCase test example with subroutines */
class TestWithSubroutines {

  @Test
  void test() {
    final String text =
        "       Identification Division.\n"
            + "       Program-Id. 'P'.\n"
            + "       Procedure Division.\n"
            + "       {@*Mainline} Section.\n"
            + "           call {%\"FIRST\"}."
            + "           call {%\"SECOND\"}.";
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of("FIRST"));
  }
}
