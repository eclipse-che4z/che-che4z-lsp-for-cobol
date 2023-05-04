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

/** Test repository paragraph statements */
public class TestRepositoryParagraph {
  private static final String TEXT = "       Identification division.\n"
      + "       Program-id. \"SNDKAFKA\" is recursive.\n"
      + "       Environment division.\n"
      + "       Configuration section.\n"
      + "       Special-Names.\n"
      + "            Decimal-Point is comma.\n"
      + "       Repository.\n"
      + "           Class ZUtil         is \"com.ibm.jzos.ZUtil\"\n"
      + "           Class JavaException is \"java.lang.Exception\"\n"
      + "           Class jdbb          is \"java.nio.ByteBuffer\"\n"
      + "           Class ToKafka       is \"CobolToKafka.ToKafka\"\n"
      + "           Function FOO1\n"
      + "           Function FOO2.\n"
      + "       Input-output section.\n"
      + "       Data Division.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

}
