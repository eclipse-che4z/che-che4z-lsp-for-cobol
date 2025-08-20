/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Dialect Error Helper class */
@UtilityClass
class DialectErrorHelper {

  public SyntaxError processingError(
      MessageService messageService, Locality locality, String dialect, String message) {
    return SyntaxError.syntaxError()
        .errorSource(ErrorSource.DIALECT)
        .location(locality.toOriginalLocation())
        .messageTemplate(
            MessageTemplate.of(
                "GrammarPreprocessorListener.errorProcessingDialect", dialect, message))
        .severity(ERROR)
        .errorCode(ErrorCodes.MISSING_COPYBOOK)
        .build();
  }

  public SyntaxError processingError(DialectProcessingContext context, String dialectName) {
    return SyntaxError.syntaxError()
        .messageTemplate(
            MessageTemplate.of(
                "dialects.processingError", dialectName, context.getExtendedDocument().getUri()))
        .severity(ErrorSeverity.ERROR)
        .location(
            new OriginalLocation(
                new Location(
                    context.getProgramDocumentUri(),
                    new Range(new Position(0, 0), new Position(0, 0))),
                null))
        .errorSource(ErrorSource.DIALECT)
        .build();
  }
}
