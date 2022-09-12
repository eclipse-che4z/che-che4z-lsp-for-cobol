package org.eclipse.lsp.cobol.core.model.tree.logic;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.tree.SectionNameNode;

import java.util.Optional;
import java.util.function.BiConsumer;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROCEDURE_SECTION;

public class SectionNameRegister implements BiConsumer<SectionNameNode, ProcessingContext> {
  @Override
  public void accept(SectionNameNode node, ProcessingContext ctx) {
    if (node.getParent().getNodeType() != PROCEDURE_SECTION) {
      // TODO: register usage
      return;
    }
    ctx.getErrors()
        .addAll(
            node.getProgram()
                .flatMap(
                    parent ->
                        parent
                            .verifySectionNodeDuplication(node, node.getMessageService())
                            .map(Optional::of)
                            .orElse(parent.registerSectionNameNode(node)))
                .map(ImmutableList::of)
                .orElseGet(ImmutableList::of));
  }
}
