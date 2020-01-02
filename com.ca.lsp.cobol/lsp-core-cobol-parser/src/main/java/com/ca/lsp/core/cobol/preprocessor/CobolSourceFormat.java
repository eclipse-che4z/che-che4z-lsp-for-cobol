/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.preprocessor;

import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.INDICATOR_FIELD;

public enum CobolSourceFormat {

    /**
     * Fixed format, standard ANSI / IBM reference. Each line 80 chars.<br>
     * <br>
     * 1-6: sequence area<br>
     * 7: indicator field<br>
     * 8-12: area A<br>
     * 13-72: area B<br>
     * 73-80: comments<br>
     */
    FIXED("^(.{6})" + INDICATOR_FIELD + "(.{0,4})(.{0,61})(.{0,8})", true),

    /**
     * HP Tandem format.<br>
     * <br>
     * 1: indicator field<br>
     * 2-5: optional area A<br>
     * 6-132: optional area B<br>
     */
    TANDEM("()(?:" + INDICATOR_FIELD + "(.{0,4})(.*)())?", false),

    /**
     * Variable format.<br>
     * <br>
     * 1-6: sequence area<br>
     * 7: indicator field<br>
     * 8-12: optional area A<br>
     * 13-*: optional area B<br>
     */
    VARIABLE("(.{0,6})(?:" + INDICATOR_FIELD + "(.{0,4})(.*)())?", true),

    SEQUENCE_AREA("^(.{6})", true);

    private final boolean commentEntryMultiLine;

    private final Pattern pattern;

    private final String regex;

    CobolSourceFormat(final String regex, final boolean commentEntryMultiLine) {
      this.regex = regex;
      pattern = Pattern.compile(regex);
      this.commentEntryMultiLine = commentEntryMultiLine;
    }

    public Pattern getPattern() {
      return pattern;
    }

    public String getRegex() {
      return regex;
    }

    public boolean isCommentEntryMultiLine() {
      return commentEntryMultiLine;
    }
  }