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
import lombok.ToString;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.SEVERITY;

/** The abstract class for all variable definitions. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public abstract class VariableNode extends Node {
  private final VariableType variableType;
  private final String name;

  protected VariableNode(Locality location, String name, VariableType variableType) {
    super(location, NodeType.VARIABLE);
    this.name = name;
    this.variableType = variableType;
  }

  /**
   * Return true if this variable redefines another variable.
   *
   * @return true if this variable redefines another variable.
   */
  public boolean isRedefines() {
    return false;
  }

  /**
   * Construct an error for that Variable
   *
   * @param messageTemplate a message template for error
   * @return the error with the variable locality
   */
  public SyntaxError getError(MessageTemplate messageTemplate) {
    return getError(messageTemplate, SEVERITY);
  }

  /**
   * Construct an error for that Variable
   *
   * @param messageTemplate a message template for error
   * @param severity severity of the error
   * @return the error with the variable locality
   */
  public SyntaxError getError(MessageTemplate messageTemplate, ErrorSeverity severity) {
    return SyntaxError.syntaxError()
        .severity(severity)
        .locality(getLocalityForError())
        .messageTemplate(messageTemplate)
        .build();
  }

  private Locality getLocalityForError() {
    return getChildren().stream()
        .filter(hasType(NodeType.VARIABLE_DEFINITION_NAME))
        .findAny()
        .map(Node::getLocality)
        .orElseGet(this::getLocality);
  }
}
