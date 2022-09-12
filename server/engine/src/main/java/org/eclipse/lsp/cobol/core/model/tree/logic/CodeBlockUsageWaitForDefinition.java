package org.eclipse.lsp.cobol.core.model.tree.logic;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockUsageNode;

import java.util.List;
import java.util.Optional;
import java.util.function.BiConsumer;

public class CodeBlockUsageWaitForDefinition
    implements BiConsumer<CodeBlockUsageNode, ProcessingContext> {
  @Override
  public void accept(CodeBlockUsageNode node, ProcessingContext _ctx) {
    node.addProcessStep(
        ctx -> {
          List<SyntaxError> errors =
              node.getProgram()
                  .map(program -> program.registerCodeBlockUsage(node))
                  .filter(Optional::isPresent)
                  .map(Optional::get)
                  .map(ImmutableList::of)
                  .orElseGet(ImmutableList::of);
          ctx.getErrors().addAll(errors);
        });
  }
}
