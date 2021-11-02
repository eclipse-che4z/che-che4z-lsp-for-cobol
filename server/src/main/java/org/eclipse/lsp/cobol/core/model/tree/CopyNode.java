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

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.COPY;

/** The class represents the copyBookNode. */
@ToString(callSuper = true)
@Getter
public class CopyNode extends Node {
  private final String copyBookName;

  public CopyNode(Locality locality, String copyBookName) {
    super(locality, COPY);
    this.copyBookName = copyBookName;
  }
}
