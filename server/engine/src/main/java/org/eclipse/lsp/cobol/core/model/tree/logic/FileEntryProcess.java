package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.FileEntryNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;

import java.util.function.BiConsumer;

public class FileEntryProcess implements BiConsumer<FileEntryNode, ProcessingContext> {
  @Override
  public void accept(FileEntryNode node, ProcessingContext ctx) {
    node.getProgram()
        .ifPresent(
            o ->
                o.getDepthFirstStream()
                    .filter(Node.hasType(NodeType.VARIABLE_DEFINITION))
                    .map(VariableDefinitionNode.class::cast)
                    .filter(n -> n.getLevel() == VariableDefinitionUtil.LEVEL_FD_SD)
                    .filter(n -> n.getVariableName().getName().equals(node.getFileName()))
                    .forEach(n -> n.setFileControlClause(node.getFileControlClause())));
  }
}
