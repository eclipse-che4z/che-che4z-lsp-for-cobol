/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.parser.listener;

import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
/** Checks the FormatListener logic. */
public class FormatListenerTest {

  @Test
  public void testSyntaxErrorWithRange() {
    PreprocessorListener listener = new PreprocessorListener(new ArrayList<>());
    listener.syntaxError(null, 0, 0, 0, "");
    listener.syntaxError(null, 0, 0, 0, "");
    assertEquals(2, listener.getErrorsPipe().size());
  }

  @Test
  public void testSyntaxErrorWithLength() {
    PreprocessorListener listener = new PreprocessorListener(new ArrayList<>());
    listener.syntaxError(null, 0, 0, "", 0);
    listener.syntaxError(null, 0, 0, "", 0);
    assertEquals(2, listener.getErrorsPipe().size());
  }

  @Test
  public void testNullPipe() {
    PreprocessorListener listener = new PreprocessorListener(null);
    listener.syntaxError(null, 0, 0, "", 0);
    assertNull(listener.getErrorsPipe());
  }

  @Test
  public void testUnregister() {
    PreprocessorListener listener = new PreprocessorListener(new ArrayList<>());
    listener.syntaxError(null, 0, 0, "", 0);
    listener.syntaxError(null, 1, 0, "", 0);
    listener.unregisterError(1);
    assertEquals(1, listener.getErrorsPipe().size());
  }

  /* Unusual situation, format error should appear only once at one line */
  @Test
  public void testUnregisterWithMultipleErorsAtOneLine() {
    PreprocessorListener listener = new PreprocessorListener(new ArrayList<>());
    listener.syntaxError(null, 0, 0, "", 0);
    listener.syntaxError(null, 1, 0, "", 0);
    listener.syntaxError(null, 1, 0, "", 0);
    listener.syntaxError(null, 1, 0, "", 0);
    listener.unregisterError(1);
    assertEquals(3, listener.getErrorsPipe().size());
  }
}
