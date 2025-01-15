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

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.FunctionInfo;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

import java.util.ArrayList;
import java.util.List;

/**
 * Enriches the @{@link QualifiedReferenceNode}'s children by replacing the Variable node
 * with @{@link FunctionReference} node.
 */
@AllArgsConstructor
public class FunctionUsageReferenceEnricher implements Processor<QualifiedReferenceNode> {
  private final SymbolAccumulator symbolAccumulator;

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }

    VariableUsageNode dataNameNode = null;
    for (Node child : node.getChildren()) {
      if (child.getNodeType() == NodeType.VARIABLE_USAGE) {
        dataNameNode = (VariableUsageNode) child;
        break;
      }
    }

    if (dataNameNode == null) {
      return;
    }

    // If definition of a data node is present, this signifies that this dataNode already has a variable definition
    // and shouldn't try to enrich it further.
    // in case there is a name collision it would anyway be shown for the definition
    if (!dataNameNode.getDefinitions().isEmpty()) {
      return;
    }
    FunctionInfo functionInfo =
        symbolAccumulator.getFunctionReference(dataNameNode.getName(), ctx.getCurrentProgramNode(), false);

    if (functionInfo == null) {
      return;
    }

    int indexOfQualifiedNode = node.getParent().getChildren().indexOf(node);
    node.getChildren().remove(dataNameNode);
    FunctionReference functionReference = new FunctionReference(dataNameNode.getLocality(), dataNameNode.getName());
    functionReference.setDefinitions(functionInfo.getDefinition());
    functionInfo.getReferences().add(functionReference.getLocality().toLocation());
    node.getParent().getChildren().add(indexOfQualifiedNode, functionReference);
    functionReference.setParent(node.getParent());
  }
}
