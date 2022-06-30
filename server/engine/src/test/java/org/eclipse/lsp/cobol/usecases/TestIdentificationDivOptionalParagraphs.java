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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test optional paragraphs in the Identification division. */
public class TestIdentificationDivOptionalParagraphs {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.                                                      \n"
          + "           DB102A.                                                      \n"
          + "       AUTHOR.                                                          \n"
          + "           FEDERAL COMPILER TESTING CENTER.                             \n"
          + "       INSTALLATION.                                                    \n"
          + "           GENERAL SERVICES ADMINISTRATION                              \n"
          + "           AUTOMATED DATA AND TELECOMMUNICATION SERVICE.                \n"
          + "           SOFTWARE DEVELOPMENT OFFICE.                                 \n"
          + "           5203 LEESBURG PIKE  SUITE 1100                               \n"
          + "           FALLS CHURCH VIRGINIA 22041.                                 \n"
          + "                                                                        \n"
          + "           PHONE   (703) 756-6153                                       \n"
          + "                                                                        \n"
          + "           \" HIGH       \".                                              \n"
          + "       DATE-WRITTEN.                                                    ";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
