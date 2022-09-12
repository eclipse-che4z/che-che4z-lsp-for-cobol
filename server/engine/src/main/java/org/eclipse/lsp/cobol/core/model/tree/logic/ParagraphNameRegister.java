package org.eclipse.lsp.cobol.core.model.tree.logic;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphNameNode;

import java.util.function.BiConsumer;

public class ParagraphNameRegister implements BiConsumer<ParagraphNameNode, ProcessingContext> {
  @Override
  public void accept(ParagraphNameNode node, ProcessingContext ctx) {
    node.getProgram()
        .flatMap(parent -> parent.registerParagraphNameNode(node))
        .map(ImmutableList::of)
        .orElseGet(ImmutableList::of)
        .forEach(ctx.getErrors()::add);
  }
}
