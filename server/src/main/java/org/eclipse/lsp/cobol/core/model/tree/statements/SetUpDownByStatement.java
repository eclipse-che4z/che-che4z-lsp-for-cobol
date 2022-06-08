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
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.LiteralNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

/** This class implements the logic for SET UP/DOWN BY statement. */
@EqualsAndHashCode(callSuper = true)
public class SetUpDownByStatement extends StatementNode {
  public static final String INTEGER_LITERAL = "[+-]?\\d+";
  protected static final String INVALID_RECEIVING_FIELD_TEMPLATE =
      "statements.invalidReceivingField";
  protected static final String INVALID_SENDING_FIELD_TEMPLATE = "statements.invalidSendingField";
  private static final List<VariableType> RECEIVING_FIELD_TYPES =
      ImmutableList.of(VariableType.INDEX_ITEM);
  private static final List<EffectiveDataType> ALLOWED_SENDING_FIELDS_TYPE =
      ImmutableList.of(EffectiveDataType.INTEGER, EffectiveDataType.REAL);
  private static final MessageTemplate[] SENDING_FIELD_TYPES = {
    MessageTemplate.of("variables.elementaryWithType", MessageTemplate.of("variables.integer")),
    MessageTemplate.of("variables.nonzeroInteger")
  };
  List<Node> receivingFields;
  Node sendingField;

  public SetUpDownByStatement(Locality locality, List<Node> receivingFields, Node sendingField) {
    super(locality);
    this.receivingFields = receivingFields;
    this.sendingField = sendingField;
  }

  @NonNull
  @Override
  public List<SyntaxError> validate() {
    List<SyntaxError> errors =
        new ArrayList<>(
            validateVariableType(
                receivingFields, RECEIVING_FIELD_TYPES, INVALID_RECEIVING_FIELD_TEMPLATE));
    if (checkSendingFieldProducesError())
      errors.add(
          createError(
              sendingField.getLocality(), INVALID_SENDING_FIELD_TEMPLATE, SENDING_FIELD_TYPES));
    return errors;
  }

  private boolean checkSendingFieldProducesError() {
    if (sendingField.getNodeType() == NodeType.LITERAL)
      return literalProducesError(((LiteralNode) sendingField).getText());
    if (sendingField.getNodeType() == NodeType.QUALIFIED_REFERENCE_NODE)
      return variableProducesError((QualifiedReferenceNode) sendingField);
    return true;
  }

  private boolean literalProducesError(String literal) {
    return !literal.matches(INTEGER_LITERAL) || Integer.parseInt(literal) == 0;
  }

  private boolean variableProducesError(QualifiedReferenceNode variable) {
    Node lastNode = getLastElement(variable.getDepthFirstStream());
    if (lastNode instanceof LiteralNode) return false;

    QualifiedReferenceNode lastQualifiedElement = getLastElement(
            variable
                .getDepthFirstStream()
                .filter(QualifiedReferenceNode.class::isInstance)
                .map(QualifiedReferenceNode.class::cast));

    if (lastQualifiedElement == null) {
      return false;
    }

    Optional<VariableNode> definitionNode = lastQualifiedElement.getVariableDefinitionNode();
    if (!definitionNode.isPresent()) {
      return false;
    }
    VariableNode variableDefinitionNode = definitionNode.get();
    if (variableDefinitionNode.getVariableType() != VariableType.TABLE_DATA_NAME
            && variableDefinitionNode instanceof EffectiveData) {
      EffectiveDataType effectiveDataType = ((EffectiveData) variableDefinitionNode).getEffectiveDataType();
      return !ALLOWED_SENDING_FIELDS_TYPE.contains(effectiveDataType);
    } else {
      return true;
    }
  }

  private <T> T getLastElement(Stream<T> stream) {
    return stream.reduce((first, second) -> second).orElse(null);
  }
}
