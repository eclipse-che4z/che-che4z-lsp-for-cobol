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
package org.eclipse.lsp.cobol.common.processor;

import com.google.common.collect.ImmutableList;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/** Tests {@link CompilerDirectiveContext} */
class CompilerDirectiveContextTest {

  public static final String EXTEND = "EXTEND";
  public static final String COMPAT = "COMPAT";

  @Test
  void testCompilerOptionsContextFetch() {
    CompilerDirectiveContext context = new CompilerDirectiveContext();
    context.updateDirectiveOptions(
        new CompilerDirectiveOption(CompilerDirectiveName.ADATA, ImmutableList.of(EXTEND)));
    List<CompilerDirectiveOption> result1 =
        context.filterDirectiveList(ImmutableList.of(CompilerDirectiveName.QUALIFY));
    List<CompilerDirectiveOption> result2 =
        context.filterDirectiveList(ImmutableList.of(CompilerDirectiveName.ADATA));
    Assertions.assertTrue(result1.isEmpty());
    assertEquals(1, result2.size());
    Assertions.assertTrue(result2.get(0).getValue().contains(EXTEND));

    context.updateDirectiveOptions(
        new CompilerDirectiveOption(CompilerDirectiveName.ADATA, ImmutableList.of(COMPAT)));
    List<CompilerDirectiveOption> result3 =
        context.filterDirectiveList(ImmutableList.of(CompilerDirectiveName.ADATA));
    assertEquals(1, result3.size());
    List<String> contextValueResult3 = result3.get(0).getValue();
    assertEquals(2, contextValueResult3.size());

    assertEquals(COMPAT, contextValueResult3.get(contextValueResult3.size() - 1));
  }
}
