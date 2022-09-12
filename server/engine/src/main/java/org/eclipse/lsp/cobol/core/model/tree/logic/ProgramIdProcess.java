package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.ProgramIdNode;

import java.util.function.BiConsumer;

public class ProgramIdProcess implements BiConsumer<ProgramIdNode, ProcessingContext> {
  @Override
  public void accept(ProgramIdNode node, ProcessingContext ctx) {
    node.getProgram().ifPresent(it -> it.setProgramName(node.getProgramId()));
  }
}
