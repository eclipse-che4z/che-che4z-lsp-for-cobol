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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.EMPTY_STRUCTURE_MSG;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.LEVEL_77;

/**
 * This value class represents an independent element item COBOL variable, that has a level number
 * 77. It should always have a PIC clause representing its type, and a VALUE clause that stores an
 * explicitly defined value; both as Strings. They cannot produce a structure in any way.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class StandAloneDataItemNode extends VariableWithLevelNode {
  private final String picClause;
  private final String value;

  public StandAloneDataItemNode(
      Locality location,
      String name,
      boolean global,
      String picClause,
      String value,
      boolean redefines) {
    super(location, LEVEL_77, name, redefines, VariableType.STAND_ALONE_DATA_ITEM, global);
    this.picClause = picClause;
    this.value = value;
    addProcessStep(this::processNode);
  }

  private List<SyntaxError> processNode() {
    List<SyntaxError> errors = new ArrayList<>();
    if (picClause.isEmpty())
      errors.add(getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, getName())));
    return errors;
  }
}
