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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;

import java.util.List;

/**
 * Generates static code for WORKING STORAGE SECTION
 */
@UtilityClass
class WorkingSectionStaticGenerator {
  /**
   * Generates static code for WORKING STORAGE SECTION
   * @return a generated code pair where the key is a name and a value is a code
   */
  public List<VariableNode> generate() {
//          "      *----------------------------------------------------------------*\n"
//        + "      * Belongs at the end of WORKING-STORAGE SECTION\n"
//        + "      *----------------------------------------------------------------*\n"
//        + "*DACO: 01 LDDCII1M-XII.\n"
//        + "*DACO:   03 OPDATOINI-XII PIC X(3) VALUE SPACE.\n"
//        + "*DACO:   03 LAYADRINI-BII POINTER.\n"
//        + "*DACO: 01  USWzXSH.                                                             \n"
//        + "*DACO:     03 USIzXSH                  PIC X(16).                               \n"
//        + "*DACO:     03 USMzXSH                  PIC X(6).                                \n"
//        + "*DACO:     03 USLzBSH                  PIC S9(8)               COMP.            \n"
//        + "*DACO:*    *  usb = user-string begin.                                          \n"
//        + "*DACO:     03 USB-BSH                  PIC S9(8)               COMP.            \n"
//        + "*DACO:*    *  use = user-string end.                                            \n"
//        + "*DACO:     03 USE-BSH                  PIC S9(8)               COMP.            \n"
//        + "*DACO:*    *  csf = current-string format                                       \n"
//        + "*DACO:     03 CSF-XSH                  PIC X.                                   \n"
//        + "*DACO:*    *  csv = current-string value.                                       \n"
//        + "*DACO:     03 CSV-XSH                  PIC X(64).                               \n"
//        + "*DACO:     03 CSV-NSH                  PIC 9(16).                               \n"
//        + "*DACO:*    *  csl = current-string length.                                      \n"
//        + "*DACO:     03 CSL-BSH                  PIC S9(8)               COMP.            \n"
//        + "*DACO:     03 NSVzXSH                  PIC X(64).                               \n"
//        + "*DACO:     03 NSL-BSH                  PIC S9(8)               COMP.            \n"
//        + "*DACO:     03 FILLER                   PIC X(325).   \n";

    GroupItemNode lddc = GeneratorHelper.createGroupNode(1, "LDDCII1M-XII");
    lddc.addChild(GeneratorHelper.createElementaryNode(3, "OPDATOINI-XII", "X(3)", "SPACE", UsageFormat.UNDEFINED));
    lddc.addChild(GeneratorHelper.createElementaryNode(3, "LAYADRINI-BII", null, null, UsageFormat.POINTER));

    GroupItemNode usw = GeneratorHelper.createGroupNode(1, "USWzXSH");
    usw.addChild(GeneratorHelper.createElementaryNode(3, "USIzXSH", "X(16)", null, UsageFormat.UNDEFINED));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "USMzXSH", "X(6)", null, UsageFormat.UNDEFINED));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "USLzBSH", "S9(8)", null, UsageFormat.COMP));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "USB-BSH", "S9(8)", null, UsageFormat.COMP));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "USE-BSH", "S9(8)", null, UsageFormat.UNDEFINED));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "CSF-XSH", "X", null, UsageFormat.UNDEFINED));

    usw.addChild(GeneratorHelper.createElementaryNode(3, "CSV-XSH", "X(64)", null, UsageFormat.UNDEFINED));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "CSV-NSH", "9(16)", null, UsageFormat.UNDEFINED));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "CSL-BSH", "S9(8)", null, UsageFormat.COMP));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "NSVzXSH", "X(64)", null, UsageFormat.UNDEFINED));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "NSL-BSH", "S9(8)", null, UsageFormat.COMP));
    usw.addChild(GeneratorHelper.createElementaryNode(3, "FILLER", "X(325)", null, UsageFormat.UNDEFINED));

    return ImmutableList.of(lddc, usw);
  }
}
