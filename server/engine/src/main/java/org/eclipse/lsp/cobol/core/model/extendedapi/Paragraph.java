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

/** Data transport object of CF AST. Paragraph type represents PARAGRAPH of a COBOL program. */
@Value
@EqualsAndHashCode(callSuper = true)
public class Paragraph extends CFASTNode {
  String snippet;
  String name;

  public Paragraph(String snippet, String name, Location location) {
    super(CFASTNodeType.PARAGRAPH.getValue(), location);
    this.snippet = snippet;
    this.name = name;
  }
}
