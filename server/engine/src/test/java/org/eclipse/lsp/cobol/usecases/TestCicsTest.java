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

import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.junit.jupiter.api.Test;

/**
 * Test CICS TEST EVENT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-test-event">TEST EVENT
 * Command</a>
 *
 * <p>This class tests all variations of the TEST EVENT command found in the link above.
 */
public class TestCicsTest {
  private static final String TEST_EVENT_VALID_ONE = "TEST EVENT(1) FIRESTATUS(1)";
  private static final String TEST_EVENT_VALID_TWO = "TEST FIRESTATUS(100) EVENT(100)";


  @Test
  void testCicsTestValidOne() {
    CICSTestUtils.noErrorTest(TEST_EVENT_VALID_ONE);
  }

  @Test
  void testCicsTestValidTwo() {
    CICSTestUtils.noErrorTest(TEST_EVENT_VALID_TWO);
  }
}
