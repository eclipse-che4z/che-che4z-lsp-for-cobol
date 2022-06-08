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
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

import java.util.Optional;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.LEVEL_66;

/**
 * This value class represents a renaming data name entry, that has a level number 66. It may be one
 * a top level, but should trail a variable structure. It is used to regroup element items, e.g.
 * copy elements of the previous structure into this one using RENAME and RENAME THRU/THROUGH
 * operations.
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class RenameItemNode extends VariableWithLevelNode {

  @EqualsAndHashCode.Exclude @ToString.Exclude @Getter @Setter private GroupItemNode varGroupParent;

  public RenameItemNode(
      Locality location, String name, boolean redefines, boolean global) {
    super(location, LEVEL_66, name, redefines, VariableType.RENAME_ITEM, global);
  }

  @Override
  protected String getVariableDisplayString() {
    return getFormattedSuffix() + ".";
  }

  @Override
  public Optional<Node> getNearestParentByType(NodeType type) {
    if (type == NodeType.VARIABLE)
      return Optional.ofNullable(varGroupParent)
          .flatMap(
              it -> (it.getNodeType() == type) ? Optional.of(it) : it.getNearestParentByType(type));
    else return super.getNearestParentByType(type);
  }
}
