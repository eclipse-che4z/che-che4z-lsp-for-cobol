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

package org.eclipse.lsp.cobol.implicitDialects.cics.generator;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;

/**
 * Generates DFHEIBLK data structure
 */
@UtilityClass
public class CICSBulkImplicitVariablesGenerator {

    /**
     * Generates DFHEIBLK data structure
     * @return DFHEIBLK data structure
     */
    public VariableNode generate() {
        // Add DFHEIBLK data structure
      /*
       01 DFHEIBLK.
             02  EIBTIME  COMP-3 PIC S9(7).
             02  EIBDATE  COMP-3 PIC S9(7).
             02  EIBTRNID PIC X(4).
             02  EIBTASKN COMP-3 PIC S9(7).
             02  EIBTRMID PIC X(4).
             02  DFHEIGDI COMP PIC S9(4).
             02  EIBCPOSN COMP PIC S9(4).
             02  EIBCALEN COMP PIC S9(4).
             02  EIBAID   PIC X(1).
             02  EIBFN    PIC X(2).
             02  EIBRCODE PIC X(6).
             02  EIBDS    PIC X(8).
             02  EIBREQID PIC X(8).
             02  EIBRSRCE PIC X(8).
             02  EIBSYNC  PIC X(1).
             02  EIBFREE  PIC X(1).
             02  EIBRECV  PIC X(1).
             02  EIBFIL01 PIC X(1).
             02  EIBATT   PIC X(1).
             02  EIBEOC   PIC X(1).
             02  EIBFMH   PIC X(1).
             02  EIBCOMPL PIC X(1).
             02  EIBSIG   PIC X(1).
             02  EIBCONF  PIC X(1).
             02  EIBERR   PIC X(1).
             02  EIBERRCD PIC X(4).
             02  EIBSYNRB PIC X(1).
             02  EIBNODAT PIC X(1).
             02  EIBRESP  COMP PIC S9(8).
             02  EIBRESP2 COMP PIC S9(8).
             02  EIBRLDBK PIC X(1).
       */

        Locality locality = Locality.builder()
                .uri(ImplicitCodeUtils.createFullUrl("implicit-code-DFHEIBLK"))
                .build();

        VariableNode variable = new GroupItemNode(locality, 1, "DFHEIBLK", false, false, UsageFormat.UNDEFINED);
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBTIME", false, "S9(7)",
                null, UsageFormat.COMP_3, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBDATE", false, "S9(7)",
                null, UsageFormat.COMP_3, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBTRNID", false, "X(4)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBTASKN", false, "S9(7)",
                null, UsageFormat.COMP_3, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBTRMID", false, "X(4)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "DFHEIGDI", false, "S9(4)",
                null, UsageFormat.COMP, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBCPOSN", false, "S9(4)",
                null, UsageFormat.COMP, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBCALEN", false, "S9(4)",
                null, UsageFormat.COMP, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBAID", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBFN", false, "X(2)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBRCODE", false, "X(6)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBDS", false, "X(8)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBREQID", false, "X(8)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBRSRCE", false, "X(8)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBSYNC", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBSYNC", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBFREE", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBRECV", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBFIL01", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBATT", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBEOC", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBFMH", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBCOMPL", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBSIG", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBCONF", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBERR", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBERRCD", false, "X(4)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBSYNRB", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBNODAT", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBRESP", false, "S9(8)",
                null, UsageFormat.COMP, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBRESP2", false, "S9(8)",
                null, UsageFormat.COMP, false, false, false));
        variable.addChild(new ElementaryItemNode(locality, 2, "EIBRLDBK", false, "X(1)",
                null, UsageFormat.UNDEFINED, false, false, false));

        return variable;
    }
}

