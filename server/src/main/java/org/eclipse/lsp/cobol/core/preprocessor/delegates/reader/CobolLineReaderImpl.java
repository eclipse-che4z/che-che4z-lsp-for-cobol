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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.reader;

import com.google.common.collect.ImmutableMap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entity; analyzes and
 * processes line indicators. This implementation checks if the lines match the given format and
 * raises an error if not. It also puts the entire compiler directive text (excluding the sequence
 * area if present) to prevent possible cutting off the line beginning.
 */
@Slf4j
@Singleton
public class CobolLineReaderImpl implements CobolLineReader {
  private static final int INDICATOR_AREA_INDEX = 6;
  private static final int MAX_LINE_LENGTH = 80;
  private static final Pattern COBOL_LINE_PATTERN =
      Pattern.compile(
          "^(?<sequence>.{0,6})(?<indicator>.?)(?<contentA>.{0,4})(?<contentB>.{0,61})(?<comment>.{0,8})(?<extra>.*)$");
  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(.{0,6} +|\\s*+)(?<directives>(CBL|PROCESS) .+)");
  private static final Map<String, CobolLineTypeEnum> INDICATORS =
      new ImmutableMap.Builder<String, CobolLineTypeEnum>()
          .put("*", COMMENT)
          .put("/", COMMENT)
          .put("d", DEBUG)
          .put("D", DEBUG)
          .put("-", CONTINUATION)
          .put("$", COMPILER_DIRECTIVE)
          .put(" ", NORMAL)
          .put("", NORMAL)
          .build();

  private final MessageService messageService;

  @Inject
  public CobolLineReaderImpl(MessageService messageService) {
    this.messageService = messageService;
  }

  @NonNull
  @Override
  public ResultWithErrors<List<CobolLine>> processLines(
      @NonNull String documentURI, @NonNull String lines) {
    return processLines(documentURI, lines, Collections.emptyList());
  }

  @NonNull
  @Override
  public ResultWithErrors<List<CobolLine>> processLines(
      @NonNull String documentURI,
      @NonNull String lines,
      @NonNull List<ReplacingService.Replacement> replacements) {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    List<CobolLine> result = new ArrayList<>();
    try (Scanner scanner = new Scanner(lines)) {
      String currentLine;
      CobolLine lastCobolLine = null;
      int lineNumber = 0;

      while (scanner.hasNextLine()) {
        currentLine = scanner.nextLine();
        int finalLineNumber = lineNumber;
        CobolLine currentCobolLine;
        Optional<ReplacingService.Replacement> replacementMatch =
            replacements.stream().filter((ele -> ele.getIndex() == finalLineNumber)).findFirst();
        if (replacementMatch.isPresent()) {
          currentCobolLine =
              parseLine(replacementMatch.get().getPrevStr(), documentURI, lineNumber)
                  .unwrap(accumulatedErrors::addAll);
        } else {
          currentCobolLine =
              parseLine(currentLine, documentURI, lineNumber).unwrap(accumulatedErrors::addAll);
        }

        currentCobolLine.setPredecessor(lastCobolLine);
        result.add(currentCobolLine);

        lineNumber++;
        lastCobolLine = currentCobolLine;
      }
    }
    return new ResultWithErrors<>(result, accumulatedErrors);
  }

  @NonNull
  private ResultWithErrors<CobolLine> parseLine(
      @NonNull String line, @NonNull String uri, int lineNumber) {
    List<SyntaxError> errors = new ArrayList<>();
    CobolLine cobolLine;

    Matcher usualLine = COBOL_LINE_PATTERN.matcher(line);
    Matcher directivesLine = COMPILER_DIRECTIVE_LINE.matcher(line);
    if (directivesLine.matches()) {
      cobolLine =
          processCompilerDirectives(line, uri, lineNumber, directivesLine).unwrap(errors::addAll);
    } else if (usualLine.matches()) {
      cobolLine = processNormalLine(line, uri, lineNumber, usualLine).unwrap(errors::addAll);
    } else {
      // It is impossible. Pattern must match any line.
      LOG.error("The line '{}' can't be parsed.", line);
      cobolLine = new CobolLine();
    }

    cobolLine.setNumber(lineNumber);

    return new ResultWithErrors<>(cobolLine, errors);
  }

  private ResultWithErrors<CobolLine> processCompilerDirectives(
      @NonNull String line, @NonNull String uri, int lineNumber, @NonNull Matcher matcher) {
    List<SyntaxError> errors = new ArrayList<>();
    int contentStart = matcher.start("directives");
    String directives = matcher.group("directives");
    checkSequenceArea(line, uri, lineNumber, contentStart).ifPresent(errors::add);
    checkLineLength(line, uri, lineNumber).ifPresent(errors::add);
    CobolLine cobolLine = new CobolLine();
    cobolLine.setContentAreaA(cleanupString(directives, contentStart));
    cobolLine.setType(PREPROCESSED);
    return new ResultWithErrors<>(cobolLine, errors);
  }

  private ResultWithErrors<CobolLine> processNormalLine(
      @NonNull String line, @NonNull String uri, int lineNumber, Matcher matcher) {
    List<SyntaxError> errors = new ArrayList<>();
    CobolLine cobolLine = new CobolLine();
    cobolLine.setSequenceArea(matcher.group("sequence"));
    String indicatorArea = matcher.group("indicator");
    cobolLine.setIndicatorArea(indicatorArea);
    cobolLine.setType(determineType(indicatorArea, uri, lineNumber).unwrap(errors::addAll));
    cobolLine.setContentAreaA(matcher.group("contentA"));
    cobolLine.setContentAreaB(matcher.group("contentB"));
    cobolLine.setCommentArea(matcher.group("comment"));
    checkLineLength(line, uri, lineNumber).ifPresent(errors::add);

    return new ResultWithErrors<>(cobolLine, errors);
  }

  private String cleanupString(@NonNull String line, int contentStart) {
    String lineWithoutSequence = StringUtils.repeat(' ', contentStart) + line;
    return lineWithoutSequence.length() > 72
        ? lineWithoutSequence.substring(0, 72)
        : lineWithoutSequence;
  }

  private ResultWithErrors<CobolLineTypeEnum> determineType(
      String indicatorArea, String uri, int lineNumber) {
    return ofNullable(INDICATORS.get(indicatorArea))
        .map(it -> new ResultWithErrors<>(it, Collections.emptyList()))
        .orElseGet(
            () ->
                new ResultWithErrors<>(
                    NORMAL,
                    Collections.singletonList(
                        createError(
                            uri,
                            messageService.getMessage("CobolLineReaderImpl.incorrectLineFormat"),
                            lineNumber,
                            INDICATOR_AREA_INDEX,
                            INDICATOR_AREA_INDEX + 1))));
  }

  @NonNull
  private Optional<SyntaxError> checkLineLength(
      @NonNull String line, @NonNull String uri, int lineNumber) {
    if (line.length() <= 80) {
      return Optional.empty();
    }
    return Optional.of(
        createError(
            uri,
            messageService.getMessage("CobolLineReaderImpl.longLineMsg"),
            lineNumber,
            MAX_LINE_LENGTH,
            line.length()));
  }

  private Optional<SyntaxError> checkSequenceArea(
      @NonNull String line, @NonNull String uri, int lineNumber, int contentStart) {
    if (isSequenceNumberFormatCorrect(line, contentStart)) {
      return Optional.empty();
    }
    return Optional.of(
        createError(
            uri,
            messageService.getMessage("CompilerDirectivesTransformation.sequenceNumber"),
            lineNumber,
            0,
            1));
  }

  private boolean isSequenceNumberFormatCorrect(String line, int contentStart) {
    // issue error the sequence must start with a number.
    return contentStart < ProcessingConstants.INDICATOR_AREA
        || StringUtils.isBlank(line.substring(0, contentStart))
        || Character.isDigit(line.charAt(0));
  }

  /**
   * Create a syntax error using the given data build its locality
   *
   * @param uri the document URI
   * @param message the error message
   * @param lineNumber the error lineNumber
   * @param start the error start position
   * @param stop the error stop position
   * @return the {@link SyntaxError}
   */
  @NonNull
  private SyntaxError createError(
      @NonNull String uri, @NonNull String message, int lineNumber, int start, int stop) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(message)
            .severity(ERROR)
            .locality(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(new Position(lineNumber, start), new Position(lineNumber, stop)))
                    .recognizer(getClass())
                    .build())
            .build();

    LOG.debug("Syntax error by CobolLineReaderImpl: {}", error.toString());
    return error;
  }
}
