package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.GroupItemNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.UsageFormat;

import java.util.function.BiConsumer;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.EMPTY_STRUCTURE_MSG;

public class GroupItemProcess implements BiConsumer<GroupItemNode, ProcessingContext> {
  @Override
  public void accept(GroupItemNode node, ProcessingContext ctx) {
    if (node.getUsageFormat() == UsageFormat.UNDEFINED
        && !node.isRedefines()
        && node.getChildren().stream().noneMatch(Node.hasType(NodeType.VARIABLE))) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, node.getName())));
    }
  }
}
