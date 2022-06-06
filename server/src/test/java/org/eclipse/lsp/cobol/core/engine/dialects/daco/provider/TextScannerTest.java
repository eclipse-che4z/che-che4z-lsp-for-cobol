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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import org.junit.jupiter.api.Test;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This tests the logic of {@link TextScanner} */
class TextScannerTest {

  private static final String PROGRAM = "       WORKING-STORAGE SECTION.\n";

  @Test
  void testTBF() {
    List<VariableNameInfo> infoList = TextScanner.scan(PROGRAM + "       TBFmmm-Xii");
    assertEquals(1, infoList.size());
    assertEquals("mmm", infoList.get(0).getName());
    assertEquals("ii", infoList.get(0).getSuffix());
  }

  @Test
  void testTBFWithLevel() {
    List<VariableNameInfo> infoList = TextScanner.scan(PROGRAM + "106500     03 TBLNAM-XSU.");
    assertEquals(1, infoList.size());
    assertEquals("NAM", infoList.get(0).getName());
    assertEquals("SU", infoList.get(0).getSuffix());
  }

  @Test
  void testTBL() {
    List<VariableNameInfo> infoList = TextScanner.scan(PROGRAM + "       TBLmmm-Xii");
    assertEquals(1, infoList.size());
    assertEquals("mmm", infoList.get(0).getName());
    assertEquals("ii", infoList.get(0).getSuffix());
  }

  @Test
  void testCommented() {
    List<VariableNameInfo> infoList = TextScanner.scan(PROGRAM + "      * TBLmmm-Xii");
    assertEquals(0, infoList.size());
  }

  @Test
  void testUnknownPattern() {
    List<VariableNameInfo> infoList = TextScanner.scan(PROGRAM + "       TBXmmm-Xii");
    assertEquals(0, infoList.size());
  }

}
