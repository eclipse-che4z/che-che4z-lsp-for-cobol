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
package org.eclipse.lsp.cobol.common.model.tree.variable;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variables.IndexItemNode;
import org.eclipse.lsp.cobol.common.utils.VariableUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * This value class represents the multi-dimensional Table variable that may have nested variables,
 * and an optional index
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class MultiTableDataNameNode extends VariableWithLevelNode implements UsageClause {
  private final OccursClause occursClause;
  private final UsageFormat usageFormat;

  public MultiTableDataNameNode(
      Locality location,
      int level,
      String name,
      boolean redefines,
      OccursClause occursClause,
      UsageFormat usageFormat,
      boolean global) {
    super(location, level, name, redefines, VariableType.MULTI_TABLE_DATA_NAME, global);
    this.occursClause = occursClause;
    this.usageFormat = usageFormat;
  }

  public static List<VariableNode> fromDefinition(VariableDefinitionNode definitionNode) {
    MultiTableDataNameNode variable =
            new MultiTableDataNameNode(
                    definitionNode.getLocality(),
                    definitionNode.getLevel(),
                    VariableUtils.getName(definitionNode),
                    definitionNode.hasRedefines(),
                    definitionNode.getOccursClauses().get(0),
                    definitionNode.getUsage(),
                    definitionNode.isGlobal());
    VariableUtils.createVariableNameNode(variable, definitionNode.getVariableName());
    List<VariableNode> result = new ArrayList<>();
    result.add(variable);
    for (VariableNameAndLocality nameAndLocality : definitionNode.getOccursIndexes()) {
      IndexItemNode indexItemNode = new IndexItemNode(nameAndLocality.getLocality(), nameAndLocality.getName(), variable.isGlobal());
      variable.addChild(indexItemNode);
      result.add(indexItemNode);
    }
    return result;
  }

  @Override
  protected String getVariableDisplayString() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    stringBuilder.append(String.format(" OCCURS %1$d TIMES", occursClause.getFrom()));
    if (usageFormat != UsageFormat.UNDEFINED) stringBuilder.append(" USAGE ").append(usageFormat.toDisplayString());
    return stringBuilder.append(".").toString();
  }
}
