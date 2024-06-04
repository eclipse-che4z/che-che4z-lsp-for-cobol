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
package org.eclipse.lsp.cobol.core.strategy;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.ATNState;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.MessageServiceParser;

/**
 * This implementation of the error strategy customizes error messages that are extracted from the
 * parsing exceptions and changes the sync strategy adopted specific to the COBOL language
 */
@Slf4j
// for test
@NoArgsConstructor
public class CobolErrorStrategy extends BasicCobolErrorHandler {

  public CobolErrorStrategy(MessageService messageService) {
    super(messageService);
  }

  /**
   * This is a Cobol specific method adopted from {@link DefaultErrorStrategy#sync(Parser)}
   *
   * <p>The Cobol specific implementation of {@link ANTLRErrorStrategy#sync} makes sure that the
   * current lookahead symbol is consistent with what were expecting at this point in the ATN. You
   * can call this anytime but ANTLR only generates code to check before subrules/loops and each
   * iteration.
   *
   * <p>Implements Jim Idle's magic sync mechanism in closures and optional subrules. E.g.,
   *
   * <pre>
   * a : sync ( stuff sync )* ;
   * sync : {consume to what can follow sync} ;
   * </pre>
   *
   * At the start of a sub rule upon error, {@link #sync} performs single token deletion, if
   * possible. If it can't do that, it bails on the current rule and uses the default error
   * recovery, which consumes until the resynchronization set of the current rule.
   *
   * <p>If the sub rule is optional ({@code (...)?}, {@code (...)*}, or block with an empty
   * alternative), then the expected set includes what follows the subrule.
   *
   * <p>During loop iteration, it consumes until it sees a token that can start a sub rule or what
   * follows loop. Yes, that is pretty aggressive. We opt to stay in the loop as long as possible.
   *
   * <p><strong>ORIGINS</strong>
   *
   * <p>Previous versions of ANTLR did a poor job of their recovery within loops. A single mismatch
   * token or missing token would force the parser to bail out of the entire rules surrounding the
   * loop. So, for rule
   *
   * <pre>
   * classDef : 'class' ID '{' member* '}'
   * </pre>
   *
   * input with an extra token between members would force the parser to consume until it found the
   * next class definition rather than the next member definition of the current class.
   *
   * <p>This functionality cost a little bit of effort because the parser has to compare token set
   * at the start of the loop and at each iteration. If for some reason speed is suffering for you,
   * you can turn off this functionality by simply overriding this method as a blank { }.
   */
  @Override
  public void sync(Parser recognizer) throws RecognitionException {
    ATNState s = recognizer.getInterpreter().atn.states.get(recognizer.getState());
    int stateType = s.getStateType();
    // System.err.println("sync @ "+s.stateNumber+"="+s.getClass().getSimpleName());
    // If already recovering, don't try to sync
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }

    TokenStream tokens = recognizer.getInputStream();
    int la = tokens.LA(1);
    Optional<Integer> lastToken = Optional.ofNullable(tokens.LT(-1)).map(Token::getType);

    // try cheaper subset first; might get lucky. seems to shave a wee bit off
    IntervalSet nextTokens = recognizer.getATN().nextTokens(s);
    if (nextTokens.contains(la)) {
      // We are sure the token matches
      nextTokensContext = null;
      nextTokensState = ATNState.INVALID_STATE_NUMBER;
      return;
    }

    if (nextTokens.contains(Token.EPSILON)) {
      if (nextTokensContext == null) {
        // It's possible the next token won't match; information tracked
        // by sync is restricted for performance.
        //        List<Integer> skipToTokenList =
        // CobolLexer.cobolVerbTokens.stream().filter(nextTokens::contains).distinct().collect(Collectors.toList());
        if (shouldSkipToSync(nextTokens, la, lastToken)) {
          cobolSync(recognizer);
          return;
        }
        nextTokensContext = recognizer.getContext();
        nextTokensState = recognizer.getState();
      }
      return;
    }

    switch (stateType) {
      case ATNState.BLOCK_START:
      case ATNState.STAR_BLOCK_START:
      case ATNState.PLUS_BLOCK_START:
      case ATNState.STAR_LOOP_ENTRY:
        // report error and recover if possible
        if (singleTokenDeletion(recognizer) != null) {
          return;
        }
        throw new InputMismatchException(recognizer);

      case ATNState.PLUS_LOOP_BACK:
      case ATNState.STAR_LOOP_BACK:
        // System.err.println("at loop back: "+s.getClass().getSimpleName());
        reportUnwantedToken(recognizer);
        IntervalSet expecting = recognizer.getExpectedTokens();
        IntervalSet whatFollowsLoopIterationOrRule = expecting.or(getErrorRecoverySet(recognizer));
        consumeUntil(recognizer, whatFollowsLoopIterationOrRule);
        break;

      default:
        // do nothing if we can't identify the exact kind of ATN state
        break;
    }
  }

  private void cobolSync(Parser recognizer) {
    handleMissingDot(recognizer);
    consumeUntilNext(recognizer, getSkipToTokenList());
  }

  private static List<Integer> getSkipToTokenList() {
    List<Integer> skipToTokenList = new ArrayList<>();
    skipToTokenList.add(CobolLexer.DOT_FS);
    skipToTokenList.add(CobolLexer.DOT_FS2);
    skipToTokenList.addAll(CobolLexer.cobolVerbTokens);
    return skipToTokenList;
  }

  private static void handleMissingDot(Parser recognizer) {
    if (recognizer.getContext() instanceof CobolParser.Dot_fsContext
        && recognizer instanceof CobolParser) {
      ((CobolParser) recognizer)
          .notifyError("missing.period", recognizer.getInputStream().LT(1).getText());
    }
  }

  private static boolean shouldSkipToSync(
      IntervalSet nextTokens, int la, Optional<Integer> lastToken) {
    return (nextTokens.contains(CobolLexer.DOT_FS) || nextTokens.contains(CobolLexer.DOT_FS2))
        && !nextTokens.contains(Token.EOF)
        && la != Token.EOF
        && (lastToken.isPresent() && !getSkipToTokenList().contains(lastToken.get()));
  }

  protected void consumeUntilNext(Parser recognizer, List<Integer> skipToTokenList) {
    Token sToken = recognizer.getInputStream().LT(1);
    int ttype = recognizer.getInputStream().LA(1);
    int skipTokenCount = 0;
    while (ttype != Token.EOF && !skipToTokenList.contains(ttype)) {
      recognizer.consume();
      skipTokenCount++;
      ttype = recognizer.getInputStream().LA(1);
    }
    if (skipTokenCount > 0) {
      MessageServiceParser cobolParser = (MessageServiceParser) recognizer;
      ANTLRErrorListener errorListenerDispatch = cobolParser.getErrorListenerDispatch();
      CommonToken offendingToken = new CommonToken(sToken);
      Token lastToken = recognizer.getInputStream().LT(-1);
      offendingToken.setStopIndex(lastToken.getStopIndex());
      errorListenerDispatch.syntaxError(
          recognizer,
          offendingToken,
          offendingToken.getLine(),
          offendingToken.getCharPositionInLine(),
          this.getMessageService().getMessage("input.mismatch.skipAnalysis"),
          new InputMismatchException(recognizer));
    }
    nextTokensContext = (ParserRuleContext) recognizer.getContext().parent;
    nextTokensState = recognizer.getState();
  }
}
