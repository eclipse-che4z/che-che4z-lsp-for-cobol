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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor;

import lombok.experimental.UtilityClass;

/** The constants in this class are used while the processing of COBOL code lines. */
@UtilityClass
public final class ProcessingConstants {
  public static final String CHAR_ASTERISK = "*";
  public static final String CHAR_D_UPPER = "D";
  public static final String CHAR_D_LOWER = "d";
  public static final String CHAR_DOLLAR_SIGN = "$";
  public static final String CHAR_MINUS = "-";
  public static final String CHAR_SLASH = "/";
  public static final String COMMENT_ENTRY_TAG = "*>CE";
  public static final String COMMENT_TAG = "*>";
  public static final String INDICATOR_FIELD = "([\\s*\\-/Dd$]{1})";
  public static final String CONTLINE_INDICATOR_FIELD = "([-]{1})";
  public static final String NEWLINE = "\r\n";
  public static final String WS = " ";
  public static final String CONT_LINE_NO_AREA_A_REGEX = "^(.{6})([-]{1})( ){4}(.*)";
  public static final String BLANK_SEQUENCE_AREA = "      ";
  public static final String CPY_ENTER_TAG = "*>CPYENTER";
  public static final String CPY_EXIT_TAG = NEWLINE + "*>CPYEXIT" + NEWLINE;
}
