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

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

/**
 * The class represents the name of variable definition.
 *
 * Example:
 * <pre>
 * 01 FIRST.
 *   05 SECOND PIC 9.
 * </pre>
 *
 * Here we have different locations for whole definition and variable name:
 *
 * <pre>
 *     ->|   |<- Name location
 *       |   |
 * ->|01 FIRST.
 * |    05 SECOND PIC 9.|<-------|
 * |                             |
 * |-- var definition location --|
 * </pre>
 */
@Getter
@ToString(callSuper = true)
@SuppressWarnings("squid:S2160")
public class VariableDefinitionNameNode extends Node {
  private final String name;

  protected VariableDefinitionNameNode(Locality location, String name) {
    super(location, NodeType.VARIABLE_DEFINITION_NAME);
    this.name = name;
  }
}
