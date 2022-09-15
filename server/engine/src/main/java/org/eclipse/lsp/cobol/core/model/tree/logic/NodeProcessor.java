package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.*;
import java.util.function.Consumer;

public class NodeProcessor {
  private static final int PROCESS_CALLS_THRESHOLD = 10;
  private final Map<Integer, Map<Class<? extends Node>, Consumer<ProcessingContext>>> processors =
      new HashMap<>();

  public static List<SyntaxError> processSyntaxTree(Node rootNode) {
    ProcessingContext ctx = new ProcessingContext(new ArrayList<>());
    int processCalls = 0;
    do {
      process(rootNode, ctx);
      processCalls++;
      if (processCalls > PROCESS_CALLS_THRESHOLD) {
        throw new IllegalStateException("Infinity loop in tree processing");
      }
    } while (!isProcessed(rootNode));
    return ctx.getErrors();
  }

  /**
   * Process tree node and its children after tree construction.
   *
   * @param node a node to process
   */
  public static void process(Node node, ProcessingContext ctx) {
    Optional<Consumer<ProcessingContext>> processTmp = node.getNextStep();
    node.setNextStep(Optional.empty());
    processTmp.ifPresent(processingContextConsumer -> processingContextConsumer.accept(ctx));
    node.getChildren().forEach(n -> process(n, ctx));
  }

  public static Consumer<ProcessingContext> runNextTime(
      Node node, Consumer<ProcessingContext> proc) {
    return _ctx -> addProcessStep(node, proc);
  }

  /**
   * Return true if this node and all its children was fully processed and there is no need to do
   * extra `process` calls in order to finish node processing.
   *
   * @param node a node to check
   * @return true if no more `process` calls is needed
   */
  public static boolean isProcessed(Node node) {
    return !node.getNextStep().isPresent()
        && node.getChildren().stream().allMatch(NodeProcessor::isProcessed);
  }

  public static void addProcessStep(Node node, Consumer<ProcessingContext> processCall) {
    if (node.getNextStep().isPresent()) {
      Consumer<ProcessingContext> previousProcessIt = node.getNextStep().get();
      node.setNextStep(
          Optional.of(
              ctx -> {
                previousProcessIt.accept(ctx);
                processCall.accept(ctx);
              }));
    } else {
      node.setNextStep(Optional.of(processCall));
    }
  }
}
