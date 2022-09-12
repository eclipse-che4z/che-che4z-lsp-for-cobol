package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;

import java.util.function.BiConsumer;

public class ProcessNodeWithVariableDefinitions implements BiConsumer<Node, ProcessingContext> {
  @Override
  public void accept(Node node, ProcessingContext ctx) {
    ctx.getErrors().addAll(VariableDefinitionUtil.processNodeWithVariableDefinitions(node));
  }
}
