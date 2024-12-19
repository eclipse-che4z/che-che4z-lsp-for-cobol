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
package org.eclipse.lsp.cobol.implicitDialects.sql;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.*;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageServiceProvider;

import static java.util.Optional.ofNullable;

/**
 * Error strategy
 */
@Setter
@Getter
@Slf4j
public class Db2ErrorStrategy extends DefaultErrorStrategy implements MessageServiceProvider {
    private static final String REPORT_NO_VIABLE_ALTERNATIVE =
            "ErrorStrategy.reportNoViableAlternative";
    private static final String REPORT_MISSING_TOKEN = "ErrorStrategy.reportMissingToken";
    private static final String REPORT_MISSING_END_EXEC = "db2Parser.missingEndExec";
    private MessageService messageService;
    private ErrorMessageHelper errorMessageHelper;

    Db2ErrorStrategy(MessageService messageService) {
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
        } else if (e instanceof InputMismatchException) {
            reportInputMismatch(recognizer, (InputMismatchException) e);
        } else if (e instanceof FailedPredicateException) {
            reportFailedPredicate(recognizer, (FailedPredicateException) e);
        } else {
            reportUnrecognizedException(recognizer, e);
        }
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
        recognizer.notifyErrorListeners(e.getStartToken(), msg, e);
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
        String msg = recognizer.getExpectedTokens().contains(Db2SqlLexer.END_EXEC)
                ? messageService.getMessage(REPORT_MISSING_END_EXEC)
                : messageService.getMessage(
                REPORT_MISSING_TOKEN,
                errorMessageHelper.getExpectedText(recognizer),
                ErrorMessageHelper.getRule(recognizer));
        recognizer.notifyErrorListeners(recognizer.getCurrentToken(), msg, null);
    }

    private String getOffendingToken(InputMismatchException e) {
        return getTokenErrorDisplay(e.getOffendingToken());
    }

    @Override
    public Token recoverInline(Parser recognizer) throws RecognitionException {
        ParserRuleContext context = recognizer.getContext();
        if (context instanceof Db2SqlParser.ExecRuleContext) {
            Db2SqlParser.SqlCodeContext sqlCodeContext = ((Db2SqlParser.ExecRuleContext) context).sqlCode();
            int nodeCount = adjustConsumedNodes(recognizer, sqlCodeContext);
            ofNullable(sqlCodeContext.children).ifPresent(ch -> ch.subList(nodeCount, ch.size()).clear());
            Token missingSymbol = getMissingSymbol(recognizer);
            recognizer.notifyErrorListeners(missingSymbol, messageService.getMessage(REPORT_MISSING_END_EXEC), null);
            return missingSymbol;
        }
        return super.recoverInline(recognizer);
    }

    private int adjustConsumedNodes(Parser recognizer, Db2SqlParser.SqlCodeContext sqlCodeContext) {
        int nodeCount = 0;
        int startIdx = sqlCodeContext.start.getTokenIndex();
        TokenStream input = recognizer.getInputStream();
        input.seek(startIdx);
        Token t = input.LT(1);

        while (!isInAriaA(t) && !isSqlStopChar(t)
                && t.getType() != Db2SqlLexer.DOT_FS
                && t.getType() != Token.EOF) {
            input.consume();
            nodeCount++;
            sqlCodeContext.stop = t;
            t = input.LT(1);
        }
        // Consume ';'
        if (isSqlStopChar(t)) {
            input.consume();
            nodeCount++;
            sqlCodeContext.stop = t;
        }
        return nodeCount;
    }

    private static boolean isSqlStopChar(Token t) {
        return t.getType() == Db2SqlLexer.SEMICOLON_FS;
    }

    private boolean isInAriaA(Token t) {
        int pos = t.getCharPositionInLine() + 1;
        return 8 <= pos && pos <= 11;
    }
}
