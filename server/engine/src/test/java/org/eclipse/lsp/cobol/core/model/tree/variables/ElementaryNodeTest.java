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

import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test effective data type and valid use of different data format clauses for {@link
 * ElementaryNode}
 */
class ElementaryNodeTest {

  ElementaryItemNode getNode(String picClause, UsageFormat usageClause) {
    return new ElementaryItemNode(
        null, 2, "TEST-NODE", false, picClause, "", usageClause, false, false, false);
  }

  @Test
  void testValidatePicAndUsageClauseWhenPicAndUsageAreInCompatible() {
    ElementaryItemNode node = getNode("PIC 9", UsageFormat.COMPUTATIONAL_1);
    List<SyntaxError> actualResult = node.process();
    assertEquals(1, actualResult.size());
    assertEquals(ErrorSeverity.WARNING, actualResult.get(0).getSeverity());
    assertEquals("semantics.noPicClause", actualResult.get(0).getMessageTemplate().getTemplate());
  }

  @Test
  void testValidatePicAndUsageClauseWhenPicAndUsageContradicts() {
    ElementaryItemNode node = getNode("PIC X", UsageFormat.COMPUTATIONAL_5);
    List<SyntaxError> actualResult = node.process();
    assertEquals(1, actualResult.size());
    assertEquals(ErrorSeverity.WARNING, actualResult.get(0).getSeverity());
    assertEquals(
        "semantics.picAndUsageConflict", actualResult.get(0).getMessageTemplate().getTemplate());
  }

  @Test
  void testValidatePicAndUsageClauseWhenPicAndUsageAreCompatible() {
    ElementaryItemNode node = getNode("PIC 9", UsageFormat.DISPLAY);
    List<SyntaxError> actualResult = node.process();
    assertEquals(0, actualResult.size());

    // TODO:
    // NEED CLARIFICATION. If PIC 999 UTF-8 is valid.
    node = getNode("PIC 9", UsageFormat.UTF_8);
    List<SyntaxError> actualResult1 = node.process();
    assertEquals(0, actualResult1.size());
  }

  @Test
  void testValidatePicAndUsageClauseWhenUsageInCompatibleWithOtherClauses() {
    ElementaryItemNode elementNode =
        new ElementaryItemNode(
            null, 2, "TEST-NODE", false, "PIC X", "", UsageFormat.UTF_8, false, true, false);
    List<SyntaxError> actualResult = elementNode.process();
    assertEquals(1, actualResult.size());
    assertEquals(ErrorSeverity.WARNING, actualResult.get(0).getSeverity());
    assertEquals(
        "semantics.improperUseBlankWhenZeroAndSignClause",
        actualResult.get(0).getMessageTemplate().getTemplate());
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
