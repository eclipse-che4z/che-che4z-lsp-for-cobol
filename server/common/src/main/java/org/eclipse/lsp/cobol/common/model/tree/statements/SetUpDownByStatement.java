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

package org.eclipse.lsp.cobol.common.model.tree.statements;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;

import java.util.List;

/** This class implements the logic for SET UP/DOWN BY statement. */
@EqualsAndHashCode(callSuper = true)
@Getter
public class SetUpDownByStatement extends StatementNode {
  List<Node> receivingFields;
  Node sendingField;

  public SetUpDownByStatement(Locality locality, List<Node> receivingFields, Node sendingField) {
    super(locality);
    this.receivingFields = receivingFields;
    this.sendingField = sendingField;
  }
}
