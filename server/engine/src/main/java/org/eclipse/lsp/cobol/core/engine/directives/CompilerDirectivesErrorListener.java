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

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Error listener for Compiler Directives parser
 */
public class CompilerDirectivesErrorListener extends BaseErrorListener {
  private final AnalysisContext analysisContext;
  private final Position startPosition;

  public CompilerDirectivesErrorListener(AnalysisContext analysisContext, Position startPosition) {
    this.analysisContext = analysisContext;
    this.startPosition = startPosition;
  }

  @Override
  public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
    Position start = new Position(line - 1, charPositionInLine);
    Position end = new Position(line - 1, ((CommonToken) offendingSymbol).getStopIndex() + 1);
    Range range = CompilerDirectivesUtils.shiftRange(new Range(start, end), startPosition);
    Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
    SyntaxError error = SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .suggestion(msg)
            .location(new OriginalLocation(location, null))
            .severity(ErrorSeverity.ERROR)
            .build();
    analysisContext.getAccumulatedErrors().add(error);
  }
}
