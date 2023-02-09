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
package org.eclipse.lsp.cobol.dialects.daco;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.*;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageServiceProvider;

/**
 * This implementation of the error strategy customizes error messages that are extracted from the
 * parsing exceptions
 */
@Slf4j
// for test
@NoArgsConstructor
class CobolErrorStrategy extends DefaultErrorStrategy implements MessageServiceProvider {
  private static final String REPORT_NO_VIABLE_ALTERNATIVE =
      "ErrorStrategy.reportNoViableAlternative";
  private static final String REPORT_MISSING_TOKEN = "ErrorStrategy.reportMissingToken";

  @Getter @Setter private MessageService messageService;
  @Getter @Setter private ErrorMessageHelper errorMessageHelper;

  CobolErrorStrategy(MessageService messageService) {
    this.messageService = messageService;
    this.errorMessageHelper = new ErrorMessageHelper(messageService);
  }

  @Override
  public void reportError(Parser recognizer, RecognitionException e) {
    // if we've already reported an error and have not matched a token
    // yet successfully, don't report any errors.
    if (inErrorRecoveryMode(recognizer)) {
      return; // don't report spurious errors
    }
    beginErrorCondition(recognizer);

    if (e instanceof NoViableAltException) {
      reportNoViableAlternative(recognizer, (NoViableAltException) e);
      return;
    }
    if (e instanceof InputMismatchException) {
      reportInputMismatch(recognizer, (InputMismatchException) e);
      return;
    }
    if (e instanceof FailedPredicateException) {
      reportFailedPredicate(recognizer, (FailedPredicateException) e);
      return;
    }
    reportUnrecognizedException(recognizer, e);
  }

  private void reportUnrecognizedException(Parser recognizer, RecognitionException e) {
    LOG.error("unknown recognition error type: " + e.getClass().getName());
    recognizer.notifyErrorListeners(e.getOffendingToken(), e.getMessage(), e);
  }

  @Override
  protected void reportInputMismatch(Parser recognizer, InputMismatchException e) {
    Token token = e.getOffendingToken();
    String msg =
        errorMessageHelper.getInputMismatchMessage(recognizer, e, token, getOffendingToken(e));
    recognizer.notifyErrorListeners(token, msg, e);
  }

  @Override
  protected void reportNoViableAlternative(Parser recognizer, NoViableAltException e) {
    String messageParams = errorMessageHelper.retrieveInputForNoViableException(recognizer, e);
    String msg = messageService.getMessage(REPORT_NO_VIABLE_ALTERNATIVE, messageParams);
    recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e);
  }

  @Override
  protected void reportUnwantedToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    Token currentToken = recognizer.getCurrentToken();
    String msg = errorMessageHelper.getUnwantedTokenMessage(recognizer, currentToken);
    recognizer.notifyErrorListeners(currentToken, msg, null);
  }

  @Override
  protected void reportMissingToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    String msg =
        messageService.getMessage(
            REPORT_MISSING_TOKEN,
            errorMessageHelper.getExpectedText(recognizer),
            ErrorMessageHelper.getRule(recognizer));
    recognizer.notifyErrorListeners(recognizer.getCurrentToken(), msg, null);
  }

  private String getOffendingToken(InputMismatchException e) {
    return getTokenErrorDisplay(e.getOffendingToken());
  }
}
