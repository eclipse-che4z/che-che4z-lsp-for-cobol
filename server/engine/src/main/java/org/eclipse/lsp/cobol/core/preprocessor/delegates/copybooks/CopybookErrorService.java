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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.INFO;

/**
 * Provides creating errors for copybooks
 */
@Slf4j
@RequiredArgsConstructor
class CopybookErrorService {

  private static final String SYNTAX_ERROR_CHECK_COPYBOOK_NAME = "Syntax error by checkCopybookName: {}";
  private final MessageService messageService;

  public SyntaxError addCopybookNameError(CopybookName copybookName, Locality locality, int maxLen) {
    return addCopybookError(
        copybookName.getQualifiedName(),
        maxLen,
        locality,
        INFO,
        "GrammarPreprocessorListener.copyBkOverMaxChars",
        SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
  }

  private SyntaxError addCopybookError(
      CopybookName copybookName,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError().errorSource(ErrorSource.COPYBOOK)
            .severity(info)
            .suggestion(messageService.getMessage(messageID, copybookName.getDisplayName()))
            .location(locality.toOriginalLocation())
            .build();
    LOG.debug(logMessage, error.toString());
    return error;
  }

  public SyntaxError addRecursionError(String name, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.COPYBOOK)
            .severity(ERROR)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.recursionDetected", name))
            .location(locality.toOriginalLocation())
            .build();
    LOG.debug("Syntax error by CopybookErrorService: {}", error.toString());
    return error;
  }

  public SyntaxError addRecursiveReplacementError(CopybookName copybookName, Locality locality) {
    return addCopybookError(
        copybookName,
        locality,
        ERROR,
        "GrammarPreprocessorListener.copyBkNestedReplaceStmt",
        "Syntax error by CopybookErrorService: {}");
  }

  public SyntaxError addHyphenError(CopybookName copybookName, Locality locality) {
    return addCopybookError(
        copybookName,
        locality,
        ERROR,
        "GrammarPreprocessorListener.copyBkStartsOrEndsWithHyphen",
        SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
  }

  public SyntaxError addUnderscoreError(CopybookName copybookName, Locality locality) {
    return addCopybookError(
        copybookName,
        locality,
        ERROR,
        "GrammarPreprocessorListener.copyBkContainsUnderScore",
        SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
  }

  private SyntaxError addCopybookError(
      String copybookName,
      int maxNameLength,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError().errorSource(ErrorSource.COPYBOOK)
            .severity(info)
            .suggestion(messageService.getMessage(messageID, maxNameLength, copybookName))
            .location(locality.toOriginalLocation())
            .build();
    LOG.debug(logMessage, error.toString());
    return error;
  }

  public SyntaxError addMissingCopybook(String copybookName, Locality locality) {
    final SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.COPYBOOK)
            .location(locality.toOriginalLocation())
            .severity(ERROR)
            .errorCode(ErrorCodes.MISSING_COPYBOOK)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.errorSuggestion", copybookName))
            .build();
    LOG.debug("Syntax error by addMissingCopybook: {}", error);
    return error;
  }

  public SyntaxError addInvalidArgument(Locality locality, String argument) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PREPROCESSING)
            .severity(ERROR)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.controlDirectiveWrongArgs", argument))
            .location(locality.toOriginalLocation())
            .build();
    LOG.debug("Syntax error by addInvalidArgument: {}", error.toString());
    return error;
  }
}
