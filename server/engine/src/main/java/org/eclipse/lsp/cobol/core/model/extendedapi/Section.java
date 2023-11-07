/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.extendedapi;

import lombok.EqualsAndHashCode;
import lombok.Value;

/** Data transport object of CF AST. Section type represents COBOL program SECTION. */
@Value
@EqualsAndHashCode(callSuper = true)
public class Section extends CFASTNode {
  String name;
  String snippet;

  public Section(String name, String snippet, Location location) {
    super(CFASTNodeType.SECTION.getValue(), location);
    this.name = name;
    this.snippet = snippet;
  }
}
