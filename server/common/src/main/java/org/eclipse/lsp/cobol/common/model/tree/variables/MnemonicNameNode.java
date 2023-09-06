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
package org.eclipse.lsp.cobol.common.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;

/**
 * This value class represents a special name. They may substitute environment names in the
 * SPECIAL-NAMES paragraph. They should are a special type of variable, allowed in certain
 * statements.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class MnemonicNameNode extends VariableNode {
  private final String systemName;

  public MnemonicNameNode(Locality location, String systemName, String name) {
    super(location, name, VariableType.MNEMONIC_NAME, false);
    this.systemName = systemName;
  }

  @Override
  protected String getVariableDisplayString() {
    return String.format("%1$s IS %2$s.", systemName, getName());
  }
}
