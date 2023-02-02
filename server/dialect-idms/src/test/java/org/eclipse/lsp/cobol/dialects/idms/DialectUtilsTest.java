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
package org.eclipse.lsp.cobol.dialects.idms;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.dialects.idms.utils.TestUtils;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/**
 * Test for {@link DialectUtils}
 */
@ExtendWith(MockitoExtension.class)
class DialectUtilsTest {

  @Test
  void test() {
    ParserRuleContext ctx = mock(ParserRuleContext.class);

    TestUtils.addRange(ctx, 2, 2, 5, 5);

    Range range = DialectUtils.constructRange(ctx);
    assertEquals(1, range.getStart().getLine());
    assertEquals(2, range.getStart().getCharacter());
    assertEquals(4, range.getEnd().getLine());
    assertEquals(6, range.getEnd().getCharacter());
  }

}
