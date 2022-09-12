package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.DeclarativeProcedureSectionNode;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphNameNode;

import java.util.function.BiConsumer;

public class DeclarativeProcedureSectionRegister
    implements BiConsumer<DeclarativeProcedureSectionNode, ProcessingContext> {
  @Override
  public void accept(DeclarativeProcedureSectionNode node, ProcessingContext processingContext) {
    node.getProgram()
        .ifPresent(
            parent -> {
              parent.registerCodeBlock(node);
              parent.registerParagraphNameNode(
                  new ParagraphNameNode(node.getLocality(), node.getName()));
            });
  }
}
