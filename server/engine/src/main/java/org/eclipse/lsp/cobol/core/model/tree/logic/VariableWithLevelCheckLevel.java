package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableWithLevelNode;

import java.util.function.BiConsumer;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.*;

public class VariableWithLevelCheckLevel
    implements BiConsumer<VariableWithLevelNode, ProcessingContext> {
  @Override
  public void accept(VariableWithLevelNode node, ProcessingContext ctx) {
    if ((node.getLevel() == LEVEL_01 || node.getLevel() == LEVEL_77)
        && node.getLocality().getRange().getStart().getCharacter() > AREA_A_FINISH) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(AREA_A_WARNING, node.getName())));
    }

    if (node.isSpecifiedGlobal() && node.getLevel() != LEVEL_01) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(GLOBAL_NON_01_LEVEL_MSG)));
    }
  }
}
