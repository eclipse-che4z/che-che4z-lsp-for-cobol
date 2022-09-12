package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;

import java.util.function.BiConsumer;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.FD_WITHOUT_FILE_CONTROL;

public class FileDescriptionProcess implements BiConsumer<FileDescriptionNode, ProcessingContext> {
  @Override
  public void accept(FileDescriptionNode node, ProcessingContext ctx) {
    if (StringUtils.isBlank(node.getFileControlClause())) {
      ctx.getErrors()
          .add(
              node.getError(
                  MessageTemplate.of(FD_WITHOUT_FILE_CONTROL, node.getName()),
                  ErrorSeverity.ERROR));
    }
    ctx.getErrors().addAll(VariableDefinitionUtil.processNodeWithVariableDefinitions(node));
  }
}
