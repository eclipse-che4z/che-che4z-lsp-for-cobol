/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.processors.implicit;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;

import java.util.Collections;
import java.util.List;

/**
 * Generates SQLCA data structure for DB2
 */
@UtilityClass
public class Db2ImplicitVariablesGenerator {
  static final Locality LOCALITY = Locality.builder()
          .uri(ImplicitCodeUtils.createFullUrl("implicit-code-SQLCA_DB2"))
          .build();

  /**
   * Generates SQLCA data structure for DB2
   *
   * @return SQLCA data structure
   */
  public List<VariableNode> generate() {
  /*
        01 SQLCA.
                05 SQLCAID      PIC X(8).
                05 SQLCABC      PIC S9(9) COMP-5.
                05 SQLCODE      PIC S9(9) COMP-5.
                05 SQLERRM.
                49 SQLERRML  PIC S9(4) COMP-5.
                49 SQLERRMC  PIC X(70).
                05 SQLERRP      PIC X(8).
                05 SQLERRD      OCCURS 6 TIMES
                                PIC S9(9) COMP-5.
                05 SQLWARN.
                10 SQLWARN0  PIC X.
                10 SQLWARN1  PIC X.
                10 SQLWARN2  PIC X.
                10 SQLWARN3  PIC X.
                10 SQLWARN4  PIC X.
                10 SQLWARN5  PIC X.
                10 SQLWARN6  PIC X.
                10 SQLWARN7  PIC X.
                05 SQLEXT.
                10 SQLWARN8  PIC X.
                10 SQLWARN9  PIC X.
                10 SQLWARNA  PIC X.
                10 SQLSTATE  PIC X(5).
   */
    VariableNode variable = new GroupItemNode(LOCALITY, 1, "SQLCA", false, false, UsageFormat.UNDEFINED);
    addElement(variable, 5, "SQLCAID", "X(8)");
    addElement(variable, 5, "SQLCABC", "S9(9)", UsageFormat.COMP_5);
    addElement(variable, 5, "SQLCODE", "S9(9)", UsageFormat.COMP_5);
    GroupItemNode sqlerrm = new GroupItemNode(LOCALITY, 5, "SQLERRM", false, false, UsageFormat.UNDEFINED);
    variable.addChild(sqlerrm);
    addElement(sqlerrm, 49, "SQLERRML", "S9(4)", UsageFormat.COMP_5);
    addElement(sqlerrm, 49, "SQLERRMC", "X(70)");
    addElement(variable, 5, "SQLERRP", "X(8)");
    addElement(variable, 5, "SQLERRD", "S9(9)", UsageFormat.COMP_5);
    GroupItemNode sqlwarn = new GroupItemNode(LOCALITY, 5, "SQLWARN", false, false, UsageFormat.UNDEFINED);
    variable.addChild(sqlwarn);

    addElement(sqlwarn, 10, "SQLWARN0", "X");
    addElement(sqlwarn, 10, "SQLWARN1", "X");
    addElement(sqlwarn, 10, "SQLWARN2", "X");
    addElement(sqlwarn, 10, "SQLWARN3", "X");
    addElement(sqlwarn, 10, "SQLWARN4", "X");
    addElement(sqlwarn, 10, "SQLWARN5", "X");
    addElement(sqlwarn, 10, "SQLWARN6", "X");
    addElement(sqlwarn, 10, "SQLWARN7", "X");

    GroupItemNode sqlext = new GroupItemNode(LOCALITY, 5, "SQLEXT", false, false, UsageFormat.UNDEFINED);
    variable.addChild(sqlext);
    addElement(sqlext, 10, "SQLWARN8", "X");
    addElement(sqlext, 10, "SQLWARN9", "X");
    addElement(sqlext, 10, "SQLWARNA", "X");
    addElement(sqlext, 10, "SQLSTATE", "X(5)");

    return Collections.singletonList(variable);

  }

  private static void addElement(VariableNode parent, int level, String name, String pic) {
    addElement(parent, level, name, pic, UsageFormat.UNDEFINED);
  }

  private static void addElement(VariableNode parent, int level, String name, String pic, UsageFormat usageFormat) {
    parent.addChild(new ElementaryItemNode(LOCALITY, level, name, false, pic,
            null, usageFormat, false, false, false));
  }
}
