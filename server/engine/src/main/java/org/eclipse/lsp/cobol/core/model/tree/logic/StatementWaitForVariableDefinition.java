package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;

import java.util.function.BiConsumer;

public class StatementWaitForVariableDefinition
    implements BiConsumer<StatementNode, ProcessingContext> {
  @Override
  public void accept(StatementNode node, ProcessingContext _ctx) {
    node.addProcessStep(ctx -> new StatementWaitForVariableUsage().accept(node, ctx));
  }
}
