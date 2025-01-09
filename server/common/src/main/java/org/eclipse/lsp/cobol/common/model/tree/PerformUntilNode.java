/*
 * Copyright (c) 2025 Broadcom.
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

/** The class represents perform until clause. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class PerformUntilNode extends Node {

  private final boolean untilExit;

  public PerformUntilNode(Locality location, boolean untilExit) {
    super(location, NodeType.PERFORM_UNTIL_NODE);
    this.untilExit = untilExit;
  }
}
