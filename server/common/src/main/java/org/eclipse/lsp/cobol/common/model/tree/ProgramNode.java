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

/** This class represents program in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class ProgramNode extends Node {
  private String programName;

  public ProgramNode(Locality locality) {
    super(locality, PROGRAM);
  }

  public String getProgramName() {
    return programName;
  }

  public void setProgramName(String programName) {
    this.programName = programName;
  }
}
