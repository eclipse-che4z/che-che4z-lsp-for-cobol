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
package org.eclipse.lsp.cobol.core.model.tree;

import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.model.Locality;

/**
 * The class represents variable usage in COBOL program.
 * This must be extended with a link to variable definition.
 */
public class VariableUsageNode extends Node {
  private String dataName;
  private Locality locality;
  private Type variableUsageType;
  private CobolParser.QualifiedDataNameFormat1Context dataNameFormat1Context;
  private CobolParser.ConditionNameReferenceContext nameReferenceContext;

  public VariableUsageNode(String dataName,
                           Locality locality,
                           CobolParser.QualifiedDataNameFormat1Context dataNameFormat1Context) {
    super(locality.toLocation(), NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.locality = locality;
    this.dataNameFormat1Context = dataNameFormat1Context;
    variableUsageType = Type.DATA_NAME;
  }

  public VariableUsageNode(String dataName, Locality locality) {
    super(locality.toLocation(), NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.locality = locality;
    variableUsageType = Type.TABLE_CALL;
  }

  public VariableUsageNode(String dataName,
                           Locality locality,
                           CobolParser.ConditionNameReferenceContext nameReferenceContext) {
    super(locality.toLocation(), NodeType.VARIABLE_USAGE);
    this.dataName = dataName;
    this.locality = locality;
    this.nameReferenceContext = nameReferenceContext;
    variableUsageType = Type.CONDITION_CALL;
  }

  @Override
  public void process() {
    getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getVariableUsageDelegate)
        .ifPresent(variableUsageDelegate -> {
          switch (variableUsageType) {
            case DATA_NAME:
              variableUsageDelegate.handleDataName(dataName, locality, dataNameFormat1Context);
              break;
            case TABLE_CALL:
              variableUsageDelegate.handleTableCall(dataName, locality);
              break;
            case CONDITION_CALL:
              variableUsageDelegate.handleConditionCall(dataName, locality, nameReferenceContext);
              break;
            default:
              // No other variable usage types exist, this is unreachable, but just in case.
              break;
          }
        });
  }

  /**
   * Represents different types of variable usages.
   */
  private enum Type {
    DATA_NAME,
    TABLE_CALL,
    CONDITION_CALL,
  }
}
