package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.semantics.CodeBlockDefinitionUtils;

import java.util.function.BiConsumer;

public class DefineCodeBlock implements BiConsumer<Node, ProcessingContext> {
    @Override
    public void accept(Node node, ProcessingContext ctx) {
        ctx.getErrors().addAll(CodeBlockDefinitionUtils.defineCodeBlock(node));
    }
}
