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

import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.Value;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.ElementItem;
import org.eclipse.lsp.cobol.core.model.variables.IndexItem;
import org.eclipse.lsp.cobol.core.model.variables.Variable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;

/** This class implements the logic for SET UP/DOWN BY statement. */
@Value
@EqualsAndHashCode(callSuper = true)
public class SetUpDownByStatement extends StatementNode {
  private static final MessageTemplate RECEIVING_FIELD_TYPES =
      MessageTemplate.of("variables.indexName");
  private static final MessageTemplate[] SENDING_FIELD_TYPES =
      new MessageTemplate[] {
        MessageTemplate.of("variables.elementaryInteger"),
        MessageTemplate.of("variables.nonzeroInteger")
      };
  public static final String INTEGER_LITERAL = "[+-]?\\d+";

  List<Locality> receivingFields;
  Locality sendingField;
  String literal;

  public SetUpDownByStatement(
      Locality locality, List<Locality> receivingFields, Locality sendingField, String literal) {
    super(locality);
    this.receivingFields = receivingFields;
    this.sendingField = sendingField;
    this.literal = literal;
  }

  @NonNull
  @Override
  public List<SyntaxError> validate(Map<Locality, Variable> variableUsages) {
    List<SyntaxError> errors = new ArrayList<>();
    receivingFields.stream()
        .map(it -> validateReceivingField(variableUsages, it))
        .filter(Objects::nonNull)
        .forEach(errors::add);
    if (shouldProcessLiteral(literal)) {
      if (literalProducesError(literal)) {
        errors.add(
            createSyntaxError(sendingField, "statements.invalidSendingField", SENDING_FIELD_TYPES));
      }
    } else {
      Variable variable = variableUsages.get(sendingField);
      if (variableProducesError(variable)) {
        errors.add(
            createSyntaxError(sendingField, "statements.invalidSendingField", SENDING_FIELD_TYPES));
      }
    }
    return errors;
  }

  private SyntaxError validateReceivingField(
      Map<Locality, Variable> variableUsages, Locality locality) {
    Variable variable = variableUsages.get(locality);
    if (variable == null || variable instanceof IndexItem) {
      return null;
    }
    return createSyntaxError(locality, "statements.invalidReceivingField", RECEIVING_FIELD_TYPES);
  }

  private boolean shouldProcessLiteral(String literal) {
    return literal != null;
  }

  private boolean literalProducesError(String literal) {
    return !literal.matches(INTEGER_LITERAL) || Integer.parseInt(literal) == 0;
  }

  private boolean variableProducesError(Variable variable) {
    return !(variable == null || variable instanceof ElementItem);
  }

  private SyntaxError createSyntaxError(
      Locality locality, String message, MessageTemplate... types) {
    return SyntaxError.syntaxError()
        .locality(locality)
        .severity(ERROR)
        .messageTemplate(MessageTemplate.concatenatingArgs(message, ", ", types))
        .build();
  }
}
