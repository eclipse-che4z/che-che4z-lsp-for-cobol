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
package org.eclipse.lsp.cobol.core.engine.processors;

import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureDivisionNode;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureDivisionReturningNode;

/** Propagate information about presence of a returning clause */
public class ProcedureDivisionReturningProcess implements Processor<ProcedureDivisionReturningNode> {
  @Override
  public void accept(ProcedureDivisionReturningNode node, ProcessingContext ctx) {
    node.getNearestParentByType(NodeType.DIVISION)
        .map(ProcedureDivisionNode.class::cast)
        .ifPresent(pd -> pd.hasReturningClause = true);
  }
}
