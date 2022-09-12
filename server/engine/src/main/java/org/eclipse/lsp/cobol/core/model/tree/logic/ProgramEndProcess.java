package org.eclipse.lsp.cobol.core.model.tree.logic;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.ProgramEndNode;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.function.BiConsumer;

@Slf4j
public class ProgramEndProcess implements BiConsumer<ProgramEndNode, ProcessingContext> {
  @Override
  public void accept(ProgramEndNode programEndNode, ProcessingContext ctx) {
    if (!programEndNode.getProgram().isPresent()) {
      // TODO an error
      return;
    }
    ProgramNode node = programEndNode.getProgram().get();
    if (node.getProgramName() == null) {
      LOG.debug("Syntax error: Program name is empty");
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .locality(programEndNode.getLocality())
                  .severity(ErrorSeverity.WARNING)
                  .messageTemplate(MessageTemplate.of("CobolVisitor.progIDIssueMsg"))
                  .build());
    } else if (!node.getProgramName().equalsIgnoreCase(programEndNode.getProgramId())) {
      LOG.debug(
          "Syntax error: program name is '{}', but END PROGRAM refers to '{}'",
          node.getProgramName(),
          programEndNode.getProgramId());
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .locality(programEndNode.getLocality())
                  .severity(ErrorSeverity.WARNING)
                  .messageTemplate(
                      MessageTemplate.of("CobolVisitor.identicalProgMsg", node.getProgramName()))
                  .build());
    }
  }
}
