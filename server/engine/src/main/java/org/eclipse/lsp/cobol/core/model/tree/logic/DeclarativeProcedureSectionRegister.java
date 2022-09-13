package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.DeclarativeProcedureSectionNode;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphNameNode;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.Optional;
import java.util.function.BiConsumer;

public class DeclarativeProcedureSectionRegister
    implements BiConsumer<DeclarativeProcedureSectionNode, ProcessingContext> {
  @Override
  public void accept(DeclarativeProcedureSectionNode node, ProcessingContext processingContext) {
    Optional<ProgramNode> programOpt = node.getProgram();
    if (!programOpt.isPresent()) {
      // TODO: error?
      return;
    }
    ProgramNode program = programOpt.get();
    program.registerCodeBlock(node);
    ParagraphNameNode paragraphNameNode = new ParagraphNameNode(node.getLocality(), node.getName());
    paragraphNameNode.addProcessStep(ctx -> new ParagraphNameRegister().accept(paragraphNameNode, ctx));
    program.registerParagraphNameNode(paragraphNameNode);
  }
}
