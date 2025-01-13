/*
 * Copyright (c) 2025 Broadcom.
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

/** Data transport object of CF AST. InlinePerform type represents PERFORM UNTIL COBOL statement */
@Value
@EqualsAndHashCode(callSuper = true)
public class InlinePerform extends CFASTNode {
  PerformUntilType performUntilType;

  public InlinePerform(Location location, PerformUntilType performUntilType) {
    super(CFASTNodeType.INLINE_PERFORM.getValue(), location);
    this.performUntilType = performUntilType;
  }
}
