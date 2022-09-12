package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.tree.RootNode;

import java.util.function.BiConsumer;

public class RootNodeWaitForVariableStructure implements BiConsumer<RootNode, ProcessingContext> {
    @Override
    public void accept(RootNode rootNode, ProcessingContext context) {
        rootNode.addProcessStep(ctx -> new RootNodeUpdateCopyNodesByPositionInTree().accept(rootNode, ctx));
    }
}
