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

import java.util.List;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;

/** XML generate node */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class XmlGenerateNode extends Node {
  private final VariableNameAndLocality identifier1;
  private final VariableNameAndLocality identifier2;
  private final VariableNameAndLocality identifier3;
  private final VariableNameAndLocality identifier4;
  private final VariableNameAndLocality identifier5;
  private final List<VariableNameAndLocality> identifier6;
  private final List<VariableNameAndLocality> identifier7;
  private final List<VariableNameAndLocality> identifier8;

  public XmlGenerateNode(
      Locality location,
      VariableNameAndLocality identifier1,
      VariableNameAndLocality identifier2,
      VariableNameAndLocality identifier3,
      VariableNameAndLocality identifier4,
      VariableNameAndLocality identifier5,
      List<VariableNameAndLocality> identifier6,
      List<VariableNameAndLocality> identifier7,
      List<VariableNameAndLocality> identifier8) {
    super(location, NodeType.XML_GENERATE);
    this.identifier1 = identifier1;
    this.identifier2 = identifier2;
    this.identifier3 = identifier3;
    this.identifier4 = identifier4;
    this.identifier5 = identifier5;
    this.identifier6 = identifier6;
    this.identifier7 = identifier7;
    this.identifier8 = identifier8;
  }
}
