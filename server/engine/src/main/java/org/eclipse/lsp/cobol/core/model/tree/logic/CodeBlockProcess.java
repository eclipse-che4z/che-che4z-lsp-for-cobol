package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockUsageNode;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.Optional;
import java.util.function.BiConsumer;

public class CodeBlockProcess implements BiConsumer<CodeBlockUsageNode, ProcessingContext> {
  @Override
  public void accept(CodeBlockUsageNode node, ProcessingContext ctx) {
    Optional<ProgramNode> programOpt = node.getProgram();
    if (!programOpt.isPresent()) {
      // TODO: error?
      return;
    }
    ProgramNode program = programOpt.get();
    Optional<SyntaxError> syntaxError = program.registerCodeBlockUsage(node);
    syntaxError.ifPresent(error -> ctx.getErrors().add(error));
  }
}
