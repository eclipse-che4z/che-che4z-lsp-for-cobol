/*
 * Copyright (c) 2025 Broadcom.
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

import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.junit.jupiter.api.Test;

/** This test verifies that the British Pound Symbol doesn't cause problems in CICS */
class TestCicsSupportPoundSymbol {

  private static final String TEXT =
      "SEND TEXT\n" + "FROM({$varSeven})\n" + "LENGTH(LENGTH OF {$varSeven})";

  @Test
  void test() {
    CICSTestUtils.noErrorTest(TEXT);
  }
}
