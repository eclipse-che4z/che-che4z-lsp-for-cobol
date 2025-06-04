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
import static java.util.regex.Matcher.quoteReplacement;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

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

  private static final String SINGLE_QUOTED_SEPARATE_TOKEN_PATTERN = "(?<=[\\.\\s\\r\\n])%s";
  private static final Pattern FUNCTION_IDENTIFIER =
      Pattern.compile("\\s*function\\s+\\w+\\([^)]*+\\)", Pattern.CASE_INSENSITIVE);
  private static final String ERROR_REPLACING = "Error replacing on text: %s with the pattern: %s";
  private static final int INDIVIDUAL_WORD_VALID_LENGTH = 322;

  private final MessageService messageService;

  @Inject
  public ReplacingServiceImpl(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public void applyReplacing(
      @NonNull ExtendedDocument extendedDocument, @NonNull ReplaceData replaceData) {
    for (Pair<String, String> replacePattern : replaceData.getReplacePatterns()) {
      replace(extendedDocument, replacePattern, replaceData.getRange(extendedDocument.getUri()));
    }
  }

  @Override
  public ResultWithErrors<Pair<String, String>> retrievePseudoTextReplacingPattern(
      @NonNull Pair<String, String> pattern,
      @NonNull Locality locality,
      SearchPattern searchPattern) {
    List<SyntaxError> errors = new ArrayList<>();
    String leftAttribute = pattern.getLeft();
    String rightAttribute = pattern.getRight();

    String extractPseudoText1 = extractPseudoText(leftAttribute, true);
    leftAttribute = searchPattern.apply(extractPseudoText1);

    rightAttribute = extractPseudoText(rightAttribute, false);
    checkInvalidWordUsage(new String[] {extractPseudoText1, rightAttribute}, locality)
        .ifPresent(errors::add);
    checkInvalidTextWordLength(new String[] {extractPseudoText1, rightAttribute}, locality)
        .ifPresent(errors::add);
    Pair<String, String> replacePattern = Pair.of(leftAttribute, rightAttribute);

    return new ResultWithErrors<>(replacePattern, errors);
  }

  private Optional<SyntaxError> checkInvalidTextWordLength(String[] attributes, Locality locality) {
    boolean isInvalidLength =
        logicAccumulator(
            checkIndividualTextWordLength(ReplacingServiceImpl.INDIVIDUAL_WORD_VALID_LENGTH),
            Boolean::logicalOr,
            attributes);
    return isInvalidLength
        ? Optional.of(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.EXTENDED_DOCUMENT)
                .severity(ErrorSeverity.ERROR)
                .location(locality.toOriginalLocation())
                .suggestion(
                    messageService.getMessage("ReplacingServiceImpl.pseudoTxtInvalidLength"))
                .build())
        : Optional.empty();
  }

  private Optional<SyntaxError> checkInvalidWordUsage(String[] attributes, Locality locality) {
    boolean isInvalidWordPresent =
        logicAccumulator(checkContainWord("copy"), Boolean::logicalOr, attributes);
    return isInvalidWordPresent
        ? Optional.of(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.EXTENDED_DOCUMENT)
                .severity(ErrorSeverity.ERROR)
                .suggestion(messageService.getMessage("ReplacingServiceImpl.invalidWord"))
                .location(locality.toOriginalLocation())
                .build())
        : Optional.empty();
  }

  private <T> Boolean logicAccumulator(
      Function<T, Boolean> func, BinaryOperator<Boolean> operator, T[] attributes) {
    return Arrays.stream(attributes).map(func).reduce(operator).orElse(false);
  }

  private Function<String, Boolean> checkIndividualTextWordLength(int validLength) {
    return rightAttribute ->
        Arrays.stream(rightAttribute.split("\b")).anyMatch(c -> c.length() > validLength);
  }

  @NonNull
  @Override
  public Pair<String, String> retrieveTokenReplacingPattern(@NonNull Pair<String, String> clause) {
    return Pair.of(
        getPatternForFullTokens(clause.getLeft()), getReplacementPattern(clause.getRight()));
  }

  /**
   * Get pattern that matches only full tokens
   *
   * @return pattern that matches only full tokens
   */
  @NonNull
  private String getPatternForFullTokens(@NonNull String text) {
    if (handleFunctionalIdentifiers(text)) return "";
    final String trimmed = text.trim();
    if (org.eclipse.lsp.cobol.common.utils.StringUtils.isEnclosedInSingleQuotes(trimmed)) {
      return format(SINGLE_QUOTED_SEPARATE_TOKEN_PATTERN, trimmed);
    }
    return format(SEPARATE_TOKEN_PATTERN, trimmed);
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
  private String extractPseudoText(@NonNull String text, boolean isOperandOne) {
    String processedText = text.trim().replaceAll("^==", "").replaceAll("==$", "");
    if (isOperandOne && processedText.trim().equals(",") || processedText.trim().equals(";"))
      return processedText.trim();
    return handleSeparator(processedText).trim();
  }

  private String handleSeparator(String trim) {
    return trim.replace(", ", " ").replace("; ", " ");
  }

  private void replace(
      @NonNull ExtendedDocument extendedDocument,
      @NonNull Pair<String, String> pattern,
      @NonNull Range scope) {
    String text = extendedDocument.toString();
    if (StringUtils.isBlank(text)) {
      return;
    }
    try {
      Matcher matcher = Pattern.compile(pattern.getLeft(), Pattern.CASE_INSENSITIVE).matcher(text);
      while (matcher.find()) {
        Range range =
            new Range(getPosition(text, matcher.start()), getPosition(text, matcher.end()));
        if (RangeUtils.isInside(range, scope)) {
          extendedDocument.replace(range, pattern.getRight());
        }
      }
      extendedDocument.commitTransformations();
    } catch (IndexOutOfBoundsException e) {
      LOG.error(format(ERROR_REPLACING, text, pattern), e);
    }
  }

  private Position getPosition(String text, int positionInFile) {
    String prefix = text.substring(0, positionInFile);
    int character = positionInFile - prefix.lastIndexOf("\n") - 1;
    int line = StringUtils.countMatches(prefix, "\n");
    return new Position(line, character);
  }

  private Function<String, Boolean> checkContainWord(String check) {
    return text ->
        Arrays.stream(text.toUpperCase().split("\b")).anyMatch(txt -> txt.equalsIgnoreCase(check));
  }
}
