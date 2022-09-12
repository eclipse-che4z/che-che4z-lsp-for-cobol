package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;

import java.util.function.BiConsumer;

public class QualifiedReferenceNodeWaitForVariableUsage
    implements BiConsumer<QualifiedReferenceNode, ProcessingContext> {
  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext _ctx) {
    node.addProcessStep(ctx -> new QualifiedReferenceUpdateVariableUsage().accept(node, _ctx));
  }
}
