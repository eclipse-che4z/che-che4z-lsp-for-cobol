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
 *
 */
package org.eclipse.lsp.cobol.core.model.extendedapi;

import lombok.EqualsAndHashCode;
import lombok.Value;

/** Data transport object of CF AST. ExitPerform type represents EXIT PERFORM COBOL statement */
@Value
@EqualsAndHashCode(callSuper = true)
public class ExitPerform extends CFASTNode {
  boolean cycle;
  boolean insideInlinePerform;

  public ExitPerform(boolean cycle, boolean insideInlinePerform, Location location) {
    super(CFASTNodeType.EXIT_PERFORM.getValue(), location);
    this.cycle = cycle;
    this.insideInlinePerform = insideInlinePerform;
  }
}
