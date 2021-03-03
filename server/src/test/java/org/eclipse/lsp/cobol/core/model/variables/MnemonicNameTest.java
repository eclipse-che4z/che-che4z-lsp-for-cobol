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
package org.eclipse.lsp.cobol.core.model.variables;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test {@link MnemonicName}
 */
class MnemonicNameTest {

  @Test
  void getFormattedDisplayLine() {
    MnemonicName variable = new MnemonicName("C01", "TOP-OF-PAGE", null);
    assertEquals("C01 IS TOP-OF-PAGE.", variable.getFormattedDisplayLine());
  }
}
