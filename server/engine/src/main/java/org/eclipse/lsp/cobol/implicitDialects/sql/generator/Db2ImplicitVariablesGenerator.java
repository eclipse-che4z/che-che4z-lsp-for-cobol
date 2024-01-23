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
package org.eclipse.lsp.cobol.implicitDialects.sql.generator;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
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
  public List<VariableNode> generateDb2Nodes() {
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

  /**
   * Generates SQLCA data structure for DATACOM
   *
   * @return SQLCA data structure
   */
  public static List<VariableNode> generateDatacomNodes() {
    /*
          01  SQLCA.
                05  SQLCA-EYE-CATCH          PIC X(08).
                05  SQLCAID REDEFINES SQLCA-EYE-CATCH
                                        PIC X(08).
                05  SQLCA-LEN                PIC S9(9) COMP.
                05  SQLCABC REDEFINES SQLCA-LEN
                                        PIC S9(9) COMP.
                05  SQLCA-DB-VRS            PIC X(02).
                05  SQLCA-DB-RLS            PIC X(02).
                05  SQLCA-LUWID             PIC X(08).
                05  SQLCA-SQLCODE           PIC S9(9) COMP.
                05  SQLCA-ERROR-INFO.
                    10  SQLCA-ERR-LEN       PIC S9(4) COMP.
                    10  SQLCA-ERR-MSG       PIC X(80).
                05  SQLERRM REDEFINES SQLCA-ERROR-INFO.
                    10  SQLERRML             PIC S9(4) COMP.
                    10  SQLERRMC             PIC X(70).
                    10  SQLERRMF      PIC X(10).
                05  SQLCA-ERROR-PGM          PIC X(08).
                05  SQLERRP REDEFINES SQLCA-ERROR-PGM
                                        PIC X(08).
                05  SQLCA-FILLER-1           PIC X(02).
                05  SQLCA-ERROR-DATA.
                    10  SQLCA-DSFCODE        PIC X(04).
                    10  SQLCA-INFCODE        PIC S9(9) COMP.
                    10  SQLCA-DBCODE.
                   15  SQLCA-DBCODE-EXT PIC X(02).
                   15  SQLCA-DBCODE-INT PIC S9(4) COMP.
                    10  SQLCA-MISC-CODE1     PIC S9(9) COMP.
                    10  SQLCA-MISC-CODES-B.
                   15  SQLCA-MISC-CODE2 PIC S9(9) COMP.
                   15  SQLCA-MISC-CODE3 PIC S9(9) COMP.
                    10  SQLCA-ERR-INFO-2 REDEFINES
                            SQLCA-MISC-CODES-B.
                   15  SQLCA-SQLSTATE   PIC X(05).
                   15  SQLCA-FILLER-2   PIC X(03).
                05  SQLCA-WRN-AREA.
                    10  SQLCA-WARNING  PIC X OCCURS 8 TIMES.
                05  SQLWARN REDEFINES  SQLCA-WRN-AREA.
                    10  SQLWARN0             PIC X.
                    10  SQLWARN1             PIC X.
                    10  SQLWARN2             PIC X.
                    10  SQLWARN3             PIC X.
                    10  SQLWARN4             PIC X.
                    10  SQLWARN5             PIC X.
                    10  SQLWARN6             PIC X.
                    10  SQLWARN7             PIC X.
                05  SQLCA-PGM-NAME           PIC X(08).
                05  SQLCA-AUTHID             PIC X(18).
                05  SQLCA-PLAN-NAME          PIC X(18).

   */
    VariableNode variable = new GroupItemNode(LOCALITY, 1, "SQLCA", false, false, UsageFormat.UNDEFINED);
    addElement(variable, 5, "SQLCA-EYE-CATCH", "X(8)");
    variable.addChild(new ElementaryItemNode(LOCALITY, 5, "SQLCAID", false, "X(8)",
            null, null, true, false, false));
    variable.addChild(new ElementaryItemNode(LOCALITY, 5, "SQLCA-LEN", false, "S9(9)",
            null, UsageFormat.COMP, false, false, false));
    variable.addChild(new ElementaryItemNode(LOCALITY, 5, "SQLCABC", false, "S9(9)",
            null, UsageFormat.COMP, true, false, false));
    addElement(variable, 5, "SQLCA-DB-VRS", "X(2)");
    addElement(variable, 5, "SQLCA-DB-RLS", "X(2)");
    addElement(variable, 5, "SQLCA-LUWID", "X(8)");
    addElement(variable, 5, "SQLCODE", "S9(9)", UsageFormat.COMP_5);
    variable.addChild(new ElementaryItemNode(LOCALITY, 5, "SQLCA-SQLCODE", false, "S9(9)",
            null, UsageFormat.COMP, false, false, false));

    GroupItemNode sqlErrInfo = new GroupItemNode(LOCALITY, 5, "SQLCA-ERROR-INFO", false, false, UsageFormat.UNDEFINED);
    variable.addChild(sqlErrInfo);
    sqlErrInfo.addChild(new ElementaryItemNode(LOCALITY, 10, "SQLCA-ERR-LEN", false, "S9(4)",
            null, UsageFormat.COMP, false, false, false));
    addElement(sqlErrInfo, 10, "SQLCA-ERR-MSG", "X(80)");


    GroupItemNode sqlErrMsg = new GroupItemNode(LOCALITY, 5, "SQLERRM", false, true, UsageFormat.UNDEFINED);
    sqlErrMsg.addChild(new ElementaryItemNode(LOCALITY, 10, "SQLERRML", false, "S9(4)",
            null, UsageFormat.COMP, false, false, false));
    addElement(sqlErrMsg, 10, "SQLERRMC", "X(70)");
    addElement(sqlErrMsg, 10, "SQLERRMF", "X(10)");
    variable.addChild(sqlErrMsg);

    addElement(variable, 5, "SQLCA-ERROR-PGM", "X(8)");
    variable.addChild(new ElementaryItemNode(LOCALITY, 5, "SQLERRP", false, "X(8)",
            null, null, true, false, false));

    addElement(variable, 5, "SQLCA-FILLER-1", "X(2)");

    GroupItemNode sqlErrData = new GroupItemNode(LOCALITY, 5, "SQLCA-ERROR-DATA", false, false, UsageFormat.UNDEFINED);
    variable.addChild(sqlErrData);
    addElement(sqlErrData, 10, "SQLCA-DSFCODE", "X(4)");
    sqlErrData.addChild(new ElementaryItemNode(LOCALITY, 10, "SQLCA-INFCODE", false, "S9(9)",
            null, UsageFormat.COMP, false, false, false));


    GroupItemNode sqlErrDbCode = new GroupItemNode(LOCALITY, 15, "SQLCA-DBCODE", false, false, UsageFormat.UNDEFINED);
    sqlErrData.addChild(sqlErrDbCode);
    addElement(sqlErrDbCode, 15, "SQLCA-DBCODE-EXT", "X(2)");
    sqlErrDbCode.addChild(new ElementaryItemNode(LOCALITY, 15, "SQLCA-DBCODE-INT", false, "X(8)",
            null, UsageFormat.COMP, false, false, false));

    sqlErrData.addChild(new ElementaryItemNode(LOCALITY, 10, "SQLCA-MISC-CODE1", false, "S9(9)",
            null, UsageFormat.COMP, false, false, false));

    GroupItemNode sqlErrMiscCode2 = new GroupItemNode(LOCALITY, 10, "SQLCA-MISC-CODES-B", false, false, UsageFormat.UNDEFINED);
    sqlErrData.addChild(sqlErrMiscCode2);
    sqlErrMiscCode2.addChild(new ElementaryItemNode(LOCALITY, 10, "SQLCA-MISC-CODE2", false, "S9(9)",
            null, UsageFormat.COMP, false, false, false));
    sqlErrMiscCode2.addChild(new ElementaryItemNode(LOCALITY, 10, "SQLCA-MISC-CODE3", false, "S9(9)",
            null, UsageFormat.COMP, false, false, false));

    GroupItemNode sqlErrMiscCode3 = new GroupItemNode(LOCALITY, 10, "SQLCA-ERR-INFO-2", false, true, UsageFormat.UNDEFINED);
    sqlErrData.addChild(sqlErrMiscCode3);
    addElement(sqlErrMiscCode3, 15, "SQLCA-SQLSTATE", "X(5)");
    addElement(sqlErrMiscCode3, 15, "SQLCA-FILLER-2", "X(3)");

    GroupItemNode sqlWarn = new GroupItemNode(LOCALITY, 5, "SQLCA-WRN-AREA", false, false, UsageFormat.UNDEFINED);
    variable.addChild(sqlWarn);
    sqlWarn.addChild(new TableDataNameNode(LOCALITY, 10, "SQLCA-WARNING", false, false, "X", null, 8, null, false, false));

    GroupItemNode sqlWarn2 = new GroupItemNode(LOCALITY, 5, "SQLWARN REDEFINES", false, true, UsageFormat.UNDEFINED);
    variable.addChild(sqlWarn2);
    addElement(sqlWarn2, 10, "SQLWARN0", "X");
    addElement(sqlWarn2, 10, "SQLWARN1", "X");
    addElement(sqlWarn2, 10, "SQLWARN2", "X");
    addElement(sqlWarn2, 10, "SQLWARN3", "X");
    addElement(sqlWarn2, 10, "SQLWARN4", "X");
    addElement(sqlWarn2, 10, "SQLWARN5", "X");
    addElement(sqlWarn2, 10, "SQLWARN6", "X");
    addElement(sqlWarn2, 10, "SQLWARN7", "X");

    addElement(variable, 5, "SQLCA-PGM-NAME", "X(8)");
    addElement(variable, 5, "SQLCA-AUTHID", "X(18)");
    addElement(variable, 5, "SQLCA-PLAN-NAME", "X(18)");
    return Collections.singletonList(variable);
  }
}
