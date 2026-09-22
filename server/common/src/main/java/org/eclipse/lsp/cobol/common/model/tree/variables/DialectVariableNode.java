/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;

/** A variable definition supplied by an external dialect. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class DialectVariableNode extends VariableNode {
  private final String displayText;

  public DialectVariableNode(Locality locality, String name, String displayText) {
    super(locality, name, VariableType.DIALECT_VARIABLE, false);
    this.displayText = displayText;
  }

  @Override
  protected String getVariableDisplayString() {
    return displayText;
  }
}
