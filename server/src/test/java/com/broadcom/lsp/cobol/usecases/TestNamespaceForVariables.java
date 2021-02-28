/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This class test that same name program can exist in a nested structure and use variables with
 * same name but different scope.
 */
class TestNamespaceForVariables {

  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-Id. 'ACTDCNVO'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       Local-Storage Section.\n"
          + "       1 {$*a-xml-rsp-dsc} global.\n"
          + "       2 {$*a-xml-rsp-len} comp pic 9(8).\n"
          + "       2 {$*a-xml-rsp-cnt} comp pic 9(8).\n"
          + "       Identification Division.\n"
          + "       Program-Id. 'COMMON_NAME'.\n"
          + "       Data Division.\n"
          + "       Local-Storage Section.\n"
          + "       Linkage Section.\n"
          + "       Procedure Division.\n"
          + "       {@*Mainline} Section.\n"
          + "           move 1 to {$a-xml-rsp-cnt}.\n"
          + "       End Program 'COMMON_NAME'.\n"
          + "       Identification Division.\n"
          + "       Program-Id. 'COMMON_NAME'.\n"
          + "       Data Division.\n"
          + "       Local-Storage Section.\n"
          + "       1 {$*a-xml-rsp-dsc} .\n"
          + "       2 {$*a-xml-rsp-len} comp pic 9(8).\n"
          + "       2 {$*a-xml-rsp-cnt} comp pic 9(8).\n"
          + "       Linkage Section.\n"
          + "       Procedure Division.\n"
          + "       {@*Mainline} Section.\n"
          + "           move 1 to {$a-xml-rsp-cnt}.\n"
          + "       End Program 'COMMON_NAME'.\n"
          + "       End Program 'ACTDCNVO'.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
