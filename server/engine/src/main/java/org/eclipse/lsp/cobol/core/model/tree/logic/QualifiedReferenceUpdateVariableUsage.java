package org.eclipse.lsp.cobol.core.model.tree.logic;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.FigurativeConstants;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;

import java.util.List;
import java.util.function.BiConsumer;
import java.util.stream.Collectors;

@Slf4j
public class QualifiedReferenceUpdateVariableUsage
    implements BiConsumer<QualifiedReferenceNode, ProcessingContext> {
  private static final String NOT_DEFINED_ERROR = "semantics.notDefined";
  private static final String DUPLICATED_DEFINITION_ERROR = "semantics.duplicated";

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext ctx) {
    List<VariableUsageNode> variableUsageNodes =
        node.getChildren().stream()
            .filter(Node.hasType(NodeType.VARIABLE_USAGE))
            .map(VariableUsageNode.class::cast)
            .collect(Collectors.toList());
    if (variableUsageNodes.isEmpty()) {
      LOG.warn("Qualified reference node don't have any variable usages. {}", node);
      return;
    }

    List<VariableNode> foundDefinitions =
        node.getProgram()
            .map(programNode -> programNode.getVariableDefinition(variableUsageNodes))
            .orElseGet(ImmutableList::of);

    for (VariableNode definitionNode : foundDefinitions) {
      node.setVariableDefinitionNode(definitionNode);
      for (VariableUsageNode usageNode : variableUsageNodes) {
        while (definitionNode != null && !usageNode.getName().equals(definitionNode.getName())) {
          definitionNode =
              definitionNode
                  .getNearestParentByType(NodeType.VARIABLE)
                  .map(VariableNode.class::cast)
                  .orElse(null);
        }
        if (definitionNode == null) {
          // this is not valid case: if we found definition with all qualifiers we must find
          // definitions here too
          LOG.error("Can't find definitions for all usages");
          break;
        }
        definitionNode.addUsage(usageNode);
      }
    }
    if (foundDefinitions.size() == 1) {
      return;
    }
    String dataName = variableUsageNodes.get(0).getName();
    if (FigurativeConstants.FIGURATIVE_CONSTANTS.stream()
        .anyMatch(e -> dataName.toUpperCase().equals(e))) {
      return;
    }

    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .severity(ErrorSeverity.ERROR)
            .locality(node.getLocality())
            .messageTemplate(
                MessageTemplate.of(
                    foundDefinitions.isEmpty() ? NOT_DEFINED_ERROR : DUPLICATED_DEFINITION_ERROR,
                    dataName))
            .build();
    ctx.getErrors().add(error);
    LOG.debug("Syntax error by QualifiedReferenceNode " + error.toString());
  }
}
