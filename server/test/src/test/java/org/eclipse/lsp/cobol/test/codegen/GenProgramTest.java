/*
 * Copyright (c) 2024 Broadcom.
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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.test.codegen;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Code generator tests.
 */
class GenProgramTest {
  @Test
  void test() {
    CobolCodeGenerator generator = new CobolCodeGenerator(new GeneratorSettings());
    String code = generator.generate();
    assertFalse(code.isEmpty());
    assertTrue(code.contains("DIVISION"));
    assertTrue(code.contains("ID"));
    System.out.println(code.length());
  }
}
