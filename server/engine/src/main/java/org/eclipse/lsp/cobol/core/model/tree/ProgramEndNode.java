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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;

/** The class represents the program end. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class ProgramEndNode extends Node {
  String programId;

  public ProgramEndNode(Locality locality, String programId) {
    super(locality, NodeType.PROGRAM_END);
    this.programId = programId;
  }
}
