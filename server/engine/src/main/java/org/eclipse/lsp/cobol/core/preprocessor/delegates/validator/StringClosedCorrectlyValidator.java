/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.validator;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedTextLine;
import org.eclipse.lsp.cobol.common.mapping.MappedCharacter;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

/** Validates a transformed Cobol lines for correctly quoted Strings */
@Slf4j
public class StringClosedCorrectlyValidator implements ExtendedDocumentValidation {
  private static final Pattern BLANK_LINE_PATTERN = Pattern.compile("\\s*");
  private static final Pattern QUOTED_STRING_PATTERN = Pattern.compile("('([^'])*'|\"([^\"])*\")");
  private final MessageService messageService;

    public StringClosedCorrectlyValidator(
      MessageService messageService) {
    this.messageService = messageService;
    }

  @Override
  public List<SyntaxError> validateLines(ExtendedDocument extendedDocument) {
    List<SyntaxError> errors = new ArrayList<>();
    String documentURI = extendedDocument.getCurrentText().getUri();
    extendedDocument
        .getCurrentText()
        .perform(
            line ->
                ofNullable(getStringClosedInCorrectlyError(line, documentURI))
                    .ifPresent(errors::addAll));
    return errors;
  }

  /**
   * Check and raise an error if indicator area A of current line is not empty and the previous line
   * doesn't end correctly.
   */
  private List<SyntaxError> getStringClosedInCorrectlyError(ExtendedTextLine line, String uri) {
    List<SyntaxError> result = new ArrayList<>();
    if (isBlankLine(line)) return null;

    List<QuoteInfo> unclosedStringInfo = getUnclosedStringInfo(line);

    if (!unclosedStringInfo.isEmpty()) {
      unclosedStringInfo.forEach(info -> result.add(registerStringClosingError(uri, line, info)));
    }
    return result;
  }

  /** Check with a good pattern if there is an unclosed string */
  private List<QuoteInfo> getUnclosedStringInfo(ExtendedTextLine cobolLine) {
    List<QuoteInfo> result = new ArrayList<>();
    if (doNotNeedAnalysis(cobolLine)) return result;
    Matcher matcher = QUOTED_STRING_PATTERN.matcher(cobolLine.toString());

    if (!matcher.find()) {
      return findQuoteOpeningChar(cobolLine.toString())
          .map(Collections::singletonList)
          .orElse(Collections.emptyList());
    }
    // Find all matches
    while (matcher.find()) {
      String match = matcher.group();
      // Check if the quotes are balanced
      if (!areQuotesBalanced(match)) {
        result.add(new QuoteInfo(match.charAt(0), matcher.start()));
      }
    }
    return result;
  }

  private Optional<QuoteInfo> findQuoteOpeningChar(String cobolLineToCheck) {
    int indexOfSingle = cobolLineToCheck.indexOf('\'');
    int indexOfDouble = cobolLineToCheck.indexOf('"');

    if (indexOfSingle == indexOfDouble) return Optional.empty();

    if (indexOfSingle != -1 && indexOfDouble == -1)
      return Optional.of(new QuoteInfo('\'', indexOfSingle));
    if (indexOfSingle == -1) return Optional.of(new QuoteInfo('"', indexOfDouble));
    return indexOfSingle > indexOfDouble
        ? Optional.of(new QuoteInfo('"', indexOfDouble))
        : Optional.of(new QuoteInfo('\'', indexOfSingle));
  }

  private static boolean areQuotesBalanced(String str) {
    char firstChar = str.charAt(0);
    char lastChar = str.charAt(str.length() - 1);
    return (firstChar == '\'' && lastChar == '\'') || (firstChar == '"' && lastChar == '"');
  }

  private boolean doNotNeedAnalysis(ExtendedTextLine cobolLine) {
    return Objects.isNull(cobolLine) || isBlankLine(cobolLine);
  }

  private boolean isBlankLine(ExtendedTextLine cobolLine) {
    return BLANK_LINE_PATTERN.matcher(cobolLine.toString()).matches();
  }

  private SyntaxError registerStringClosingError(
      String uri, ExtendedTextLine line, QuoteInfo quoteInfo) {
    MappedCharacter mappedCharacter = line.getCharacters().get(quoteInfo.index);
    Position originalPosition = mappedCharacter.getOriginalPosition();
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PREPROCESSING)
            .location(
                Locality.builder()
                    .uri(uri)
                    .range(new Range(originalPosition, originalPosition))
                    .recognizer(ContinuationLineTransformation.class)
                    .build()
                    .toOriginalLocation())
            .suggestion(messageService.getMessage("ContinuationLineTransformation.periodRequired"))
            .severity(ERROR)
            .build();

    LOG.debug(
        "Syntax error by ContinuationLineTransformation#registerStringClosingError: {}",
        error.toString());
    return error;
  }

  private static class QuoteInfo {
    final char quoteChar;
    final int index;

    QuoteInfo(char quoteChar, int index) {
      this.quoteChar = quoteChar;
      this.index = index;
    }
  }
}
