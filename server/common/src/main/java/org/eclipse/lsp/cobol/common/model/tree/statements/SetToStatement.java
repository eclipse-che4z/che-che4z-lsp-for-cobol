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

package org.eclipse.lsp.cobol.common.model.tree.statements;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;

import java.util.List;

/** This class implements the logic for SET TO statement. */
@EqualsAndHashCode(callSuper = true)
@Getter
public class SetToStatement extends StatementNode {
  boolean address;
  List<Node> receivingFields;
  Node sendingField;

  public SetToStatement(boolean address, Locality locality, List<Node> receivingFields, Node sendingField) {
    super(locality);
    this.address = address;
    this.receivingFields = receivingFields;
    this.sendingField = sendingField;
  }
}
