/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor;

import lombok.experimental.UtilityClass;

/** The constants in this class used while the processing of COBOL code lines. */
@UtilityClass
public final class ProcessingConstants {
  public static final String COMMENT_TAG = "*>";
  public static final String NEWLINE = "\n";
  public static final String WS = " ";
  public static final String BLANK_SEQUENCE_AREA = "      ";
  public static final String CPY_ENTER_TAG = " *>CPYENTER<URI>";
  public static final String CPY_URI_CLOSE = "</URI>";
  public static final String CPY_EXIT_TAG = NEWLINE + "*>CPYEXIT" + NEWLINE;
  public static final String MAID_WRK_QUALIFIER = "WRK";
  public static final String FILLER_VARIABLE_NAME = "FILLER";
  public static final int START_INDEX_AREA_B = 11;
  public static final int INDICATOR_AREA = 7;
}
