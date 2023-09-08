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

/** XMLParse node */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class XMLParseNode extends StatementNode {
  private final VariableNameAndLocality encodingLocality;
  private final VariableNameAndLocality identifier2;
  private final VariableNameAndLocality identifier1;
  private final VariableNameAndLocality xmlValidatingContext;
  private final VariableNameAndLocality xmlNationalContext;

  public XMLParseNode(
      Locality location,
      VariableNameAndLocality identifier1,
      VariableNameAndLocality identifier2,
      VariableNameAndLocality encodingLocality,
      VariableNameAndLocality xmlValidatingContext,
      VariableNameAndLocality xmlNationalContext) {
    super(location, NodeType.XML_PARSE);
    this.identifier1 = identifier1;
    this.identifier2 = identifier2;
    this.encodingLocality = encodingLocality;
    this.xmlValidatingContext = xmlValidatingContext;
    this.xmlNationalContext = xmlNationalContext;
  }
}
