/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.core.model.variables;

import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.VariableUtils;
import lombok.EqualsAndHashCode;
import lombok.Value;

import static com.broadcom.lsp.cobol.core.visitor.VariableDefinitionDelegate.LEVEL_01;

/**
 * This value class represents a group item COBOL variable. Group elements can have nested
 * variables. They cannot have neither PIC nor VALUE clauses. Can be the top element of the
 * structure with level 01, as well as nested ones with higher level numbers.
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class GroupItem extends StructuredVariable {

  public GroupItem(
      int levelNumber, String name, String qualifier, Locality definition, Variable parent) {
    super(levelNumber, name, qualifier, definition, parent);
  }

  @Override
  public Variable rename(RenameItem newParent) {
    return levelNumber == LEVEL_01
        ? null
        : new GroupItem(
            levelNumber,
            name,
            VariableUtils.renameQualifier(qualifier, newParent.name),
            definition,
            newParent);
  }
}
