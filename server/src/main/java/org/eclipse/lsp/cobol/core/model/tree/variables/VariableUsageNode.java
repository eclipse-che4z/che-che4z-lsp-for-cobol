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

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.List;

/**
 * The class represents variable usage in COBOL program. This must be extended with a link to
 * variable definition.
 */
@ToString(callSuper = true)
@Getter
public class VariableUsageNode extends Node {
  private String dataName;
  private Type variableUsageType;
  private List<String> parents;
  private CobolParser.QualifiedDataNameFormat1Context dataNameFormat1Context;
  private CobolParser.ConditionNameReferenceContext nameReferenceContext;

  public VariableUsageNode(
      String dataName,
      Locality locality,
      CobolParser.QualifiedDataNameFormat1Context dataNameFormat1Context) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.dataNameFormat1Context = dataNameFormat1Context;
    variableUsageType = Type.DATA_NAME;
    nameReferenceContext = null;
  }

  public VariableUsageNode(String dataName, Locality locality, Type variableUsageType) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.variableUsageType = variableUsageType;
    this.parents = ImmutableList.of();
    dataNameFormat1Context = null;
    nameReferenceContext = null;
  }

  public VariableUsageNode(String dataName, Locality locality, Type variableUsageType, List<String> parents) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.variableUsageType = variableUsageType;
    this.parents = parents;
    dataNameFormat1Context = null;
    nameReferenceContext = null;
  }

  public VariableUsageNode(
      String dataName,
      Locality locality,
      CobolParser.ConditionNameReferenceContext nameReferenceContext) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.nameReferenceContext = nameReferenceContext;
    variableUsageType = Type.CONDITION_CALL;
    dataNameFormat1Context = null;
  }

  @Override
  public List<SyntaxError> process() {
    getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getVariableUsageDelegate)
        .ifPresent(
            variableUsageDelegate -> {
              switch (variableUsageType) {
                case DATA_NAME:
                  variableUsageDelegate.handleDataName(
                      dataName, getLocality(), dataNameFormat1Context);
                  break;
                case SQL_VALUE:
                case TABLE_CALL:
                case GENERAL:
                  variableUsageDelegate.handleGeneralCall(dataName, getLocality(), parents);
                  break;
                case CONDITION_CALL:
                  variableUsageDelegate.handleConditionCall(
                      dataName, getLocality(), nameReferenceContext);
                  break;
                default:
                  // No other variable usage types exist, this is unreachable, but just in case.
                  break;
              }
            });
    return ImmutableList.of();
  }

  /** Represents different types of variable usages. */
  public enum Type {
    DATA_NAME,
    SQL_VALUE,
    TABLE_CALL,
    CONDITION_CALL,
    GENERAL,
  }
}
