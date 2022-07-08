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

package org.eclipse.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp4j.MarkupContent;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/** This test asserts the logic of the {@link DocumentationUtils} class */
class DocumentationUtilsTest {
  @Test
  void testPredicate() {
    assertTrue(DocumentationUtils.startsWithIgnoreCase("ad").test("ADD"));
    assertTrue(DocumentationUtils.startsWithIgnoreCase("Ad").test("ADD"));
    assertTrue(DocumentationUtils.startsWithIgnoreCase("").test("ADD"));
    assertFalse(DocumentationUtils.startsWithIgnoreCase("an").test("ADD"));
    assertFalse(DocumentationUtils.startsWithIgnoreCase("addd").test("add"));
  }

  @Test
  void testMarkup() {
    MarkupContent actual = DocumentationUtils.wrapWithMarkup("some text");
    assertEquals("some text", actual.getValue());
    assertEquals("markdown", actual.getKind());
  }
}
