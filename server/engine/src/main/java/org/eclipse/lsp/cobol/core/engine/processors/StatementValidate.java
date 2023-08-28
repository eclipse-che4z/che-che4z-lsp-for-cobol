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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.LiteralNode;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetToBooleanStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetToOnOffStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetUpDownByStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.StatementNode;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.common.model.NodeType.QUALIFIED_REFERENCE_NODE;

/**
 * Apply all the specific validation and return found errors. If the map does not contain value for
 * the locality, then it means that it was not defined correctly and should be skipped. The "Invalid
 * definition" error is defined on the previous steps.
 */
@Slf4j
public class StatementValidate implements Processor<StatementNode> {
  private static final String INVALID_RECEIVING_FIELD_TEMPLATE = "statements.invalidReceivingField";
  private static final String INVALID_SENDING_FIELD_TEMPLATE = "statements.invalidSendingField";
  private static final String INTEGER_LITERAL = "[+-]?\\d+";
  private static final MessageTemplate[] SENDING_FIELD_TYPES = {
    MessageTemplate.of("variables.elementaryWithType", MessageTemplate.of("variables.integer")),
    MessageTemplate.of("variables.nonzeroInteger")
  };

  @Override
  public void accept(StatementNode node, ProcessingContext ctx) {
    if (node instanceof SetToBooleanStatement) {
      ctx.getErrors()
          .addAll(
              validateVariableType(
                  ((SetToBooleanStatement) node).getReceivingFields(),
                  ImmutableList.of(VariableType.CONDITION_DATA_NAME)));
    }

    if (node instanceof SetToOnOffStatement) {
      ctx.getErrors()
          .addAll(
              validateVariableType(
                  ((SetToOnOffStatement) node).getReceivingFields(),
                  ImmutableList.of(VariableType.MNEMONIC_NAME)));
    }

    if (node instanceof SetUpDownByStatement) {
      SetUpDownByStatement node1 = (SetUpDownByStatement) node;
      ctx.getErrors()
          .addAll(
              validateVariableType(
                  node1.getReceivingFields(), ImmutableList.of(VariableType.INDEX_ITEM)));

      if (hasSendingFieldProducesError(node1))
        ctx.getErrors()
            .add(
                createError(
                    node1.getSendingField().getLocality(),
                    INVALID_SENDING_FIELD_TEMPLATE,
                    SENDING_FIELD_TYPES));
    }
  }

  private List<SyntaxError> validateVariableType(
      List<Node> fields, List<VariableType> allowedTypes) {
    return fields.stream()
        .filter(Node.hasType(QUALIFIED_REFERENCE_NODE))
        .map(QualifiedReferenceNode.class::cast)
        .filter(
            reference ->
                reference
                    .getVariableDefinitionNode()
                    .map(variableNode -> !allowedTypes.contains(variableNode.getVariableType()))
                    .orElse(false))
        .map(
            variableNode ->
                createError(
                    variableNode.getLocality(),
                    INVALID_RECEIVING_FIELD_TEMPLATE,
                    allowedTypes.stream()
                        .map(VariableType::getTemplate)
                        .toArray(MessageTemplate[]::new)))
        .collect(Collectors.toList());
  }

  private SyntaxError createError(Locality locality, String message, MessageTemplate... types) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .severity(ERROR)
            .messageTemplate(MessageTemplate.concatenatingArgs(message, ", ", types))
            .build();
    LOG.debug("Syntax error by StatementNode: {}", error);
    return error;
  }

  private boolean hasSendingFieldProducesError(SetUpDownByStatement node) {
    if (node.getSendingField().getNodeType() == NodeType.LITERAL) {
      return literalProducesError(((LiteralNode) node.getSendingField()).getText());
    }
    if (node.getSendingField().getNodeType() == NodeType.QUALIFIED_REFERENCE_NODE) {
      return variableProducesError((QualifiedReferenceNode) node.getSendingField());
    }
    return true;
  }

  private boolean literalProducesError(String literal) {
    return !literal.matches(INTEGER_LITERAL) || Integer.parseInt(literal) == 0;
  }

  private boolean variableProducesError(QualifiedReferenceNode variable) {
    Node lastNode = getLastElement(variable.getDepthFirstStream());
    if (lastNode instanceof LiteralNode) {
      return false;
    }

    QualifiedReferenceNode lastQualifiedElement =
        getLastElement(
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
      EffectiveDataType effectiveDataType =
          ((EffectiveData) variableDefinitionNode).getEffectiveDataType();
      return !ImmutableList.of(EffectiveDataType.INTEGER, EffectiveDataType.REAL)
          .contains(effectiveDataType);
    } else {
      return true;
    }
  }

  private <T> T getLastElement(Stream<T> stream) {
    return stream.reduce((first, second) -> second).orElse(null);
  }
}
