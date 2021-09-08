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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

/**
 * The class represents variable usage in COBOL program. This must be extended with a link to
 * variable definition.
 */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class VariableUsageNode extends Node {
  private final String dataName;
  @Setter
  @EqualsAndHashCode.Exclude @ToString.Exclude private VariableNode definition;

  public VariableUsageNode(
      String dataName,
      Locality locality) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
  }
}
