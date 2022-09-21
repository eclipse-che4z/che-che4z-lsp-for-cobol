/*
 * Copyright (c) 2021 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingPhase;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/** Test that nodes can be processed in several steps */
class NodeProcessingTest {
  private static final SyntaxError ERROR_1 = getError("First error message");
  private static final SyntaxError ERROR_2 = getError("Second error message");
  private static final SyntaxError ERROR_3 = getError("Third error message");

  @Test
  void testSimple() {
    /** Do nothing */
    class SimpleNode extends Node {
      SimpleNode() {
        super(null, NodeType.ROOT);
      }
    }

    SimpleNode node = new SimpleNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    new AstProcessor().process(ProcessingPhase.TRANSFORMATION, node, new ProcessingContext(errors));
    assertEquals(ImmutableList.of(), errors);
  }

  @Test
  void testOnePass() {
    /** Do processing in one step and return ERROR_1 */
    class ErrorNode extends Node {
      ErrorNode() {
        super(null, NodeType.ROOT);
      }
    }

    ErrorNode node = new ErrorNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    AstProcessor astProcessor = new AstProcessor();
    ProcessingContext processingContext = new ProcessingContext(errors);
    processingContext.register(
        new ProcessorDescription(
            ErrorNode.class, ProcessingPhase.VALIDATION, (n, ctx) -> ctx.getErrors().add(ERROR_1)));
    astProcessor.process(ProcessingPhase.VALIDATION, node, processingContext);
    assertEquals(ImmutableList.of(ERROR_1), errors);
  }

  @Test
  void testTwoPasses() {
    /** Do processing in two steps and return ERROR_1 and then ERROR_2 */
    class ErrorNode extends Node {
      ErrorNode() {
        super(null, NodeType.ROOT);
      }
    }

    ErrorNode node = new ErrorNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    AstProcessor astProcessor = new AstProcessor();
    ctx.register(
        new ProcessorDescription(
            ErrorNode.class, ProcessingPhase.TRANSFORMATION, (n, c) -> c.getErrors().add(ERROR_1)));
    ctx.register(
        new ProcessorDescription(
            ErrorNode.class, ProcessingPhase.VALIDATION, (n, c) -> c.getErrors().add(ERROR_2)));
    astProcessor.process(ProcessingPhase.TRANSFORMATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_1), ctx.getErrors());
    ctx.getErrors().clear();
    astProcessor.process(ProcessingPhase.VALIDATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_2), ctx.getErrors());
  }

  @Test
  void testNodeExtension() {
    /** Do processing in one step and return ERROR_1 */
    class NodeForExtension extends Node {
      NodeForExtension() {
        super(null, NodeType.ROOT);
      }
    }

    /** Do processing in one step and return ERROR_2 */
    class LeafNode extends NodeForExtension {}

    LeafNode node = new LeafNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    AstProcessor astProcessor = new AstProcessor();
    ctx.register(
        new ProcessorDescription(
            NodeForExtension.class,
            ProcessingPhase.TRANSFORMATION,
            (n, c) -> c.getErrors().add(ERROR_1)));
    ctx.register(
        new ProcessorDescription(
            LeafNode.class, ProcessingPhase.TRANSFORMATION, (n, c) -> c.getErrors().add(ERROR_2)));

    astProcessor.process(ProcessingPhase.TRANSFORMATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_1, ERROR_2), errors);
  }

  @Test
  void testNodeExtensionAndTwoSteps() {
    /** Do processing in one step and return ERROR_1 */
    class NodeForExtension extends Node {
      NodeForExtension() {
        super(null, NodeType.ROOT);
        //        AstProcessor.addProcessStep(this, ctx -> ctx.getErrors().addAll(processFirst()));
      }

      private List<SyntaxError> processFirst() {
        return ImmutableList.of(ERROR_1);
      }
    }

    /** Do processing in two steps and return ERROR_2 and then ERROR_3 */
    class LeafNode extends NodeForExtension {
      LeafNode() {
        //        AstProcessor.addProcessStep(this, ctx -> ctx.getErrors().addAll(processStep1()));
      }

      private List<SyntaxError> processStep1() {
        //        AstProcessor.addProcessStep(this, ctx -> ctx.getErrors().addAll(processStep2()));
        return ImmutableList.of(ERROR_2);
      }

      private List<SyntaxError> processStep2() {
        return ImmutableList.of(ERROR_3);
      }
    }
    LeafNode node = new LeafNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    AstProcessor astProcessor = new AstProcessor();
    ctx.register(
        new ProcessorDescription(
            NodeForExtension.class,
            ProcessingPhase.TRANSFORMATION,
            (n, c) -> c.getErrors().add(ERROR_1)));
    ctx.register(
        new ProcessorDescription(
            LeafNode.class, ProcessingPhase.TRANSFORMATION, (n, c) -> c.getErrors().add(ERROR_2)));
    ctx.register(
        new ProcessorDescription(
            LeafNode.class, ProcessingPhase.VALIDATION, (n, c) -> c.getErrors().add(ERROR_3)));

    astProcessor.process(ProcessingPhase.TRANSFORMATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_1, ERROR_2), ctx.getErrors());
    ctx.getErrors().clear();
    astProcessor.process(ProcessingPhase.VALIDATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_3), ctx.getErrors());
  }

  @Test
  void testNodeExtensionAndTwoStepsAnotherCase() {
    /** Do processing in two steps and return ERROR_1 and then ERROR_2 */
    class NodeForExtension extends Node {
      NodeForExtension() {
        super(null, NodeType.ROOT);
      }
    }

    /** Do processing in one step and return ERROR_3 */
    class LeafNode extends NodeForExtension {}

    LeafNode node = new LeafNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    AstProcessor astProcessor = new AstProcessor();
    ctx.register(new ProcessorDescription(
        NodeForExtension.class,
        ProcessingPhase.TRANSFORMATION,
        (n, c) -> c.getErrors().add(ERROR_1)));
    ctx.register(new ProcessorDescription(
        NodeForExtension.class, ProcessingPhase.VALIDATION, (n, c) -> c.getErrors().add(ERROR_2)));
    ctx.register(new ProcessorDescription(
        LeafNode.class, ProcessingPhase.TRANSFORMATION, (n, c) -> c.getErrors().add(ERROR_3)));

    astProcessor.process(ProcessingPhase.TRANSFORMATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_1, ERROR_3), ctx.getErrors());
    ctx.getErrors().clear();
    astProcessor.process(ProcessingPhase.VALIDATION, node, ctx);
    assertEquals(ImmutableList.of(ERROR_2), errors);
  }

  private static SyntaxError getError(String message) {
    return SyntaxError.syntaxError().messageTemplate(MessageTemplate.of(message)).build();
  }
}
