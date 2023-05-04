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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test JSON syntax */
class TestJsonSyntax {
  private static final String TEXT_PARSE =
      "       Identification division.\n"
      + "       Program-id. jp_ex.\n"
      + "       Data division.\n"
      + "        Working-storage section.\n"
      + "         1 {$*jtxt-1208} pic x(1000) value is all x'20'.\n"
      + "         77 {$*txnum} pic 999999 usage display value zero.\n"
      + "         1 {$*client-data}.\n"
      + "          3 {$*account-num}   pic 999,999,999,999.\n"
      + "          3 {$*transactions}.\n"
      + "             5 {$*tx-record} occurs 0 to 100 depending {$txnum}.\n"
      + "       Procedure division.\n"
      + "           Json parse {$jtxt-1208} into {$client-data}\n"
      + "             with detail\n"
      + "             suppress {$transactions}\n"
      + "             not on exception\n"
      + "               display \"Successful JSON Parse\"\n"
      + "           end-json.";

  private static final String TEXT_GENERATE =
      "       Identification division.\n"
      + "       Program-id. jp_ex.\n"
      + "       Data division.\n"
      + "        Working-storage section.\n"
      + "         01 {$*docx} PIC X.\n"
      + "         01 {$*myrecord}.\n"
      + "           02 {$*data-a} PIC X.\n"
      + "           02 {$*data-b} PIC X.\n"
      + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
      + "       Procedure division.\n"
      + "           JSON GENERATE {$docx} FROM {$myrecord}\n"
      + "             CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
      + "                   ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
      + "            END-JSON.";

  @Test
  void test_tolerate_json_parse_syntax() {
    UseCaseEngine.runTest(TEXT_PARSE, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_tolerate_json_generate_syntax() {
    UseCaseEngine.runTest(TEXT_GENERATE, ImmutableList.of(), ImmutableMap.of());
  }

}
