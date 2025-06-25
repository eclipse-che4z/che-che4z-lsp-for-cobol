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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import static java.lang.String.format;

import com.google.common.collect.ImmutableList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;

/**
 * ENUM class for different search patterns in replace clauses. Also, decides the matching pattern
 * based on the search pattern
 */
public enum SearchPattern {
  STARTS_WITH {
    @Override
    public String apply(String trim, CobolLanguageId languageId) {
      return WORD_BOUNDARY + adjustSpaces(escapeSpecialCharacters(trim));
    }
  },
  ENDS_WITH {
    @Override
    public String apply(String trim, CobolLanguageId languageId) {
      return adjustSpaces(escapeSpecialCharacters(trim)) + WORD_BOUNDARY;
    }
  },
  EXACT {
    @Override
    public String apply(String trim, CobolLanguageId languageId) {
      if (isEnclosedWithinValidSeparator(trim)) {
        return getPatternWithinEnclosedSeparator(trim);
      }
      if (isQuotedString(trim)) {
        return getPatternForQuotedString(trim, languageId);
      }
      return format(SEPARATE_TOKEN_PATTERN, adjustSpaces(escapeSpecialCharacters(trim)));
    }

    private String getPatternForQuotedString(String trim, CobolLanguageId languageId) {
      Matcher matcher = NEW_LINE_PATTERN.matcher(trim);
      CobolProgramLayout layout = languageId.getLayout();
      int avoidCharLength = layout.getIndicatorLength() + layout.getSequenceLength();
      String regex = String.format("( *)(?:(\\n.{%d})? ?)+", avoidCharLength);
      if (matcher.find()) {
        String[] split = trim.split(NEW_LINE_PATTERN.pattern());
        return Arrays.stream(split)
            .map(String::trim)
            .filter(sd -> !StringUtils.isEmpty(sd))
            .collect(Collectors.joining(regex));
      }
      return Pattern.quote(trim);
    }

    private String getPatternWithinEnclosedSeparator(String trim) {
      trim = trim.substring(1);
      trim = trim.substring(0, trim.length() - 1);
      return "[;\\(:,]\\s*" + escapeSpecialCharacters(trim) + "\\s*[;\\):,]";
    }

    private boolean isEnclosedWithinValidSeparator(String input) {
      for (Pattern pattern : COBOL_REPLACE_PATTERN_SEPARATORS) {
        if (pattern.matcher(input).matches()) {
          return true;
        }
      }
      return false;
    }
  };

  private static String adjustSpaces(String escapeSpecialCharacters) {
    return String.join("\\s+", escapeSpecialCharacters.split("[\\r\\n]*\\s+"));
  }

  private static boolean isQuotedString(String text) {
    return text.length() > 2
        && (text.startsWith("\"") && text.endsWith("\"")
            || (text.startsWith("'") && text.endsWith("'")));
  }

  // below regex matches cobol separator
  // Space {b},
  // Period {.b},
  // Comma {,b},
  // Semicolon {;b},
  // Parentheses { ( } ... {  //NOSONAR
  // ) }, Colon { : }  //NOSONAR
  // Ref - https://www.ibm.com/support/knowledgecenter/SS6SG3_6.2.0/lr/ref/rllanrul.html
  private static final Pattern NEW_LINE_PATTERN = Pattern.compile("[\\r\\n]");
  public static final String SEPARATE_TOKEN_PATTERN = "(?<=^|[.,;]?\\s)%s(?=[,;]?\\s|\\.|$)";
  // Patterns for the enclosures
  private static final Pattern[] COBOL_REPLACE_PATTERN_SEPARATORS = {
    Pattern.compile("^;.+;$"),
    Pattern.compile("^\\(.+\\)$"),
    Pattern.compile("^:.+:$"),
    Pattern.compile("^,.+,$")
  };
  private static final String WORD_BOUNDARY = "\\b";
  private static final List<String> META_CHARACTERS =
      ImmutableList.of(
          "\\", "^", "$", "{", "}", "[", "]", "(", ")", ".", "*", "+", "?", "|", "<", ">", "-", "&",
          "%");

  private static String escapeSpecialCharacters(String trim) {
    return Arrays.stream(trim.split(""))
        .map(
            c -> {
              if (META_CHARACTERS.contains(c)) return "\\" + c;
              else return c;
            })
        .collect(Collectors.joining());
  }

  /**
   * Returns the matching pattern based on the searchPattern ENUM. Matching pattern takes into
   * consideration separators defined in IBM doc, Ref -
   * https://www.ibm.com/support/knowledgecenter/SS6SG3_6.2.0/lr/ref/rllanrul.html
   *
   * @param text Input text
   * @param languageId
   * @return string
   */
  public abstract String apply(String text, CobolLanguageId languageId);
}
