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
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.logic.ProcessingContext;
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
    assertTrue(node.isProcessed());
    ArrayList<SyntaxError> errors = new ArrayList<>();
    node.process(new ProcessingContext(errors));
    assertEquals(ImmutableList.of(), errors);
    assertTrue(node.isProcessed());
  }

  @Test
  void testOnePass() {
    /** Do processing in one step and return ERROR_1 */
    class ErrorNode extends Node {
      ErrorNode() {
        super(null, NodeType.ROOT);
        addProcessStep(ctx -> ctx.getErrors().addAll(processTheNode()));
      }

      private List<SyntaxError> processTheNode() {
        return ImmutableList.of(ERROR_1);
      }
    }

    ErrorNode node = new ErrorNode();
    assertFalse(node.isProcessed());
    ArrayList<SyntaxError> errors = new ArrayList<>();
    node.process(new ProcessingContext(errors));
    assertEquals(ImmutableList.of(ERROR_1), errors);
    assertTrue(node.isProcessed());
  }

  @Test
  void testTwoPasses() {
    /** Do processing in two steps and return ERROR_1 and then ERROR_2 */
    class ErrorNode extends Node {
      ErrorNode() {
        super(null, NodeType.ROOT);
        addProcessStep(ctx -> ctx.getErrors().addAll(processTheNodeFirst()));
      }

      private List<SyntaxError> processTheNodeFirst() {
        addProcessStep(ctx -> ctx.getErrors().addAll(processTheNodeSecond()));

        return ImmutableList.of(ERROR_1);
      }

      private List<SyntaxError> processTheNodeSecond() {
        return ImmutableList.of(ERROR_2);
      }
    }

    ErrorNode node = new ErrorNode();
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    node.process(ctx);
    assertFalse(node.isProcessed());
    assertEquals(ImmutableList.of(ERROR_1), ctx.getErrors());
    assertFalse(node.isProcessed());
    ctx.getErrors().clear();
    node.process(ctx);
    assertEquals(ImmutableList.of(ERROR_2), ctx.getErrors());
    assertTrue(node.isProcessed());
  }

  @Test
  void testNodeExtension() {
    /** Do processing in one step and return ERROR_1 */
    class NodeForExtension extends Node {
      NodeForExtension() {
        super(null, NodeType.ROOT);
        addProcessStep(ctx -> ctx.getErrors().addAll(processFirst()));
      }

      private List<SyntaxError> processFirst() {
        return ImmutableList.of(ERROR_1);
      }
    }

    /** Do processing in one step and return ERROR_2 */
    class LeafNode extends NodeForExtension {
      LeafNode() {
        addProcessStep(ctx -> ctx.getErrors().addAll(processSecond()));
      }

      private List<SyntaxError> processSecond() {
        return ImmutableList.of(ERROR_2);
      }
    }

    LeafNode node = new LeafNode();
    assertFalse(node.isProcessed());
    ArrayList<SyntaxError> errors = new ArrayList<>();
    node.process(new ProcessingContext(errors));
    assertEquals(ImmutableList.of(ERROR_1, ERROR_2), errors);
    assertTrue(node.isProcessed());
  }

  @Test
  void testNodeExtensionAndTwoSteps() {
    /** Do processing in one step and return ERROR_1 */
    class NodeForExtension extends Node {
      NodeForExtension() {
        super(null, NodeType.ROOT);
        addProcessStep(ctx -> ctx.getErrors().addAll(processFirst()));
      }

      private List<SyntaxError> processFirst() {
        return ImmutableList.of(ERROR_1);
      }
    }

    /** Do processing in two steps and return ERROR_2 and then ERROR_3 */
    class LeafNode extends NodeForExtension {
      LeafNode() {
        addProcessStep(ctx -> ctx.getErrors().addAll(processStep1()));
      }

      private List<SyntaxError> processStep1() {
        addProcessStep(ctx -> ctx.getErrors().addAll(processStep2()));
        return ImmutableList.of(ERROR_2);
      }

      private List<SyntaxError> processStep2() {
        return ImmutableList.of(ERROR_3);
      }
    }

    LeafNode node = new LeafNode();
    assertFalse(node.isProcessed());
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    node.process(ctx);
    assertEquals(ImmutableList.of(ERROR_1, ERROR_2), ctx.getErrors());
    assertFalse(node.isProcessed());
    ctx.getErrors().clear();
    node.process(ctx);
    assertEquals(ImmutableList.of(ERROR_3), ctx.getErrors());
    assertTrue(node.isProcessed());
  }

  @Test
  void testNodeExtensionAndTwoStepsAnotherCase() {
    /** Do processing in two steps and return ERROR_1 and then ERROR_2 */
    class NodeForExtension extends Node {
      NodeForExtension() {
        super(null, NodeType.ROOT);
        addProcessStep(ctx -> ctx.getErrors().addAll(processStep1()));
      }

      private List<SyntaxError> processStep1() {
        addProcessStep(ctx -> ctx.getErrors().addAll(processStep2()));
        return ImmutableList.of(ERROR_1);
      }

      private List<SyntaxError> processStep2() {
        return ImmutableList.of(ERROR_2);
      }
    }

    /** Do processing in one step and return ERROR_3 */
    class LeafNode extends NodeForExtension {
      LeafNode() {
        addProcessStep(ctx -> ctx.getErrors().addAll(processSecond()));
      }

      private List<SyntaxError> processSecond() {
        return ImmutableList.of(ERROR_3);
      }
    }

    LeafNode node = new LeafNode();
    assertFalse(node.isProcessed());
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors);
    node.process(ctx);
    assertEquals(ImmutableList.of(ERROR_1, ERROR_3), ctx.getErrors());
    assertFalse(node.isProcessed());
    ctx.getErrors().clear();
    node.process(ctx);
    assertEquals(ImmutableList.of(ERROR_2), errors);
    assertTrue(node.isProcessed());
  }

  private static SyntaxError getError(String message) {
    return SyntaxError.syntaxError()
        .messageTemplate(MessageTemplate.of(message))
        .build();
  }
}
