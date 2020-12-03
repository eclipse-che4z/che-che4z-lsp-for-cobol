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

package com.broadcom.lsp.cobol.core.preprocessor.delegates.util;

import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.model.variables.GroupItem;
import com.broadcom.lsp.cobol.core.model.variables.StructuredVariable;
import org.junit.jupiter.api.Test;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test check the logic of {@link VariableUtils} */
class VariableUtilsTest {

  /** Positive test for renameQualifier () */
  @Test
  void renameQualifier() {
    String qualifier = "PARENT CHILD";
    String renameItem = "PARENT1";
    String expected = "PARENT1 CHILD";
    assertEquals(expected, VariableUtils.renameQualifier(qualifier, renameItem));
  }

  /** Negative test for renameQualifier () */
  @Test
  void renameQualifierOneValue() {
    String qualifier = "CHILD";
    String renameItem = "PARENT1";
    String expected = "PARENT1";
    assertEquals(expected, VariableUtils.renameQualifier(qualifier, renameItem));
  }

  /** Test qualifier for the top variable equals to its name */
  @Test
  void createQualifierForTop() {
    String name = "VARNAME";
    assertEquals(name, VariableUtils.createQualifier(new ArrayDeque<>(), name));
  }

  /**
   * Test qualifier for the structure contains all the hierarchy elements from top to down separated
   * by spaces with the variable name at the end
   */
  @Test
  void createQualifierForStructure() {
    Locality locality = Locality.builder().build();
    String name = "VARNAME";
    Deque<StructuredVariable> structure =
        new ArrayDeque<>(
            List.of(
                new GroupItem(1, "TOP", "TOP", locality),
                new GroupItem(2, "PARENT", "TOP PARENT", locality)));
    assertEquals("TOP PARENT VARNAME", VariableUtils.createQualifier(structure, name));
  }

  /** Test qualifier for variable with an empty name contains only structure elements */
  @Test
  void createQualifierForStructureEmptyName() {
    Locality locality = Locality.builder().build();
    String name = "";
    Deque<StructuredVariable> structure =
        new ArrayDeque<>(
            List.of(
                new GroupItem(1, "TOP", "TOP", locality),
                new GroupItem(2, "PARENT", "TOP PARENT", locality)));
    assertEquals("TOP PARENT ", VariableUtils.createQualifier(structure, name));
  }
}
