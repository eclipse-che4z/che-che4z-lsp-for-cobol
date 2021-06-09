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
package org.eclipse.lsp.cobol.core.model.variables;

import com.google.common.collect.ImmutableList;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.*;

import java.util.HashMap;
import java.util.Map;

/**
 * The call converts Variable node to Variable for backward compatibility.
 * This is temporal converter and must be removed at the end of SyntaxTree migration.
 */
public class NodeConverter {
  private final Map<Node, Variable> convertedVariables = new HashMap<>();

  /**
   * Convert Variable node into the variable.
   *
   * @param variableNode the variable tree node
   * @return a variable
   */
  public Variable convertVariable(VariableNode variableNode) {
    Variable variable = convert(variableNode);
    convertedVariables.put(variableNode, variable);
    return variable;
  }

  private Variable convert(VariableNode variableNode) {
    switch (variableNode.getVariableType()) {
      case CONDITION_DATA_NAME: return convert((ConditionDataNameNode) variableNode);
      case ELEMENTARY_ITEM: return convert((ElementaryItemNode) variableNode);
      case GROUP_ITEM: return convert((GroupItemNode) variableNode);
      case STAND_ALONE_DATA_ITEM: return convert((StandAloneDataItemNode) variableNode);
      case INDEX_ITEM: return convert((IndexItemNode) variableNode);
      case MNEMONIC_NAME: return convert((MnemonicNameNode) variableNode);
      case MULTI_TABLE_DATA_NAME: return convert((MultiTableDataNameNode) variableNode);
      case RENAME_ITEM: return convert((RenameItemNode) variableNode);
      case TABLE_DATA_NAME: return convert((TableDataNameNode) variableNode);
      default: throw new IllegalArgumentException("Unexpected variable type");
    }
  }

  private ConditionDataName convert(ConditionDataNameNode variableNode) {
    return new ConditionDataName(
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        getParent(variableNode),
        variableNode.getValueInterval().getFrom(),
        variableNode.getValueInterval().getTo()
    );
  }

  private ElementItem convert(ElementaryItemNode variableNode) {
    return new ElementItem(
        variableNode.getLevel(),
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        variableNode.isGlobal(),
        getParent(variableNode),
        variableNode.getPicClause(),
        variableNode.getValue(),
        variableNode.getUsageFormat()
    );
  }

  private GroupItem convert(GroupItemNode variableNode) {
    return new GroupItem(
        variableNode.getLevel(),
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        variableNode.isGlobal(),
        getParent(variableNode)
    );
  }

  private IndependentDataItem convert(StandAloneDataItemNode variableNode) {
    return new IndependentDataItem(
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        variableNode.isGlobal(),
        variableNode.getPicClause(),
        variableNode.getValue()
    );
  }

  private IndexItem convert(IndexItemNode variableNode) {
    return new IndexItem(
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        getParent(variableNode)
    );
  }

  private MnemonicName convert(MnemonicNameNode variableNode) {
    return new MnemonicName(
        variableNode.getSystemName(),
        variableNode.getName(),
        getDefinitionLocality(variableNode)
    );
  }

  private MultiTableDataName convert(MultiTableDataNameNode variableNode) {
    return new MultiTableDataName(
        variableNode.getLevel(),
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        getParent(variableNode),
        variableNode.getOccursTimes(),
        ImmutableList.of(),
        variableNode.getUsageFormat()
    );
  }

  private RenameItem convert(RenameItemNode variableNode) {
    return new RenameItem(
        variableNode.getName(),
        variableNode.isGlobal(),
        getDefinitionLocality(variableNode)
    );
  }

  private TableDataName convert(TableDataNameNode variableNode) {
    return new TableDataName(
        variableNode.getLevel(),
        variableNode.getName(),
        getDefinitionLocality(variableNode),
        variableNode.isGlobal(),
        getParent(variableNode),
        variableNode.getPicClause(),
        variableNode.getValue(),
        variableNode.getOccursTimes(),
        ImmutableList.of(),
        variableNode.getUsageFormat()
    );
  }

  private Variable getParent(@NonNull VariableNode variableNode) {
    return convertedVariables.get(variableNode.getParent());
  }

  private Locality getDefinitionLocality(VariableNode variableNode) {
    return variableNode.getChildren().stream()
        .filter(it -> it.getNodeType() == NodeType.VARIABLE_DEFINITION_NAME)
        .map(Node::getLocality)
        .findFirst()
        .orElse(variableNode.getLocality());
  }
}
