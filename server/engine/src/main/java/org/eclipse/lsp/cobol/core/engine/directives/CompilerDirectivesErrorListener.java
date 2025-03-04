/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.directives;

import lombok.NonNull;
import org.antlr.v4.runtime.*;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.buildTokenRange;

/**
 * Error listener for Compiler Directives parser
 */
public class CompilerDirectivesErrorListener extends BaseErrorListener {
  private final AnalysisContext analysisContext;
  private final Position startPosition;
  private final MessageService messageService;
  static final String END_OF_FILE_MESSAGE = "ErrorStrategy.endOfFile";

  public CompilerDirectivesErrorListener(AnalysisContext analysisContext, Position startPosition, MessageService messageService) {
    this.analysisContext = analysisContext;
    this.startPosition = startPosition;
      this.messageService = messageService;
  }

  @Override
  public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
    if (messageService.getMessage(END_OF_FILE_MESSAGE).equals(msg)) {
      ParserRuleContext ctx = ((CompilerDirectivesParser) recognizer).getContext();
      Token lastToken = ((CompilerDirectivesParser.ShareableDataContext) ctx.children.get(ctx.getChildCount() - 1)).stop;
      throwException(lastToken.getText(), locationToLocality(getLocation(lastToken)), msg);
      return;
    }

    Position start = new Position(line - 1, charPositionInLine);
    Position end = new Position(line - 1, ((CommonToken) offendingSymbol).getStopIndex() + 1);
    Range range = CompilerDirectivesUtils.shiftRange(new Range(start, end), startPosition);
    Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
    throwException("", locationToLocality(location), msg);
  }

  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .location(locality.toOriginalLocation())
                    .suggestion(String.format("%s %s", message, wrongToken))
                    .severity(ErrorSeverity.ERROR)
                    .build();

    if (!analysisContext.getAccumulatedErrors().contains(error) && !wrongToken.contains(CobolDialect.FILLER)) {
      analysisContext.getAccumulatedErrors().add(error);
    }
  }

  private Location getLocation(Token childToken) {
    return analysisContext.getExtendedDocument().mapLocation(buildTokenRange(childToken));
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
            .range(location.getRange())
            .uri(location.getUri())
            .build();
  }
}
