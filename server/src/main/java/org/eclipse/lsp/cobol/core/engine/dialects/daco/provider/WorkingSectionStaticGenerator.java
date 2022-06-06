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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;

/**
 * Generates static code for WORKING STORAGE SECTION
 */
@UtilityClass
class WorkingSectionStaticGenerator {
  /**
   * Generates static code for WORKING STORAGE SECTION
   * @return a generated code pair where the key is a name and a value is a code
   */
  public Pair<String, String> generate() {
    String content = "      *----------------------------------------------------------------*\n"
        + "      * Belongs at the end of WORKING-STORAGE SECTION\n"
        + "      *----------------------------------------------------------------*\n"
        + "*DACO: 01 LDDCII1M-XII.\n"
        + "*DACO:   03 OPDATOINI-XII PIC X(3) VALUE SPACE.\n"
        + "*DACO:   03 LAYADRINI-BII POINTER.";

    return new ImmutablePair<>("DACO-LDDCII1M", content);
  }
}
