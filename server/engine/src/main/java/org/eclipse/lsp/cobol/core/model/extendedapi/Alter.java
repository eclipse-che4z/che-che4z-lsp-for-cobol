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
import org.eclipse.lsp.cobol.common.model.ProcedureName;

/** Data transport object of CF AST. Perform type represents ALTER statement. */
@Value
@EqualsAndHashCode(callSuper = true)
public class Alter extends CFASTNode {
  ProcedureName from;
  ProcedureName to;

  public Alter(ProcedureName from, ProcedureName to, Location location) {
    super(CFASTNodeType.ALTER.getValue(), location);
    this.from = from;
    this.to = to;
  }
}
