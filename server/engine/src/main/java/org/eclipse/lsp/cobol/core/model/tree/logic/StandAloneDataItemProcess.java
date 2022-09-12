package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.tree.variables.StandAloneDataItemNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.UsageFormat;

import java.util.function.BiConsumer;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.EMPTY_STRUCTURE_MSG;

public class StandAloneDataItemProcess
    implements BiConsumer<StandAloneDataItemNode, ProcessingContext> {
  @Override
  public void accept(StandAloneDataItemNode node, ProcessingContext ctx) {
    if (node.getPicClause().isEmpty() && node.getUsageFormat() != UsageFormat.INDEX) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, node.getName())));
    }
  }
}
