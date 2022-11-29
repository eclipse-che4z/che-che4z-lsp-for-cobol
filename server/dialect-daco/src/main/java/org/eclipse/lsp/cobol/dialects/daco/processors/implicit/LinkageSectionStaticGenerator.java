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
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;

import java.util.List;

/**
 * Generates static code for LINKAGE SECTION
 */
@UtilityClass
class LinkageSectionStaticGenerator {

  public static final String SPACE_VALUE = "SPACE";

  /**
   * Generates static code for LINKAGE SECTION
   * @return a generated code pair where the key is a name and a value is a code
   */
  public List<VariableNode> generate() {
    /*
    Code illustration:
                *----------------------------------------------------------------*
                * Belongs at the end of LINKAGE SECTION
                *----------------------------------------------------------------*
          *DACO: 01 KMKIDMdXII.
          *DACO: 03 OPDATOdXII PIC X(3) VALUE SPACE.
          *DACO: 03 LAYADR-BII POINTER.
          *DACO: 03 OPDKOD-XII PIC X(4) VALUE SPACE.
          *DACO: 03 PMONAM-XII PIC X(8) VALUE SPACE.
          *DACO: 03 ENTNAM-XII PIC X(16) VALUE SPACE.
          *DACO: 03 PMT-XII    PIC X(6) VALUE SPACE.
          *DACO: 03 PMTBIN-BII PIC S9(9) VALUE ZERO COMP.
          *DACO: 03 RTTKOD-XII VALUE ZERO.
          *DACO: 05 RTTSTS-XII PIC X.
          *DACO: 05 RTTMESdNII PIC 9(3).
    */
    GroupItemNode kmkid = GeneratorHelper.createGroupNode(1, "KMKIDMdXII");
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "OPDATOdXII", "X(3)", SPACE_VALUE, UsageFormat.UNDEFINED));
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "LAYADR-BII", null, null, UsageFormat.POINTER));
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "OPDKOD-XII", "X(4)", SPACE_VALUE, UsageFormat.UNDEFINED));
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "PMONAM-XII", "X(8)", SPACE_VALUE, UsageFormat.UNDEFINED));
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "ENTNAM-XII", "X(16)", SPACE_VALUE, UsageFormat.UNDEFINED));
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "PMT-XII", "X(6)", SPACE_VALUE, UsageFormat.UNDEFINED));
    kmkid.addChild(GeneratorHelper.createElementaryNode(3, "PMTBIN-BII", "S9(9)", "ZERO", UsageFormat.COMP));

    ElementaryItemNode rtt = GeneratorHelper.createElementaryNode(3, "RTTKOD-XII", null, "ZERO", UsageFormat.UNDEFINED);
    rtt.addChild(GeneratorHelper.createElementaryNode(5, "RTTSTS-XII", "X", null, UsageFormat.UNDEFINED));
    rtt.addChild(GeneratorHelper.createElementaryNode(5, "RTTMESdNII", "9(3)", null, UsageFormat.UNDEFINED));

    kmkid.addChild(rtt);
    return ImmutableList.of(kmkid);
  }
}
