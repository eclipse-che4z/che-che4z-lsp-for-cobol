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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.StructureType;
import org.eclipse.lsp.cobol.core.model.variables.Variable;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import static java.util.stream.Collectors.toList;

/** This class implements the logic for SET TO ON/OFF statement. */
public class SetToOnOffStatement extends StatementNode {
  protected static final String INVALID_RECEIVING_FIELD_TEMPLATE =
      "statements.invalidReceivingField";
  private static final List<StructureType> ALLOWED_TYPES =
      ImmutableList.of(StructureType.MNEMONIC_NAME);
  List<Locality> receivingFields;

  public SetToOnOffStatement(Locality locality, List<Locality> receivingFields) {
    super(locality);
    this.receivingFields = receivingFields;
  }

  @Override
  @NonNull
  public List<SyntaxError> validate(Map<Locality, Variable> variableUsages) {
    return receivingFields.stream()
        .map(validateVariableType(variableUsages, ALLOWED_TYPES, INVALID_RECEIVING_FIELD_TEMPLATE))
        .filter(Optional::isPresent)
        .map(Optional::get)
        .collect(toList());
  }
}
