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

import java.util.HashMap;
import java.util.Map;

/**
 * COBOL Code Generator state.
 */
public class GeneratorContext {
  private final Map<String, IdentifierType> idTypes = new HashMap<>();
  private int index = 0;

  /**
   * Generates a ne uniq identifier
   * @param type type of ID
   * @return the id
   */
  public String generateIdentifier(IdentifierType type) {
    index++;
    String s = "NAME" + index;
    idTypes.put(s, type);
    return s;
  }
}
