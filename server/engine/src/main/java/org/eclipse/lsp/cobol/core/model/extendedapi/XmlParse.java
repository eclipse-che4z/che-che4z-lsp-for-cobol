/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.extendedapi;


import lombok.EqualsAndHashCode;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.ProcedureName;

/** Data transport object of CF AST. XmlParse type represents COBOL program XML PARSE. */
@Value
@EqualsAndHashCode(callSuper = true)
public class XmlParse extends CFASTNode {
  ProcedureName target;
  ProcedureName thru;

  public XmlParse(ProcedureName processingName, ProcedureName thruName, Location location) {
    super(CFASTNodeType.XML_PARSE.getValue(), location);
    this.target = processingName;
    this.thru = thruName;
  }
}
