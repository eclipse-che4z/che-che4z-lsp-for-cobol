package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.statements.ObsoleteNode;

import java.util.function.BiConsumer;

public class ObsoleteWarning implements BiConsumer<ObsoleteNode, ProcessingContext> {
  @Override
  public void accept(ObsoleteNode node, ProcessingContext ctx) {
    ctx.getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.WARNING)
                .locality(node.getLocality())
                .messageTemplate(MessageTemplate.of("cobolParser.ObsoleteCode"))
                .build());
  }
}
