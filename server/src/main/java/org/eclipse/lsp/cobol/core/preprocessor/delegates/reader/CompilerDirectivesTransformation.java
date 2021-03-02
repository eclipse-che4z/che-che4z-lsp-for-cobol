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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.Collections;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.BLANK_SEQUENCE_AREA;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.WS;

/**
 * This delegate moves the compiler directives to the content area not to let the writer cut the
 * compiler directives, that are allowed in the comment area.
 */
@Singleton
public class CompilerDirectivesTransformation implements CobolLineReaderDelegate {
  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(.{0,6} +|\\s*)(CBL|PROCESS) .+");
  private MessageService messageService;

  @Inject
  public CompilerDirectivesTransformation(MessageService messageService) {
    this.messageService = messageService;
  }

  @NonNull
  private String apply(@NonNull String line) {
    return COMPILER_DIRECTIVE_LINE.matcher(line).matches()
        ? moveContentFromCommentArea(cutTooLongString(line))
        : line;
  }

  @Override
  public @NonNull ResultWithErrors<String> apply(
      @NonNull String line, @NonNull String uri, @NonNull int lineNumber) {

    if (COMPILER_DIRECTIVE_LINE.matcher(line).matches() && !isSequenceNumberFormatCorrect(line)) {
      SyntaxError syntaxError =
          SyntaxError.syntaxError()
              .suggestion(
                  messageService.getMessage("CompilerDirectivesTransformation.sequenceNumber"))
              .severity(ERROR)
              .locality(
                  Locality.builder()
                      .uri(uri)
                      .range(new Range(new Position(lineNumber, 0), new Position(lineNumber, 1)))
                      .recognizer(getClass())
                      .build())
              .build();
      return new ResultWithErrors<>(apply(line), Collections.singletonList(syntaxError));
    }
    return new ResultWithErrors<>(apply(line), Collections.emptyList());
  }

  private String cutTooLongString(String line) {
    return line.length() == 80 ? line.substring(0, 72).trim() : line;
  }

  private boolean isSequenceNumberFormatCorrect(String line) {
    int lineContentStart = getLineContentStart(line);
    // issue error the sequence must start with a number.
    return lineContentStart < ProcessingConstants.INDICATOR_AREA
        || StringUtils.isBlank(line.substring(0, lineContentStart))
        || Character.isDigit(line.charAt(0));
  }

  private String moveContentFromCommentArea(String line) {
    return BLANK_SEQUENCE_AREA + WS + line.substring(getLineContentStart(line));
  }

  private int getLineContentStart(String line) {
    int cbl = line.toUpperCase().indexOf("CBL");
    int process = line.toUpperCase().indexOf("PROCESS");
    int max = Math.max(cbl, process);
    return max == -1 ? 0 : max;
  }
}
