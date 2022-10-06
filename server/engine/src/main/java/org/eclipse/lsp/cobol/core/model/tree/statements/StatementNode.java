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

package org.eclipse.lsp.cobol.core.model.tree.statements;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.STATEMENT;

/**
 * This class represents a special node for statements that may apply statement-specific validation.
 * The extensions should encapsulate the logic of all the applicable semantic checks.
 */
@Slf4j
public abstract class StatementNode extends Node {

  protected StatementNode(Locality locality) {
    super(locality, STATEMENT);
  }
}
