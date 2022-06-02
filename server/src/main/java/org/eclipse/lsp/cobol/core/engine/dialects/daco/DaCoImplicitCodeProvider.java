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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Multimap;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;

/**
 * Creates DaCo implicit code for future injection
 */
public class DaCoImplicitCodeProvider {

  /**
   * Returns DaCo implicit code for future injection
   * @return multimap object where the key is a section name and a value is a code to inject
   */
  public Multimap<String, Pair<String, String>> getImplicitCode() {
    Multimap<String, Pair<String, String>> implicitCode = LinkedListMultimap.create();
    implicitCode.put("WORKING-STORAGE", getWorkingStorageImplicitCode());
    implicitCode.put("LINKAGE", getLinkageSectionImplicitCode());
    return implicitCode;
  }

  private Pair<String, String> getWorkingStorageImplicitCode() {
    String content = "      *----------------------------------------------------------------*\n"
        + "      * Belongs at the end of WORKING-STORAGE SECTION\n"
        + "      *----------------------------------------------------------------*\n"
        + "*DACO: 01 LDDCII1M-XII.\n"
        + "*DACO:   03 OPDATOINI-XII PIC X(3) VALUE SPACE.\n"
        + "*DACO:   03 LAYADRINI-BII POINTER.";

    return new ImmutablePair<>("DACO-LDDCII1M", content);
  }

  private Pair<String, String> getLinkageSectionImplicitCode() {
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
