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

import org.eclipse.lsp4j.Location;

/**
 * The class represents program ID.
 */
public class ProgramIdNode extends Node {
  private final String id;

  public ProgramIdNode(Location location, String id) {
    super(location, NodeType.PROGRAM_ID);
    this.id = id;
  }

  @Override
  public void process() {
    getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .ifPresent(it -> it.setProgramName(id));
  }
}
