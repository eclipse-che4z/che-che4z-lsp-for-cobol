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
import lombok.Value;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.ElementItem;
import org.eclipse.lsp.cobol.core.model.variables.StructureType;
import org.eclipse.lsp.cobol.core.model.variables.Variable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/** This class implements the logic for SET UP/DOWN BY statement. */
@Value
@EqualsAndHashCode(callSuper = true)
public class SetUpDownByStatement extends StatementNode {
  public static final String INTEGER_LITERAL = "[+-]?\\d+";
  protected static final String INVALID_RECEIVING_FIELD_TEMPLATE =
      "statements.invalidReceivingField";
  protected static final String INVALID_SENDING_FIELD_TEMPLATE = "statements.invalidSendingField";
  private static final List<StructureType> RECEIVING_FIELD_TYPES =
      ImmutableList.of(StructureType.INDEX_NAME);
  private static final MessageTemplate[] SENDING_FIELD_TYPES =
      new MessageTemplate[] {
        MessageTemplate.of("variables.elementaryWithType", MessageTemplate.of("variables.integer")),
        MessageTemplate.of("variables.nonzeroInteger")
      };
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
        .map(
            validateVariableType(
                variableUsages, RECEIVING_FIELD_TYPES, INVALID_RECEIVING_FIELD_TEMPLATE))
        .filter(Optional::isPresent)
        .map(Optional::get)
        .forEach(errors::add);
    if (shouldProcessLiteral(literal)) {
      if (literalProducesError(literal)) {
        errors.add(createError(sendingField, INVALID_SENDING_FIELD_TEMPLATE, SENDING_FIELD_TYPES));
      }
    } else {
      Variable variable = variableUsages.get(sendingField);
      if (variableProducesError(variable)) {
        errors.add(createError(sendingField, INVALID_SENDING_FIELD_TEMPLATE, SENDING_FIELD_TYPES));
      }
    }
    return errors;
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
}
