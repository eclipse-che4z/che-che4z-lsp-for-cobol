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

package org.eclipse.lsp.cobol.core.model.tree.variables;

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.EffectiveDataType;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.processors.ElementaryNodeCheck;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test effective data type and valid use of different data format clauses for {@link
 * ElementaryNode}
 */
class ElementaryNodeTest {
  ElementaryItemNode getNode(String picClause, UsageFormat usageClause) {
    return new ElementaryItemNode(
        Locality.builder().build(), 2, "TEST-NODE", false, picClause, "", usageClause, false, false, false);
  }

  @Test
  void testValidatePicAndUsageClauseWhenPicAndUsageAreInCompatible() {
    ElementaryItemNode node = getNode("PIC 9", UsageFormat.COMPUTATIONAL_1);
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of());
    AstProcessor astProcessor = new AstProcessor();
    ctx.register(
        new ProcessorDescription(
            ElementaryItemNode.class, ProcessingPhase.TRANSFORMATION, new ElementaryNodeCheck()));
    astProcessor.process(ProcessingPhase.TRANSFORMATION, node, ctx);
    assertEquals(1, errors.size());
    assertEquals(ErrorSeverity.WARNING, errors.get(0).getSeverity());
    assertEquals("semantics.noPicClause", errors.get(0).getMessageTemplate().getTemplate());
  }

  @Test
  void testValidatePicAndUsageClauseWhenPicAndUsageContradicts() {
    ElementaryItemNode node = getNode("PIC X", UsageFormat.COMPUTATIONAL_5);
    ArrayList<SyntaxError> errors = new ArrayList<>();
    AstProcessor astProcessor = new AstProcessor();
    ProcessingContext ctx = new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of());
    ctx.register(
        new ProcessorDescription(
            ElementaryItemNode.class, ProcessingPhase.TRANSFORMATION, new ElementaryNodeCheck()));
    astProcessor.process(ProcessingPhase.TRANSFORMATION, node, ctx);
    assertEquals(1, errors.size());
    assertEquals(ErrorSeverity.WARNING, errors.get(0).getSeverity());
    assertEquals("semantics.picAndUsageConflict", errors.get(0).getMessageTemplate().getTemplate());
  }

  @Test
  void testValidatePicAndUsageClauseWhenPicAndUsageAreCompatible() {
    ElementaryItemNode node = getNode("PIC 9", UsageFormat.DISPLAY);
    ArrayList<SyntaxError> errors = new ArrayList<>();
    new AstProcessor().process(ProcessingPhase.TRANSFORMATION, node, new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of()));
    assertEquals(0, errors.size());

    // TODO:
    // NEED CLARIFICATION. If PIC 999 UTF-8 is valid.
    node = getNode("PIC 9", UsageFormat.UTF_8);
    ArrayList<SyntaxError> errors2 = new ArrayList<>();
    new AstProcessor()
        .process(ProcessingPhase.TRANSFORMATION, node, new ProcessingContext(errors2, new SymbolAccumulatorService(), ImmutableMap.of()));
    assertEquals(0, errors2.size());
  }

  @Test
  void testValidatePicAndUsageClauseWhenUsageInCompatibleWithOtherClauses() {
    ElementaryItemNode elementNode =
        new ElementaryItemNode(
            Locality.builder().build(), 2, "TEST-NODE", false, "PIC X", "", UsageFormat.UTF_8, false, true, false);
    ArrayList<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of());
    AstProcessor astProcessor = new AstProcessor();
    ctx.register(
        new ProcessorDescription(
            ElementaryItemNode.class, ProcessingPhase.TRANSFORMATION, new ElementaryNodeCheck()));
    astProcessor.process(ProcessingPhase.TRANSFORMATION, elementNode, ctx);
    assertEquals(1, errors.size());
    assertEquals(ErrorSeverity.WARNING, errors.get(0).getSeverity());
    assertEquals(
        "semantics.improperUseBlankWhenZeroAndSignClause",
        errors.get(0).getMessageTemplate().getTemplate());
  }

  @Test
  void testEffectiveDataTypeWhenPicClauseIsNumeric() {
    ElementaryItemNode node = getNode("PIC 9", UsageFormat.COMPUTATIONAL_5);
    assertEquals(EffectiveDataType.INTEGER, node.getEffectiveDataType());

    node = getNode("PIC 9(5)", UsageFormat.DISPLAY);
    assertEquals(EffectiveDataType.INTEGER, node.getEffectiveDataType());

    node = getNode("PIC S99V99", UsageFormat.DISPLAY_1);
    assertEquals(EffectiveDataType.REAL, node.getEffectiveDataType());

    node = getNode("pic -9v9E+99", UsageFormat.COMP_1);
    assertEquals(EffectiveDataType.REAL, node.getEffectiveDataType());

    // TODO:
    // NEED CLARIFICATION. How to deal with Z and * .
    node = getNode("pic Z(5)9", UsageFormat.COMP_1);
    assertEquals(EffectiveDataType.UNDETERMINED, node.getEffectiveDataType());

    // TODO:
    // NEED CLARIFICATION. PIC $99 USAGE DISPLAY || PIC $* USAGE DISPLAY
    node = getNode("pic $99999.99CR", UsageFormat.COMP_1);
    assertEquals(EffectiveDataType.UNDETERMINED, node.getEffectiveDataType());
  }

  @Test
  void testEffectiveDataTypeWhenPicClauseIsAlphanumeric() {
    ElementaryItemNode node = getNode("PIC X", UsageFormat.COMPUTATIONAL_5);
    assertEquals(EffectiveDataType.STRING, node.getEffectiveDataType());

    node = getNode("PIC X(3)", UsageFormat.COMPUTATIONAL_5);
    assertEquals(EffectiveDataType.STRING, node.getEffectiveDataType());

    node = getNode("PIC 99X(3)", UsageFormat.COMPUTATIONAL_5);
    assertEquals(EffectiveDataType.STRING, node.getEffectiveDataType());

    node = getNode("PIC 99A(3)", UsageFormat.COMPUTATIONAL_5);
    assertEquals(EffectiveDataType.STRING, node.getEffectiveDataType());
  }
}
