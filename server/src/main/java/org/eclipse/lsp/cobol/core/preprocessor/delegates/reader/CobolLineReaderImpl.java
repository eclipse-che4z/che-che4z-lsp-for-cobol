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

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import com.google.common.collect.ImmutableMap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static java.util.Optional.ofNullable;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entity; analyzes and
 * processes line indicators. This implementation checks if the lines match the given format and
 * raises an error if not.
 *
 * <p>Also, this class uses a compiler directives delegate to apply appropriate transformations.
 */
@Slf4j
@Singleton
public class CobolLineReaderImpl implements CobolLineReader {
  private static final int INDICATOR_AREA_INDEX = 6;
  private static final int MAX_LINE_LENGTH = 80;
  private static final Pattern COBOL_LINE_PATTERN =
      Pattern.compile(
          "^(?<sequence>.{0,6})(?<indicator>.?)(?<contentA>.{0,4})(?<contentB>.{0,61})(?<comment>.{0,8})(?<extra>.*)$");
  private static final Map<String, CobolLineTypeEnum> INDICATORS =
      new ImmutableMap.Builder<String, CobolLineTypeEnum>()
          .put("*", COMMENT)
          .put("/", COMMENT)
          .put("d", DEBUG)
          .put("D", DEBUG)
          .put("-", CONTINUATION)
          .put("$", COMPILER_DIRECTIVE)
          .put(" ", NORMAL)
          .build();

  private CobolLineReaderDelegate delegate;
  private MessageService messageService;

  @Inject
  public CobolLineReaderImpl(CobolLineReaderDelegate delegate, MessageService messageService) {
    this.delegate = delegate;
    this.messageService = messageService;
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
            parseLine(delegate.apply(currentLine), documentURI, lineNumber)
                .unwrap(accumulatedErrors::addAll);

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
    CobolLine cobolLine = new CobolLine();

    List<SyntaxError> errors = new ArrayList<>();

    Matcher matcher = COBOL_LINE_PATTERN.matcher(line);
    if (matcher.matches()) {
      cobolLine.setSequenceArea(matcher.group("sequence"));
      String indicatorArea = matcher.group("indicator");
      if (!indicatorArea.isEmpty()) {
        CobolLineTypeEnum type =
            determineType(indicatorArea, uri, lineNumber).unwrap(errors::addAll);
        cobolLine.setIndicatorArea(indicatorArea);
        cobolLine.setType(type);
      }
      cobolLine.setContentAreaA(matcher.group("contentA"));
      cobolLine.setContentAreaB(matcher.group("contentB"));
      cobolLine.setCommentArea(matcher.group("comment"));
      if (!matcher.group("extra").isEmpty()) {
        errors.add(
            createError(
                uri,
                messageService.getMessage("CobolLineReaderImpl.longLineMsg"),
                lineNumber,
                MAX_LINE_LENGTH,
                line.length()));
      }
    } else {
      // It is impossible. Pattern must match any line.
      LOG.error("The line '{}' can't be parsed.", line);
    }

    cobolLine.setNumber(lineNumber);

    return new ResultWithErrors<>(cobolLine, errors);
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

    LOG.debug("Syntax error by CobolLineReaderImpl#registerFormatError: {}", error.toString());
    return error;
  }
}
