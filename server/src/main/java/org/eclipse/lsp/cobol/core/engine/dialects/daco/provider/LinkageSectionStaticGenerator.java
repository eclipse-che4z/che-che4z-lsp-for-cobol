/*
 * Copyright (c) 2022 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;

/**
 * Generates static code for LINKAGE SECTION
 */
@UtilityClass
class LinkageSectionStaticGenerator {

  /**
   * Generates static code for LINKAGE SECTION
   * @return a generated code pair where the key is a name and a value is a code
   */
  public Pair<String, String> generate() {
    String content = "      *----------------------------------------------------------------*\n"
        + "      * Belongs at the end of LINKAGE SECTION\n"
        + "      *----------------------------------------------------------------*\n"
        + "*DACO: 01 KMKIDMdXII.\n"
        + "*DACO: 03 OPDATOdXII PIC X(3) VALUE SPACE.\n"
        + "*DACO: 01 KMKIDMdXII.\n"
        + "*DACO: 03 OPDATOdXII PIC X(3) VALUE SPACE.\n"
        + "*DACO: 03 LAYADR-BII POINTER.\n"
        + "*DACO: 03 OPDKOD-XII PIC X(4) VALUE SPACE.\n"
        + "*DACO: 03 PMONAM-XII PIC X(8) VALUE SPACE.\n"
        + "*DACO: 03 ENTNAM-XII PIC X(16) VALUE SPACE.\n"
        + "*DACO: 03 PMT-XII    PIC X(6) VALUE SPACE.\n"
        + "*DACO: 03 PMTBIN-BII PIC S9(9) VALUE ZERO COMP.\n"
        + "*DACO: 03 RTTKOD-XII VALUE ZERO.\n"
        + "*DACO: 05 RTTSTS-XII PIC X.\n"
        + "*DACO: 05 RTTMESdNII PIC 9(3).";

    return new ImmutablePair<>("DACO-KMKIDMdXII", content);
  }
}
