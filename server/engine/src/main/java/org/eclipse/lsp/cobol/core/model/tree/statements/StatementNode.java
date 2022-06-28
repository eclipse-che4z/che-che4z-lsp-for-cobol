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

package org.eclipse.lsp.cobol.core.model.tree.statements;

import com.google.common.collect.ImmutableList;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorStage;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableType;

import java.util.List;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.QUALIFIED_REFERENCE_NODE;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.STATEMENT;

/**
 * This class represents a special node for statements that may apply statement-specific validation.
 * The extensions should encapsulate the logic of all the applicable semantic checks.
 */
@Slf4j
public abstract class StatementNode extends Node {

  protected StatementNode(Locality locality) {
    super(locality, STATEMENT);
    addProcessStep(this::waitForVariableDefinition);
  }

  private List<SyntaxError> waitForVariableDefinition() {
    addProcessStep(this::waitForVariableUsage);
    return ImmutableList.of();
  }

  private List<SyntaxError> waitForVariableUsage() {
    addProcessStep(this::validate);
    return ImmutableList.of();
  }

  /**
   * Apply all the specific validation and return found errors. If the map does not contain value
   * for the locality, then it means that it was not defined correctly and should be skipped. The
   * "Invalid definition" error is defined on the previous steps.
   *
   * @return a list of syntax errors if they are found or an empty list otherwise.
   */
  @NonNull
  public abstract List<SyntaxError> validate();

  protected List<SyntaxError> validateVariableType(
      List<Node> fields, List<VariableType> allowedTypes, String template) {
    return fields.stream()
        .filter(hasType(QUALIFIED_REFERENCE_NODE))
        .map(QualifiedReferenceNode.class::cast)
        .filter(reference -> reference.getVariableDefinitionNode()
            .map(variableNode -> !allowedTypes.contains(variableNode.getVariableType()))
            .orElse(false))
        .map(variableNode -> createError(variableNode.getLocality(), template,
            allowedTypes.stream().map(VariableType::getTemplate).toArray(MessageTemplate[]::new)))
        .collect(Collectors.toList());
  }

  protected SyntaxError createError(Locality locality, String message, MessageTemplate... types) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorStage(ErrorStage.SYNTAX)
            .locality(locality)
            .severity(ERROR)
            .messageTemplate(MessageTemplate.concatenatingArgs(message, ", ", types))
            .build();
    LOG.debug("Syntax error by StatementNode: {}", error);
    return error;
  }
}
