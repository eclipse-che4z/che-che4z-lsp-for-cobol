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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.Value;
import lombok.experimental.NonFinal;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.model.Locality;

/**
 * The class represents variable usage in COBOL program.
 * This must be extended with a link to variable definition.
 */
@Value
public class VariableUsageNode extends Node {
  String dataName;
  Locality locality;
  Type variableUsageType;
  @NonFinal
  CobolParser.QualifiedDataNameFormat1Context dataNameFormat1Context;
  @NonFinal
  CobolParser.ConditionNameReferenceContext nameReferenceContext;

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

  /**
   * Represents different types of variable usages.
   */
  public enum Type {
    DATA_NAME,
    TABLE_CALL,
    CONDITION_CALL,
  }
}
