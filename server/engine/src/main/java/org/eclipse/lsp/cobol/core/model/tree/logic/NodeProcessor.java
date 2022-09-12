package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;

public class NodeProcessor {
    private static final int PROCESS_CALLS_THRESHOLD = 10;

    public static List<SyntaxError> processSyntaxTree(Node rootNode) {
        ProcessingContext ctx = new ProcessingContext(new ArrayList<>());
        int processCalls = 0;
        do {
            rootNode.process(ctx);
            processCalls++;
            if (processCalls > PROCESS_CALLS_THRESHOLD) {
                throw new IllegalStateException("Infinity loop in tree processing");
            }
        } while (!rootNode.isProcessed());
        return ctx.getErrors();
    }

    public static void process(Node node, ProcessingContext ctx) {
        Optional<Consumer<ProcessingContext>> processTmp = node.getNextStep();
        node.setNextStep(Optional.empty());
        processTmp.ifPresent(processingContextConsumer -> processingContextConsumer.accept(ctx));
        node.getChildren().forEach(n -> process(n, ctx));
    }

    public static Consumer<ProcessingContext> runNextTime(Node node,Consumer<ProcessingContext> proc) {
        return _ctx -> node.addProcessStep(proc);
    }
}
