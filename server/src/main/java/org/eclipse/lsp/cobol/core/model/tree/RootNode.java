/*
 * Copyright (c) 2020 Broadcom.
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

import org.eclipse.lsp.cobol.core.model.Locality;

/**
 * The class represents the root. All trees must start with one root node.
 */
public class RootNode extends Node {
  public RootNode(Locality locality) {
    super(locality, NodeType.ROOT);
  }
}
