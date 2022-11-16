/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.common.symbols;

import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;

/** Service to handle symbol information and dependencies */
public interface VariableAccumulator {

  /**
   * * Register variable definitions into nearest ProgramNode
   *
   * @param node the node with VariableDefinitionNodes
   */
  void registerVariablesInProgram(Node node);

  /**
   * Add the variable definition to that program context.
   *
   * @param programNode the program where this variable belongs to.
   * @param node the variable definition node
   */
  void addVariableDefinition(ProgramNode programNode, VariableNode node);

  /**
   * Add a paragraph defined in the program context.
   *
   * @param program - the program to register code block in
   * @param node - the paragraph node
   */
  void registerCodeBlock(ProgramNode program, CodeBlockDefinitionNode node);
}
