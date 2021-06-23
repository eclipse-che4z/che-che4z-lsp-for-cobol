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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that optional paragraphs may be empty. */
class TestEmptyOptionalParagraphs {

  private static final String TEXT =
      "       identification division.\n"
          + "       program-id. test.\n"
          + "       AUTHOR.  \n"
          + "       INSTALLATION\n"
          + "       DATE-WRITTEN 02/02/02\n"
          + "       DATE-COMPILED\n"
          + "       SECURITY\n"
          + "       data division.\n"
          + "       working-storage section.\n"
          + "       01 {$*VARNAME} PIC X(3) VALUE \"ABC\".\n"
          + "       procedure division.\n"
          + "           DISPLAY {$VARNAME}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
