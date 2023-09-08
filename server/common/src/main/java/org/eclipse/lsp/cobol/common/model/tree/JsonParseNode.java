/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;

import java.util.List;

/** JsonParse node */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class JsonParseNode extends StatementNode {
  private final VariableNameAndLocality identifier1;
  private final VariableNameAndLocality identifier2;
  private final List<VariableNameAndLocality> identifier3;
  private final List<VariableNameAndLocality> identifier4;
  private final List<VariableNameAndLocality> identifier5;
  private final List<VariableNameAndLocality> conditionName;
  private final boolean isOmitted;

  public JsonParseNode(
      Locality location,
      VariableNameAndLocality identifier1,
      VariableNameAndLocality identifier2,
      List<VariableNameAndLocality> identifier3,
      List<VariableNameAndLocality> identifier4,
      List<VariableNameAndLocality> identifier5,
      List<VariableNameAndLocality> conditionName,
      boolean isOmitted) {
    super(location, NodeType.JSON_PARSE);
    this.identifier1 = identifier1;
    this.identifier2 = identifier2;
    this.identifier3 = identifier3;
    this.identifier4 = identifier4;
    this.identifier5 = identifier5;
    this.conditionName = conditionName;
    this.isOmitted = isOmitted;
  }
}
