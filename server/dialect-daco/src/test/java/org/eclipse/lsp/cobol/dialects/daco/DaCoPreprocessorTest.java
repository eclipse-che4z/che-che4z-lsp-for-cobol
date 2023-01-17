/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.daco;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for DaCoPreprocessor
 */
class DaCoPreprocessorTest {
  @Test
  void testRange() {
    String result = DaCoPreprocessor.run("1     Text");
    assertEquals("      Text", result);
  }

  @Test
  void testNewLineAtEnd() {
    String result = DaCoPreprocessor.run("1     Text\r\n");
    assertEquals("      Text\r\n", result);
  }

  @Test
  void testShortLine1() {
    String result = DaCoPreprocessor.run("1");
    assertEquals(" ", result);
  }

  @Test
  void testShortLine2() {
    String result = DaCoPreprocessor.run("123456");
    assertEquals("      ", result);
  }

}
