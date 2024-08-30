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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;

import static org.eclipse.lsp.cobol.common.model.NodeType.PROGRAM;

/** This class represents program or function in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class ProgramNode extends Node {
  private String programName;
  private final ProgramSubtype subtype;
  private final int ordinal;

  public ProgramNode(Locality locality, ProgramSubtype subtype, int ordinal) {
    super(locality, PROGRAM);
    this.subtype = subtype;
    this.ordinal = ordinal;
  }

  public String getProgramName() {
    return programName;
  }

  public void setProgramName(String programName) {
    this.programName = programName;
  }
}
