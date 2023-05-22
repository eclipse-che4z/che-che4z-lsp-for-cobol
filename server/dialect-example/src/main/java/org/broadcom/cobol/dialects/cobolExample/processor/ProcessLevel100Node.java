package org.broadcom.cobol.dialects.cobolExample.processor;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

import java.util.Optional;
import org.broadcom.cobol.dialects.cobolExample.nodes.Level100Node;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;

public class ProcessLevel100Node implements Processor<Level100Node> {
  private final MessageService messageService;

  public ProcessLevel100Node(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public void accept(Level100Node level100Node, ProcessingContext processingContext) {
    Optional<Node> nearestParentByType = level100Node.getNearestParentByType(NodeType.SECTION);
    if (!nearestParentByType.isPresent()) {
      addError(level100Node, processingContext);
    }
    nearestParentByType.ifPresent(
        sectionNode -> {
          SectionNode sn = (SectionNode) sectionNode;
          if (sn.getSectionType() == SectionType.WORKING_STORAGE) {
            VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
            ProgramNode programNode =
                sectionNode
                    .getProgram()
                    .orElseThrow(
                        () ->
                            new RuntimeException(
                                "Program for section " + sn.getSectionType() + " not found"));
            registerVariable(
                variableAccumulator, programNode, new Level100Transformer(level100Node).generate());
          } else {
            addError(level100Node, processingContext);
          }
        });
  }

  private void addError(Level100Node level100Node, ProcessingContext processingContext) {
    processingContext
            .getErrors()
            .add(
                    SyntaxError.syntaxError()
                            .errorSource(ErrorSource.DIALECT)
                            .location(level100Node.getLocality().toOriginalLocation())
                            .suggestion(messageService.getMessage("myRule.level100.wrongPlace"))
                            .severity(ERROR)
                            .build());
  }

  private void registerVariable(
      VariableAccumulator variableAccumulator, ProgramNode programNode, VariableNode variable) {
    variableAccumulator.addVariableDefinition(programNode, variable);
    variable.getChildren().stream()
        .map(VariableNode.class::cast)
        .forEach(c -> variableAccumulator.addVariableDefinition(programNode, c));
  }
}
