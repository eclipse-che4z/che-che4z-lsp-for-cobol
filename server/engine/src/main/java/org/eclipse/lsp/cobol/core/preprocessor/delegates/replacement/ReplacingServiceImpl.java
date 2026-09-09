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
 *    Broadcom - initial API and implementation
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
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
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
      @NonNull CobolLanguageId languageId,
      SearchPattern searchPattern) {
    List<SyntaxError> errors = new ArrayList<>();
    String leftAttribute = pattern.getLeft().trim();
    String rightAttribute = pattern.getRight().trim();

    String extractPseudoText1 = leftAttribute.trim();
    leftAttribute = searchPattern.apply(leftAttribute, languageId);

    rightAttribute = rightAttribute.trim();
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
                .messageTemplate(MessageTemplate.of("ReplacingServiceImpl.pseudoTxtInvalidLength"))
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
                .messageTemplate(MessageTemplate.of("ReplacingServiceImpl.invalidWord"))
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
  public Pair<String, String> retrieveTokenReplacingPattern(
      @NonNull Pair<String, String> clause, CobolLanguageId languageId) {
    return Pair.of(
        SearchPattern.EXACT.apply(clause.getLeft(), languageId),
        getReplacementPattern(clause.getRight()));
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

  private void replace(
      @NonNull ExtendedDocument extendedDocument,
      @NonNull Pair<String, String> pattern,
      @NonNull Range scope) {
    final int startLine = scope.getStart() == null ? 0 : scope.getStart().getLine();
    final int endLine = scope.getEnd() == null ? Integer.MAX_VALUE : scope.getEnd().getLine();
    String text = extendedDocument.getBaseText(startLine, endLine);
    final List<Integer> lineMap = makeLineMap(text);
    try {
      Matcher matcher = Pattern.compile(pattern.getLeft(), Pattern.CASE_INSENSITIVE).matcher(text);
      while (matcher.find()) {
        Range range =
            new Range(
                getPosition(lineMap, matcher.start(), startLine),
                getPosition(lineMap, matcher.end(), startLine));
        if (RangeUtils.isInside(range, scope)) {
          extendedDocument.replace(range, pattern.getRight());
        }
      }
      extendedDocument.commitTransformations();
    } catch (IndexOutOfBoundsException e) {
      LOG.error(format(ERROR_REPLACING, text, pattern), e);
    }
  }

  List<Integer> makeLineMap(String text) {
    final List<Integer> lineMap = new ArrayList<>();

    int i = 0;
    do {
      lineMap.add(i);
      i = text.indexOf('\n', i) + 1;
    } while (i > 0);

    return lineMap;
  }

  private Position getPosition(List<Integer> lineMap, int positionInFile, int lineOffset) {
    int b = 0;
    int e = lineMap.size();
    while (b != e) {
      final int m = b + (e - b) / 2;
      if (lineMap.get(m) < positionInFile) b = m + 1;
      else e = m;
    }
    final int line = e == lineMap.size() || lineMap.get(e) != positionInFile ? e - 1 : e;
    final int character = positionInFile - lineMap.get(line);
    return new Position(line + lineOffset, character);
  }

  private Function<String, Boolean> checkContainWord(String check) {
    return text ->
        Arrays.stream(text.toUpperCase().split("\b")).anyMatch(txt -> txt.equalsIgnoreCase(check));
  }
}
