/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.service.delegates.hover;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.variables.ValueInterval;
import org.eclipse.lsp.cobol.core.model.variables.*;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.Collections;
import java.util.List;

import static org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.*;

/** Test {@link VariableHover} */
class VariableHoverTest {
  private final VariableHover variableHover = new VariableHover();
  private final TextDocumentPositionParams position5and5 =
      new TextDocumentPositionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Position(5, 5));

  @Test
  void getHoverForNullDocument() {
    assertNull(variableHover.getHover(null, position5and5));
  }

  @Test
  void getHoverForNoVariablesInModel() {
    assertNull(
        variableHover.getHover(getModelWithVariables(Collections.emptyList()), position5and5));
  }

  @Test
  void getHoverForPositionOutsideOfVariable() {
    Variable var =
        new ElementItem(
            1,
            "TEST",
            Locality.builder()
                .uri(DOCUMENT_URI)
                .range(new Range(new Position(4, 1), new Position(4, 7)))
                .build(),
            false,
            null,
            "9",
            "",
            UsageFormat.UNDEFINED);
    CobolDocumentModel model = getModelWithVariables(ImmutableList.of(var));
    assertNull(variableHover.getHover(model, position5and5));
  }

  @Test
  void getHoverForOneVariable() {
    Variable var =
        new ElementItem(
            1,
            "TEST",
            Locality.builder()
                .uri(DOCUMENT_URI)
                .range(new Range(new Position(5, 1), new Position(5, 7)))
                .build(),
            false,
            null,
            "9",
            "",
            UsageFormat.UNDEFINED);
    CobolDocumentModel model = getModelWithVariables(ImmutableList.of(var));
    Hover hover = variableHover.getHover(model, position5and5);
    assertNotNull(hover);
    MarkedString markedString = hover.getContents().getLeft().get(0).getRight();
    assertEquals("cobol", markedString.getLanguage());
    assertEquals("01 TEST PIC 9.", markedString.getValue());
  }

  @Test
  void getHoverForStructure() {
    String result =
        "01 TOP.\n"
            + "  05 MIDDLE-2.\n"
            + "    10 LEAF-2 PIC 9.\n"
            + "      88 COND-ITEM1 VALUE 0.\n"
            + "      88 COND-ITEM2 VALUES 1 THRU 3\n"
            + "                           4 THROUGH 5.";
    Locality targetLocality =
        Locality.builder()
            .uri(DOCUMENT_URI)
            .range(new Range(new Position(5, 4), new Position(5, 6)))
            .build();
    Locality otherLocality =
        Locality.builder()
            .uri(DOCUMENT_URI)
            .range(new Range(new Position(1, 1), new Position(2, 2)))
            .build();
    GroupItem top = new GroupItem(1, "TOP", otherLocality, false, null);
    GroupItem middle1 = new GroupItem(5, "MIDDLE-1", otherLocality, false, top);
    top.addChild(middle1);
    GroupItem middle2 = new GroupItem(5, "MIDDLE-2", targetLocality, false, top);
    top.addChild(middle2);
    ElementItem leaf2 =
        new ElementItem(
            10, "LEAF-2", otherLocality, false, middle2, "9", "", UsageFormat.UNDEFINED);
    middle2.addChild(leaf2);
    ConditionDataName cond1 =
        new ConditionDataName(
            "COND-ITEM1",
            otherLocality,
            leaf2,
            ImmutableList.of(new ValueInterval("0", null, null)),
            "VALUE");
    leaf2.addConditionName(cond1);
    ConditionDataName cond2 =
        new ConditionDataName(
            "COND-ITEM2",
            otherLocality,
            leaf2,
            ImmutableList.of(
                new ValueInterval("1", "3", "THRU"), new ValueInterval("4", "5", "THROUGH")),
            "VALUES");
    leaf2.addConditionName(cond2);

    CobolDocumentModel model =
        getModelWithVariables(ImmutableList.of(top, middle1, middle2, leaf2));
    Hover hover = variableHover.getHover(model, position5and5);
    assertNotNull(hover);
    MarkedString markedString = hover.getContents().getLeft().get(0).getRight();
    assertEquals("cobol", markedString.getLanguage());
    assertEquals(result, markedString.getValue());
  }

  private CobolDocumentModel getModelWithVariables(List<Variable> variables) {
    return new CobolDocumentModel("", AnalysisResult.builder().variables(variables).build());
  }
}
