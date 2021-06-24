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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import com.google.common.base.Splitter;
import com.google.inject.Singleton;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.lang.String.format;
import static java.util.regex.Matcher.quoteReplacement;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.END_INDEX_AREA_B;

/**
 * This service applies replacing for given text by replace clauses and tokens. It may work with
 * REPLACING and REPLACE statements.
 */
@Singleton
@Slf4j
public class ReplacingServiceImpl implements ReplacingService {

  /**
   * Look-before and look-ahead pattern to check that the token wrapped with separators, i.e.
   * whitespaces, dots ot line breaks. Not includes separators to the found substring.
   */
  private static final String SEPARATE_TOKEN_PATTERN = "(?<=[\\.\\s\\r\\n])%s(?=[\\.\\s\\r\\n])";

  private static final Pattern LEAD_OR_TRAIL_CLAUSE =
      Pattern.compile("\\s*(LEADING|TRAILING).*", Pattern.CASE_INSENSITIVE);

  private static final Pattern FUNCTION_IDENTIFIER =
      Pattern.compile("\\s*function\\s+\\w+\\([^)]*+\\)", Pattern.CASE_INSENSITIVE);

  private static final Pattern PSEUDO_TEXT_PATTERN = Pattern.compile("(?s)(?i)(.*?)\\s+BY\\s+(.*)");
  private static final String EMPTY_PSEUDO_TEXT = "====";

  private static final String ERROR_REPLACING = "Error replacing on text: %s with the pattern: %s";
  private static final int INDIVIDUAL_WORD_VALID_LENGTH = 322;

  @NonNull
  @Override
  public String applyReplacing(
      @NonNull String text, @NonNull List<Pair<String, String>> replacePatterns) {
    return replacePatterns.stream().reduce(text, this::replace, (str1, str2) -> str2);
  }

  @NonNull
  @Override
  public ResultWithErrors<Pair<String, String>> retrievePseudoTextReplacingPattern(
      @NonNull String clause) {
    ProcessedSearchClause processedSearchClause = getProcessedSearchClause(clause);
    String[] pattern = retrievePattern(processedSearchClause.clause);
    List<SyntaxError> errors = new ArrayList<>();

    String leftAttribute = "";
    String rightAttribute = "";
    if (isPatternCorrect(pattern)) {
      String extractPseudoText1 = extractPseudoText(pattern[0], true);
      leftAttribute =
          processedSearchClause.getSearchPattern().apply(extractPseudoText1).replace(" ", " +");

      rightAttribute = extractPseudoText(pattern[1], false);
      checkInvalidWordUsage(errors, new String[] {extractPseudoText1, rightAttribute});
      checkInvalidTextWordLength(errors, new String[] {extractPseudoText1, rightAttribute});
    }
    Pair<String, String> replacePattern = Pair.of(leftAttribute, rightAttribute);

    return new ResultWithErrors<>(replacePattern, errors);
  }

  private void checkInvalidTextWordLength(List<SyntaxError> errors, String[] attributes) {
    boolean isInvalidLength =
        logicAccumulator(
            checkIndividualTextWordLength(ReplacingServiceImpl.INDIVIDUAL_WORD_VALID_LENGTH),
            Boolean::logicalOr,
            attributes);
    if (isInvalidLength)
      errors.add(
          SyntaxError.syntaxError()
              .severity(ErrorSeverity.ERROR)
              .suggestion("ReplacingServiceImpl.pseudoTxtInvalidLength")
              .build());
  }

  private <T> Boolean logicAccumulator(
      Function<T, Boolean> func, BinaryOperator<Boolean> operator, T[] attributes) {
    return Arrays.stream(attributes).map(func).reduce(operator).orElse(false);
  }

  private Function<String, Boolean> checkIndividualTextWordLength(int validLength) {
    return rightAttribute ->
        Arrays.stream(rightAttribute.split("\b")).anyMatch(c -> c.length() > validLength);
  }

  private void checkInvalidWordUsage(List<SyntaxError> errors, String[] attributes) {
    boolean isInvalidWordPresent =
        logicAccumulator(checkContainWord("copy"), Boolean::logicalOr, attributes);

    if (isInvalidWordPresent) {
      errors.add(
          SyntaxError.syntaxError()
              .severity(ErrorSeverity.ERROR)
              .suggestion("ReplacingServiceImpl.invalidWord")
              .build());
    }
  }

  @NonNull
  @Override
  public Pair<String, String> retrieveTokenReplacingPattern(@NonNull String clause) {
    String[] pattern = retrievePattern(clause);
    return isPatternCorrect(pattern)
        ? Pair.of(getPatternForFullTokens(pattern[0]), getReplacementPattern(pattern[1]))
        : Pair.of("", "");
  }

  @NonNull
  private String[] retrievePattern(@NonNull String clause) {
    Matcher matcher = PSEUDO_TEXT_PATTERN.matcher(clause);
    if (matcher.find()) return new String[] {matcher.group(1), matcher.group(2)};
    return new String[] {EMPTY_PSEUDO_TEXT};
  }

  private boolean isPatternCorrect(@NonNull String[] pattern) {
    return pattern.length == 2;
  }

  /**
   * Get pattern that matches only full tokens
   *
   * @return pattern that matches only full tokens
   */
  @NonNull
  private String getPatternForFullTokens(@NonNull String text) {
    if (handleFunctionalIdentifiers(text)) return "";
    return format(SEPARATE_TOKEN_PATTERN, text.trim());
  }

  private boolean handleFunctionalIdentifiers(String text) {
    return FUNCTION_IDENTIFIER.matcher(text).matches();
  }

  /**
   * Get a regex from string. Whitespace in COBOL replaceable patterns matches line breaks. Hence,
   * the replaceable search string has to be enhanced to a regex
   *
   * @return a regex for replaceable
   */
  @NonNull
  private String getReplacementPattern(@NonNull String text) {
    if (handleFunctionalIdentifiers(text)) return "";
    return quoteReplacement(text.trim());
  }

  /**
   * Extract the pseudo text-based pattern for replacing in accordance with COBOL rules. Double
   * equals chars should be removed at the beginning and at the end, all the whitespaces should be
   * collapsed.
   *
   * <p>For matching purposes, each occurrence of a separator comma, a separator semicolon, or a
   * sequence of one or more separator spaces is considered to be a single space. However, when
   * operand-1 or partial-word-1 consists solely of a separator comma or separator semicolon, the
   * operand-1 or partial-word-1 participates in the match as a text word. In this case, the space
   * that follows the comma or semicolon separator can be omitted.
   *
   * @param text a pseudo-text string
   * @return a pattern for replacing
   */
  @NonNull
  private String extractPseudoText(@NonNull String text, @NonNull boolean isOperandOne) {
    String processedText =
        text.trim().replaceAll("^==", "").replaceAll("==$", "").replaceAll(" +", " ");
    if (isOperandOne && processedText.trim().equals(",") || processedText.trim().equals(";"))
      return processedText.trim();
    return handleSeparator(processedText).trim();
  }

  private String handleSeparator(String trim) {
    return trim.replace(", ", " ").replace("; ", " ");
  }

  @NonNull
  private String replace(@NonNull String text, @NonNull Pair<String, String> pattern) {
    String result = text;
    try {
      result = Pattern.compile(pattern.getLeft()).matcher(text).replaceAll(pattern.getRight());
      List<String> fixedStrings = validateAndFix(result, text);
      result = String.join(System.lineSeparator(), fixedStrings);
    } catch (IndexOutOfBoundsException e) {
      LOG.error(format(ERROR_REPLACING, text, pattern), e);
    }
    return result;
  }

  private List<String> validateAndFix(String result, String referenceText) {
    List<String> referenceStringList =
        new ArrayList<>(Arrays.asList(referenceText.split(System.lineSeparator())));
    List<String> resultStringList =
        new ArrayList<>(Arrays.asList(result.split(System.lineSeparator())));
    int resultIndex = 0;
    for (int refIndex = 0; refIndex < referenceStringList.size(); refIndex++) {
      int lengthDiff =
          resultStringList.get(resultIndex).length() - referenceStringList.get(refIndex).length();

      if (lengthDiff == 0) {
        resultIndex++;
        continue;
      }
      if (resultStringList.get(resultIndex).length() > END_INDEX_AREA_B) {

        String sequence =
            referenceStringList.get(refIndex).length() > END_INDEX_AREA_B
                ? referenceStringList.get(refIndex).substring(END_INDEX_AREA_B)
                : "";
        if (lengthDiff < 0 && StringUtils.isNumeric(sequence)) {
          resultStringList.set(
              resultIndex, adjustSequenceNoPresentInAreaB(resultStringList, resultIndex, sequence));
        } else {
          int prevSize = resultStringList.size();
          adjustExtraLength(resultStringList, refIndex, resultIndex, sequence);
          resultIndex = resultIndex + resultStringList.size() - prevSize;
        }
      }
      resultIndex++;
    }
    return resultStringList;
  }

  private String adjustSequenceNoPresentInAreaB(
      List<String> resultStringList, int j, String sequence) {
    return StringUtils.join(
        StringUtils.rightPad(
            StringUtils.substring(
                resultStringList.get(j), 0, resultStringList.get(j).length() - sequence.length()),
            END_INDEX_AREA_B),
        sequence);
  }

  private void adjustExtraLength(
      List<String> resultStringList, int refIndex, int resultIndex, String sequence) {
    String addedString =
        resultStringList
            .get(resultIndex)
            .substring(
                END_INDEX_AREA_B, resultStringList.get(resultIndex).length() - sequence.length());
    resultStringList.set(
        refIndex,
        StringUtils.join(
            StringUtils.substring(resultStringList.get(resultIndex), 0, END_INDEX_AREA_B),
            sequence));
    if (!StringUtils.isBlank(addedString)) {
      List<String> adjustedExtraCharInContinuationLine =
          splitStringByLength(
              addedString, END_INDEX_AREA_B - ProcessingConstants.CONTINUATION_PREFIX.length());
      resultStringList.addAll(resultIndex + 1, adjustedExtraCharInContinuationLine);
    }
  }

  private List<String> splitStringByLength(String actualStr, int fixedLength) {
    List<String> splitReplacement = new ArrayList<>();
    Splitter.fixedLength(fixedLength)
        .split(actualStr)
        .forEach(
            ele -> {
              if (!StringUtils.isBlank(ele))
                splitReplacement.add(ProcessingConstants.CONTINUATION_PREFIX + ele);
            });
    return splitReplacement;
  }

  private Function<String, Boolean> checkContainWord(String check) {
    return text ->
        Arrays.stream(text.toUpperCase().split("\b")).anyMatch(txt -> txt.equalsIgnoreCase(check));
  }

  @NonNull
  private ProcessedSearchClause getProcessedSearchClause(@NonNull String clause) {
    SearchPattern searchPattern = SearchPattern.EXACT;
    Matcher matcher = LEAD_OR_TRAIL_CLAUSE.matcher(clause);
    if (matcher.matches()) {
      if (matcher.group(1).equalsIgnoreCase("LEADING")) searchPattern = SearchPattern.STARTS_WITH;
      else if (matcher.group(1).equalsIgnoreCase("TRAILING"))
        searchPattern = SearchPattern.ENDS_WITH;
      clause = matcher.group(0).replace(matcher.group(1), "");
    }
    return new ProcessedSearchClause(clause, searchPattern);
  }

  @AllArgsConstructor
  @Getter
  private static class ProcessedSearchClause {
    String clause;
    SearchPattern searchPattern;
  }
}
