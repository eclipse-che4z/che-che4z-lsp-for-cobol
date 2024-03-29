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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp4j.TextDocumentItem;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

/** Test @{@link CopybookIdentificationBasedOnExtension} */
@ExtendWith(MockitoExtension.class)
class CopybookIdentificationBasedOnExtensionTest {

  @Test
  void whenExtensionMatchSettingThenReturnTrue() {
    CopybookIdentificationBasedOnExtension service = new CopybookIdentificationBasedOnExtension();
    TextDocumentItem doc = new TextDocumentItem();
    doc.setUri("blah/blah1/copy.txt.cpy");
    Assertions.assertTrue(service.isCopybook(doc.getUri(), doc.getText(), ImmutableList.of(".cpy")));
  }

  @Test
  void whenExtensionDoesNotMatchTheCopybookExtSettingsThenReturnFalse() {
    CopybookIdentificationBasedOnExtension service = new CopybookIdentificationBasedOnExtension();
    TextDocumentItem doc = new TextDocumentItem();
    doc.setUri("blah/blah1/copy.cpy");
    Assertions.assertFalse(service.isCopybook(doc.getUri(), doc.getText(), ImmutableList.of("cpyy")));
  }
}
