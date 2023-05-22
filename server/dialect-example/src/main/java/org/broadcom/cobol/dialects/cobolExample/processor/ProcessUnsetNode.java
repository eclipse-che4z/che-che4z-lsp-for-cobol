package org.broadcom.cobol.dialects.cobolExample.processor;

import org.broadcom.cobol.dialects.cobolExample.nodes.UnsetNode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.Optional;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

public class ProcessUnsetNode implements Processor<UnsetNode> {
    private MessageService messageService;

    public ProcessUnsetNode(MessageService messageService) {
        this.messageService = messageService;
    }

    @Override
    public void accept(UnsetNode unsetNode, ProcessingContext processingContext) {
        Optional<VariableUsageNode> usageNode = unsetNode
                .getDepthFirstStream()
                .filter(VariableUsageNode.class::isInstance)
                .map(VariableUsageNode.class::cast)
                .filter(
                        node ->
                                node.getName().equals(unsetNode.getIdentifier().getName())
                                        && node.getLocality().equals(unsetNode.getIdentifier().getLocality()))
                .findFirst();
        if(usageNode.isPresent()) {
            VariableUsageNode variableUsageNode = usageNode.get();
            List<Location> usageNodeDefinitions = variableUsageNode.getDefinitions();
      unsetNode
          .getNearestParentByType(NodeType.PROGRAM)
          .ifPresent(
              programNode -> {
                Optional<VariableNode> definitionNode =
                    programNode
                        .getDepthFirstStream()
                        .filter(node -> node.getNodeType() == NodeType.VARIABLE)
                        .map(VariableNode.class::cast)
                        .filter(
                            node ->
                                node.getLocality()
                                    .getRange()
                                    .equals(usageNodeDefinitions.get(0).getRange()))
                        .findFirst();

                definitionNode.ifPresent(
                    node -> {
                      if (node.getVariableType() != VariableType.CONDITION_DATA_NAME) {
                        processingContext
                            .getErrors()
                            .add(
                                SyntaxError.syntaxError()
                                    .errorSource(ErrorSource.DIALECT)
                                    .location(
                                        unsetNode
                                            .getIdentifier()
                                            .getLocality()
                                            .toOriginalLocation())
                                    .suggestion(
                                        messageService.getMessage("muRule.unset.conditional.mandatory"))
                                    .severity(ERROR)
                                    .build());
                      }
                    });
              });
        }
    }
}
