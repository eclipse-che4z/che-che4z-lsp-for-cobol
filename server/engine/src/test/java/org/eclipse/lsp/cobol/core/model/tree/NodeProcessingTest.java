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
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
    new AstProcessor()
        .process(
            ProcessingPhase.TRANSFORMATION,
            node,
            new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of()));
    assertTrue(errors.isEmpty());
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
    List<SyntaxError> errors = new ArrayList<>();
    AstProcessor astProcessor = new AstProcessor();
    ProcessingContext processingContext = new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of());
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
    ProcessingContext ctx = new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of());
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

  private static SyntaxError getError(String message) {
    return SyntaxError.syntaxError().messageTemplate(MessageTemplate.of(message)).build();
  }
}
