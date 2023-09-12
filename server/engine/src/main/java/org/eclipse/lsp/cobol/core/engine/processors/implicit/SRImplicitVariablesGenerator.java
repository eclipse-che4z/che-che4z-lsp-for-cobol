/*
 * Copyright (c) 2022 Broadcom.
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

import java.util.LinkedList;
import java.util.List;

/**
 * Generates SPECIAL REGISTERS data structure
 */
@UtilityClass
public class SRImplicitVariablesGenerator {

  /**
   * Generates SPECIAL REGISTERS data structure
   * @return SPECIAL REGISTERS data structure
   */
  public List<VariableNode> generate() {
    /*
     01 DEBUG-ITEM.
     02 DEBUG-LINE PIC X(6).
     02 FILLER PIC X VALUE SPACE.
     02 DEBUG-NAME PIC X(30).
     02 FILLER PIC X VALUE SPACE.
     02 DEBUG-SUB-1  PIC S9999  SIGN IS
     LEADING SEPARATE CHARACTER.
     02 FILLER PIC X VALUE SPACE.
     02 DEBUG-SUB-2  PIC S9999  SIGN IS
     LEADING SEPARATE CHARACTER.
     02 FILLER PIC X.
     02 DEBUG-SUB-3  PIC S9999  SIGN IS
     LEADING SEPARATE CHARACTER.
     02 FILLER PIC X VALUE SPACE.
     02 DEBUG-CONTENTS PIC X(999).
     01 JNIENVPTR  POINTER.
     01 JSON-CODE PIC S9(9) BINARY.
     01 JSON-STATUS PIC S9(9) BINARY.
     01 XML-INFORMATION PIC S9(9) BINARY.
     01 XML-NAMESPACE PIC S9(9) BINARY.
     01 XML-NNAMESPACE PIC S9(9) BINARY.
     01 XML-NAMESPACE-PREFIX PIC S9(9) BINARY.
     01 XML-NNAMESPACE-PREFIX PIC S9(9) BINARY.
     01 XML-CODE PIC S9(9) BINARY.
     01 XML-TEXT DISPLAY PIC X(30) VALUE SPACE.
     01 XML-NTEXT DISPLAY PIC X(30) VALUE SPACE.
     01 XML-EVENT USAGE DISPLAY PICTURE X(30) VALUE SPACE.
     01 LINE-COUNTER PIC S9(9) COMP SYNC.
     01 PAGE-COUNTER PIC S9(9) COMP SYNC.
     01 RETURN-CODE GLOBAL PIC S9(4) BINARY.
     01 SHIFT-OUT GLOBAL PIC X(1) DISPLAY VALUE X"0E".
     01 SHIFT-IN GLOBAL PIC X(1) DISPLAY VALUE X"0F".
     01 SORT-CONTROL GLOBAL PIC X(8) DISPLAY VALUE X"IGZSRTCD".
     01 SORT-CORE-SIZE GLOBAL PIC S9(8) BINARY VALUE X"ZERO".
     01 SORT-FILE-SIZE GLOBAL PIC S9(8) BINARY VALUE X"ZERO".
     01 SORT-MESSAGE GLOBAL PIC X(8) DISPLAY VALUE X"SYSOUT".
     01 SORT-MODE-SIZE GLOBAL PIC S9(5) USAGE BINARY VALUE ZERO.
     01 SORT-RETURN GLOBAL PIC S9(4) USAGE BINARY VALUE ZERO.
     01 TALLY GLOBAL PIC 9(5) USAGE BINARY VALUE ZERO.
     01 WHEN-COMPILED GLOBAL PIC X(16) USAGE DISPLAY.
     01 DAY PIC 9(7).
     01 DATE PIC 9(8).
     01 DAY-OF-WEEK PIC 9(1).
     01 TIME PIC 9(8).
     */

    List<VariableNode> result = new LinkedList<>();
    Locality locality = Locality.builder()
        .uri(ImplicitCodeUtils.createFullUrl("implicit-code-SPECIALREGISTERS"))
        .build();

    VariableNode variable = new GroupItemNode(locality, 1, "DEBUG-ITEM", false, false, UsageFormat.UNDEFINED);

    variable.addChild(new ElementaryItemNode(locality, 2, "DEBUG-LINE", false, "X(6)",
        null, UsageFormat.UNDEFINED, false, false, false));
    variable.addChild(new ElementaryItemNode(locality, 2, "FILLER", false, "X",
        "SPACE", UsageFormat.UNDEFINED, false, false, false));
    variable.addChild(new ElementaryItemNode(locality, 2, "DEBUG-NAME", false, "X(30)",
        null, UsageFormat.UNDEFINED, false, false, false));
    variable.addChild(new ElementaryItemNode(locality, 2, "FILLER", false, "X",
        "SPACE", UsageFormat.UNDEFINED, false, false, false));

    //TODO: what is "IS LEADING SEPARATE CHARACTER"?
    variable.addChild(new ElementaryItemNode(locality, 2, "DEBUG-SUB-1", false, "S9999",
        null, UsageFormat.UNDEFINED, false, false, true));
    variable.addChild(new ElementaryItemNode(locality, 2, "FILLER", false, "X",
        "SPACE", UsageFormat.UNDEFINED, false, false, false));

    //TODO: what is "IS LEADING SEPARATE CHARACTER"?
    variable.addChild(new ElementaryItemNode(locality, 2, "DEBUG-SUB-2", false, "S9999",
        null, UsageFormat.UNDEFINED, false, false, true));
    variable.addChild(new ElementaryItemNode(locality, 2, "FILLER", false, "X",
        null, UsageFormat.UNDEFINED, false, false, false));

    //TODO: what is "IS LEADING SEPARATE CHARACTER"?
    variable.addChild(new ElementaryItemNode(locality, 2, "DEBUG-SUB-3", false, "S9999",
        null, UsageFormat.UNDEFINED, false, false, true));
    variable.addChild(new ElementaryItemNode(locality, 2, "FILLER", false, "X",
        "SPACE", UsageFormat.UNDEFINED, false, false, false));

    variable.addChild(new ElementaryItemNode(locality, 2, "DEBUG-CONTENTS", false, "X(999)",
        null, UsageFormat.UNDEFINED, false, false, false));

    result.add(variable);
    result.add(new ElementaryItemNode(locality, 1, "JNIENVPTR", false, null,
            null, UsageFormat.POINTER, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "JSON-CODE", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "JSON-STATUS", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-INFORMATION", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-NAMESPACE", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-NNAMESPACE", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-NAMESPACE-PREFIX", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-NNAMESPACE-PREFIX", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-CODE", false, "S9(9)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-TEXT", false, "X(30)",
        "SPACE", UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-NTEXT", false, "X(30)",
        "SPACE", UsageFormat.DISPLAY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "XML-EVENT", false, "X(30)",
        "SPACE", UsageFormat.DISPLAY, false, false, false));

    //TODO: COMP SYNC?, false
    result.add(new ElementaryItemNode(locality, 1, "LINE-COUNTER", false, "S9(9)",
        null, UsageFormat.COMP, false, false, false));
    //TODO: COMP SYNC?
    result.add(new ElementaryItemNode(locality, 1, "PAGE-COUNTER", false, "S9(9)",
        null, UsageFormat.COMP, false, false, false));

    result.add(new ElementaryItemNode(locality, 1, "RETURN-CODE", true, "S9(4)",
        null, UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SHIFT-OUT", true, "X(1)",
        "X\"0E\"", UsageFormat.DISPLAY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SHIFT-IN", true, "X(1)",
        "X\"0F\"", UsageFormat.DISPLAY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SORT-CONTROL", true, "X(8)",
        "X\"IGZSRTCD\"", UsageFormat.DISPLAY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SORT-CORE-SIZE", true, "S9(8)",
        "X\"ZERO\"", UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SORT-FILE-SIZE", true, "S9(8)",
        "X\"ZERO\"", UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SORT-MESSAGE", true, "X(8)",
        "X\"SYSOUT\"", UsageFormat.DISPLAY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SORT-MODE-SIZE", true, "S9(5)",
        "ZERO", UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "SORT-RETURN", true, "S9(4)",
        "ZERO", UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "TALLY", true, "9(5)",
        "ZERO", UsageFormat.BINARY, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "WHEN-COMPILED", true, "X(16)",
        "ZERO", UsageFormat.DISPLAY, false, false, false));

    result.add(new ElementaryItemNode(locality, 1, "DAY", false, "9(7)",
        null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "DATE", false, "9(8)",
        null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "DAY-OF-WEEK", false, "9(1)",
        null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "TIME", false, "9(8)",
        null, UsageFormat.UNDEFINED, false, false, false));
    return result;
  }

}
