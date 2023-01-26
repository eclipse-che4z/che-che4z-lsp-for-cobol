/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.dialects.idms;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

/**
 * Helper class for syntax errors creation
 */
@Slf4j
@UtilityClass
class ErrorHelper {
  public SyntaxError missingCopybooks(MessageService messageService, Locality locality, String copybookName) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.DIALECT)
            .location(locality.toOriginalLocation())
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.errorSuggestion",
                    copybookName))
            .severity(ERROR)
            .errorCode(ErrorCodes.MISSING_COPYBOOK)
            .build();
    LOG.debug("Syntax error by reportMissingCopybooks: {}", error.toString());
    return error;
  }

  public SyntaxError circularDependency(MessageService messageService, Locality locality, String copybookName) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.DIALECT)
            .location(locality.toOriginalLocation())
            .suggestion(
                messageService.getMessage(
                    "IdmsCopybookVisitor.errorCircularDependency",
                    copybookName))
            .severity(ERROR)
            .errorCode(ErrorCodes.MISSING_COPYBOOK)
            .build();
    LOG.debug("Syntax error by reportCircularDependency: {}", error.toString());
    return error;
  }
}
