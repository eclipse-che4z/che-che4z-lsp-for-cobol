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
package org.eclipse.lsp.cobol.core.model.tree.logic.implicit;

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
class SRImplicitVariablesGenerator {

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

    addCicsImplicitVariable(result, locality);
    return result;
  }

  /*  CICS Translate introduced variables
    01   dfhb0040  comp-5 pic s9(8) is global.
    01   dfhb0041  comp-5 pic s9(8) is global.
    01   dfhb0042  comp-5 pic s9(8) is global.
    01   dfhb0043  comp-5 pic s9(8) is global.
    01   dfhb0044  comp-5 pic s9(8) is global.
    01   dfhb0045  comp-5 pic s9(8) is global.
    01   dfhb0046  comp-5 pic s9(8) is global.
    01   dfhb0047  comp-5 pic s9(8) is global.
    01   dfhb0048  comp-5 pic s9(8) is global.
    01   dfhb0049  comp-5 pic s9(8) is global.
    01   dfhb004A  comp-5 pic s9(8) is global.
    01   dfhb004B  comp-5 pic s9(8) is global.
    01   dfhb004C  comp-5 pic s9(8) is global.
    01   dfhb004D  comp-5 pic s9(8) is global.
    01   dfhb0020  comp-5 pic s9(4) is global.
    01   dfhb0021  comp-5 pic s9(4) is global.
    01   dfhb0022  comp-5 pic s9(4) is global.
    01   dfhb0023  comp-5 pic s9(4) is global.
    01   dfhb0024  comp-5 pic s9(4) is global.
    01   dfhb0025  comp-5 pic s9(4) is global.
    01   dfhc0040  pic x(4) is global.
    01   dfhc0041  pic x(4) is global.
    01   dfhc0042  pic x(4) is global.
    01   dfhc0043  pic x(4) is global.
    01   dfhc0044  pic x(4) is global.
    01   dfhc0520  pic x(52) is global.
    01   dfhc0360  pic x(36) is global.
    01   dfhc0080  pic x(8) is global.
    01   dfhc0081  pic x(8) is global.
    01   dfhc0082  pic x(8) is global.
    01   dfhc0083  pic x(8) is global.
    01   dfhc0084  pic x(8) is global.
    01   dfhc0085  pic x(8) is global.
    01   dfhc0160  pic x(16) is global.
    01   dfhc0161  pic x(16) is global.
    01   dfhc0162  pic x(16) is global.
    01   dfhc0163  pic x(16) is global.
    01   dfhc0164  pic x(16) is global.
    01   dfhc0165  pic x(16) is global.
    01   dfhc0166  pic x(16) is global.
    01   dfhc0167  pic x(16) is global.
    01   dfhc0168  pic x(16) is global.
    01   dfhc0020  pic x(2) is global.
    01   dfhc0021  pic x(2) is global.
    01   dfhc0022  pic x(2) is global.
    01   dfhc0023  pic x(2) is global.
    01   dfhc0640  pic x(64) is global.
    01   dfhc0641  pic x(64) is global.
    01   dfhc0642  pic x(64) is global.
    01   dfhd0040  comp-3 pic s9(7) is global.
    01   dfhc0480  pic x(48) is global.
    01   dfhc0320  pic x(32) is global.
    01   dfhc0400  pic x(40) is global.
    01   dfhc0010  pic x(1) is global.
    01   dfhc0011  pic x(1) is global.
    01   dfhc2550  pic x(255) is global.
    01   dfhc2551  pic x(255) is global.
    01   dfhc2552  pic x(255) is global.
    01   dfhc2553  pic x(255) is global.
    01   dfhc0060  pic x(6) is global.
    01   dfhc0120  pic x(12) is global.
    01   dfhc2460  pic x(246) is global.
    01   dfhc0070  pic x(7) is global.
    01   dfhc0071  pic x(7) is global.
    01   dfhc0650  pic x(65) is global.
    01   dfhc0030  pic x(3) is global.
    01   dfhc0560  pic x(56) is global.
    01   dfhdummy comp pic s9(4) value zero is global.
    01   dfheiv0  pic x(77) is global.
    */
  private void addCicsImplicitVariable(List<VariableNode> result, Locality locality) {
    result.add(new ElementaryItemNode(locality, 1, "dfhldver", true, "x(22)",
            "ld table dfheitab 720.", UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfheid0", true, "s9(7)",
            "zero", UsageFormat.COMP_3, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfheicb", true, "x(8)",
            "        ", UsageFormat.COMP_3, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0040", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0041", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0042", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0043", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0044", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0045", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0046", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0047", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0048", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0049", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb004A", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb004B", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb004C", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb004D", true, "s9(8)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0020", true, "s9(4)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0021", true, "s9(4)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0022", true, "s9(4)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0023", true, "s9(4)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0024", true, "s9(4)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhb0025", true, "s9(4)",
            null, UsageFormat.COMP_5, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0040", true, "x(4)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0041", true, "x(4)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0042", true, "x(4)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0043", true, "x(4)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0044", true, "x(4)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0520", true, "x(52)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0360", true, "x(36)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0080", true, "x(8)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0081", true, "x(8)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0082", true, "x(8)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0083", true, "x(8)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0084", true, "x(8)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0085", true, "x(8)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0160", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0161", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0162", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0163", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0164", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0165", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0166", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0167", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0168", true, "x(16)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0020", true, "x(2)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0021", true, "x(2)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0022", true, "x(2)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0023", true, "x(2)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0640", true, "x(64)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0641", true, "x(64)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0642", true, "x(64)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhd0040", true, "s9(7)",
            null, UsageFormat.COMP_3, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0480", true, "x(48)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0320", true, "x(32)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0400", true, "x(40)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0010", true, "x(1)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0011", true, "x(1)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc2550", true, "x(255)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc2551", true, "x(255)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc2552", true, "x(255)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc2553", true, "x(255)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0060", true, "x(6)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0120", true, "x(12)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc2460", true, "x(246)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0070", true, "x(7)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0071", true, "x(7)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0650", true, "x(65)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0030", true, "x(3)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhc0560", true, "x(56)",
            null, UsageFormat.UNDEFINED, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfhdummy", true, "s9(4)",
            null, UsageFormat.COMP, false, false, false));
    result.add(new ElementaryItemNode(locality, 1, "dfheiv0", true, "x(77)",
            null, UsageFormat.UNDEFINED, false, false, false));
  }
}
