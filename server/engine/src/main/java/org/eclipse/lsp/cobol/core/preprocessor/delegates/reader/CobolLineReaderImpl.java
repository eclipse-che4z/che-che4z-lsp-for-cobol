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

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;

import com.google.common.collect.ImmutableMap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entity; analyzes and
 * processes line indicators. This implementation checks if the lines match the given format and
 * raises an error if not. It also puts the entire compiler directive text (excluding the sequence
 * area if present) to prevent possible cutting off the line beginning.
 */
@Slf4j
@Singleton
public class CobolLineReaderImpl implements CobolLineReader {
  //TODO: check directive rules for HP tandem/GNU
  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(.{0,6} +|\\s*+)(?<directives>(CBL|PROCESS) .+)");

  // TODO: check these for GNU and HP. Also make it customizable
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
  private final CodeLayoutStore layoutStore;

  @Inject
  public CobolLineReaderImpl(MessageService messageService, CodeLayoutStore layoutStore) {
    this.messageService = messageService;
    this.layoutStore = layoutStore;
  }

  @NonNull
  @Override
  public ResultWithErrors<List<CobolLine>> processLines(
      @NonNull String documentURI, @NonNull String lines) {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    List<CobolLine> result = new ArrayList<>();
    try (Scanner scanner = new Scanner(lines)) {
      String currentLine;
      CobolLine lastCobolLine = null;
      int lineNumber = 0;

      while (scanner.hasNextLine()) {
        currentLine = scanner.nextLine();
        CobolLine currentCobolLine =
            parseLine(currentLine, documentURI, lineNumber).unwrap(accumulatedErrors::addAll);

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

    Matcher usualLine = layoutStore.getCodeLayout().getCobolLinePattern().matcher(line);
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
    CobolProgramLayout codeLayout = layoutStore.getCodeLayout();
    return lineWithoutSequence.length() > codeLayout.getSourceCodeLength()
        ? lineWithoutSequence.substring(0, codeLayout.getSourceCodeLength())
        : lineWithoutSequence;
  }

  private ResultWithErrors<CobolLineTypeEnum> determineType(
      String indicatorArea, String uri, int lineNumber) {
    CobolProgramLayout codeLayout = layoutStore.getCodeLayout();
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
                            codeLayout.getSequenceLength(), codeLayout.getSequenceLength() + 1))));
  }

  @NonNull
  private Optional<SyntaxError> checkLineLength(
      @NonNull String line, @NonNull String uri, int lineNumber) {
    int maxLineLength = layoutStore.getCodeLayout().getMaxLineLength();
    if (line.length() <= maxLineLength) {
      return Optional.empty();
    }
    return Optional.of(
        createError(
            uri,
            messageService.getMessage("CobolLineReaderImpl.longLineMsg", maxLineLength),
            lineNumber,
            maxLineLength,
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
    CobolProgramLayout codeLayout = layoutStore.getCodeLayout();
    return contentStart < (codeLayout.getIndicatorLength() + codeLayout.getSequenceLength())
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
            .errorSource(ErrorSource.PREPROCESSING)
            .suggestion(message)
            .severity(ERROR)
            .location(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(new Position(lineNumber, start), new Position(lineNumber, stop)))
                    .recognizer(getClass())
                    .build().toOriginalLocation())
            .build();

    LOG.debug("Syntax error by CobolLineReaderImpl: {}", error.toString());
    return error;
  }
}
