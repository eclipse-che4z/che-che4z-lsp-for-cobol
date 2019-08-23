/*
 *
 *  Copyright (c) 2019 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.semantics;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.ca.lsp.core.cobol.model.Position;
import com.ca.lsp.core.cobol.semantics.CobolVariableContext;
import com.ca.lsp.core.cobol.model.Variable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.Before;
import org.junit.Test;

/**
 * Test for CobolVariableContextImpl
 *
 * @author teman02
 */
public class CobolVariableContextTest {
  private static final String LEVEL1 = "01";
  private static final String LEVEL2 = "02";
  private static final String LEVEL10 = "10";
  private static final String LEVEL18 = "18";
  private static final String LEVEL40 = "40";
  private static final String LEVEL77 = "77";

  private static final String VAR1 = "VAR1";
  private static final String VAR2 = "VAR2";
  private static final String VAR3 = "VAR3";
  private static final String VAR4 = "VAR4";
  private static final String VAR5 = "VAR5";
  private static final String VAR6 = "VAR6";
  private static final String VAR7 = "VAR7";
  private static final String VAR8 = "VAR8";

  private static final Position ERROR_POSITION1 = new Position(0, 0, 3, 1, 5);
  private static final Position ERROR_POSITION2 = new Position(0, 4, 8, 2, 5);

  private CobolVariableContext context;
  private Variable var1;
  private Variable var2;
  private Variable var3;
  private Variable var4;
  private Variable var5;
  private Variable var6;
  private Variable var7;
  private Variable var8;

  @Before
  public void createContext() {
    context = new CobolVariableContext();
    var1 = new Variable(LEVEL1, VAR1); // 01
    var2 = new Variable(LEVEL2, VAR2); // 02
    var3 = new Variable(LEVEL10, VAR3); // 10
    var4 = new Variable(LEVEL10, VAR4); // 10
    var5 = new Variable(LEVEL10, VAR5); // 10
    var6 = new Variable(LEVEL18, VAR6); // 18
    var7 = new Variable(LEVEL40, VAR7); // 40
    var8 = new Variable(LEVEL77, VAR8); // 77
  }

  @Test
  public void testDefine() {
    context.define(var1, ERROR_POSITION1);
    context.define(var2, ERROR_POSITION1);
    context.define(var3, ERROR_POSITION1);
    context.define(var4, ERROR_POSITION1);
    context.define(var5, ERROR_POSITION1);
    context.define(var6, ERROR_POSITION1);
    context.define(var7, ERROR_POSITION1);
    context.define(var8, ERROR_POSITION1);

    assertEquals(8, context.getAll().size());
    assertEquals(var1, context.get(VAR1));
  }

  @Test
  public void testAddUsage() {
    context.addUsage(VAR1, ERROR_POSITION1);
    context.addUsage(VAR1, ERROR_POSITION2);
    assertEquals(2, context.getUsages().get(var1.getName()).size());
  }

  @Test
  public void testGetNegative() {
    context.define(var1, ERROR_POSITION1);
    assertEquals(var1, context.get(VAR1));
    assertNull(context.get("null"));
    assertFalse(context.contains("notContains"));
  }

  @Test
  public void testGetNames() {
    context.define(var1, ERROR_POSITION1);
    context.define(var2, ERROR_POSITION1);

    List<String> expected = new ArrayList<>();
    expected.add(VAR1);
    expected.add(VAR2);
    assertEquals(expected, context.getAll().stream().map(Variable::getName).collect(Collectors.toList()));
  }

  /**
   * The test verify that exists a relation between first variable (data group) and second variable
   * (data item) In this case the second variable will have the first variable as parent and it will
   * be added in the children list of the first variable parent in the structure (if defined)
   */
  @Test
  public void createChildElementFromParentGroup() {
    context.generateRelations(var1, var3);
    assertTrue(var1.getChildren().contains(var3.getName()));
  }

  /**
   * The test verify that two variables are on the same level of indentation, and will have the same
   * parent in the structure (if defined)
   */
  @Test
  public void createChildElementAtSameLevelAsAnotherChild() {
    // assumptions: v1's  parent is pre-filled to check that v2 will have the same parent
    var3.setParent(var1);

    context.generateRelations(var3, var4);
    assertEquals(var3.getParent(), var4.getParent());
  }
}
