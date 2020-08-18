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

package com.ca.lsp.cobol.usecases.engine.parser;
// Generated from .\TestPreprocessor.g4 by ANTLR 4.7.2

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.ATN;
import org.antlr.v4.runtime.atn.ATNDeserializer;
import org.antlr.v4.runtime.atn.ParserATNSimulator;
import org.antlr.v4.runtime.atn.PredictionContextCache;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.List;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class TestPreprocessorParser extends Parser {
  static {
    RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION);
  }

  protected static final DFA[] _decisionToDFA;
  protected static final PredictionContextCache _sharedContextCache = new PredictionContextCache();
  public static final int START = 1,
      STOP = 2,
      VARIABLEDEFINITION = 3,
      VARIABLEUSAGE = 4,
      PARAGRPHDEFINITION = 5,
      PARAGRPHUSAGE = 6,
      COPYBOOKDEFINITION = 7,
      COPYBOOKUSAGE = 8,
      DIAGNOSTICSTART = 9,
      REPLACEMENTSTART = 10,
      MULTITOKENSTART = 11,
      MULTITOKENSTOP = 12,
      STRINGLITERAL = 13,
      IDENTIFIER = 14,
      COPYBOOKNAME = 15,
      NEWLINE = 16,
      WS = 17,
      TEXT = 18,
      SEPARATOR = 19;
  public static final int RULE_startRule = 0,
      RULE_multiTokenError = 1,
      RULE_multiToken = 2,
      RULE_errorStatement = 3,
      RULE_copybookStatement = 4,
      RULE_copybookUsage = 5,
      RULE_copybookDefinition = 6,
      RULE_variableStatement = 7,
      RULE_variableUsage = 8,
      RULE_variableDefinition = 9,
      RULE_paragraphStatement = 10,
      RULE_paragraphUsage = 11,
      RULE_paragraphDefinition = 12,
      RULE_diagnostic = 13,
      RULE_word = 14,
      RULE_replacement = 15,
      RULE_identifier = 16,
      RULE_cpyIdentifier = 17,
      RULE_cpyName = 18;

  private static String[] makeRuleNames() {
    return new String[] {
      "startRule",
      "multiTokenError",
      "multiToken",
      "errorStatement",
      "copybookStatement",
      "copybookUsage",
      "copybookDefinition",
      "variableStatement",
      "variableUsage",
      "variableDefinition",
      "paragraphStatement",
      "paragraphUsage",
      "paragraphDefinition",
      "diagnostic",
      "word",
      "replacement",
      "identifier",
      "cpyIdentifier",
      "cpyName"
    };
  }

  public static final String[] ruleNames = makeRuleNames();

  private static String[] makeLiteralNames() {
    return new String[] {
      null, "'{'", "'}'", null, null, null, null, null, null, "'|'", "'^'", null, null, null, null,
      null, null, null, null, "', '"
    };
  }

  private static final String[] _LITERAL_NAMES = makeLiteralNames();

  private static String[] makeSymbolicNames() {
    return new String[] {
      null,
      "START",
      "STOP",
      "VARIABLEDEFINITION",
      "VARIABLEUSAGE",
      "PARAGRPHDEFINITION",
      "PARAGRPHUSAGE",
      "COPYBOOKDEFINITION",
      "COPYBOOKUSAGE",
      "DIAGNOSTICSTART",
      "REPLACEMENTSTART",
      "MULTITOKENSTART",
      "MULTITOKENSTOP",
      "STRINGLITERAL",
      "IDENTIFIER",
      "COPYBOOKNAME",
      "NEWLINE",
      "WS",
      "TEXT",
      "SEPARATOR"
    };
  }

  private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
  public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  /** @deprecated Use {@link #VOCABULARY} instead. */
  @Deprecated public static final String[] tokenNames;

  static {
    tokenNames = new String[_SYMBOLIC_NAMES.length];
    for (int i = 0; i < tokenNames.length; i++) {
      tokenNames[i] = VOCABULARY.getLiteralName(i);
      if (tokenNames[i] == null) {
        tokenNames[i] = VOCABULARY.getSymbolicName(i);
      }

      if (tokenNames[i] == null) {
        tokenNames[i] = "<INVALID>";
      }
    }
  }

  @Override
  @Deprecated
  public String[] getTokenNames() {
    return tokenNames;
  }

  @Override
  public Vocabulary getVocabulary() {
    return VOCABULARY;
  }

  @Override
  public String getGrammarFileName() {
    return "TestPreprocessor.g4";
  }

  @Override
  public String[] getRuleNames() {
    return ruleNames;
  }

  @Override
  public String getSerializedATN() {
    return _serializedATN;
  }

  @Override
  public ATN getATN() {
    return _ATN;
  }

  public TestPreprocessorParser(TokenStream input) {
    super(input);
    _interp = new ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  public static class StartRuleContext extends ParserRuleContext {
    public TerminalNode EOF() {
      return getToken(TestPreprocessorParser.EOF, 0);
    }

    public List<CopybookStatementContext> copybookStatement() {
      return getRuleContexts(CopybookStatementContext.class);
    }

    public CopybookStatementContext copybookStatement(int i) {
      return getRuleContext(CopybookStatementContext.class, i);
    }

    public List<VariableStatementContext> variableStatement() {
      return getRuleContexts(VariableStatementContext.class);
    }

    public VariableStatementContext variableStatement(int i) {
      return getRuleContext(VariableStatementContext.class, i);
    }

    public List<ParagraphStatementContext> paragraphStatement() {
      return getRuleContexts(ParagraphStatementContext.class);
    }

    public ParagraphStatementContext paragraphStatement(int i) {
      return getRuleContext(ParagraphStatementContext.class, i);
    }

    public List<ErrorStatementContext> errorStatement() {
      return getRuleContexts(ErrorStatementContext.class);
    }

    public ErrorStatementContext errorStatement(int i) {
      return getRuleContext(ErrorStatementContext.class, i);
    }

    public List<MultiTokenErrorContext> multiTokenError() {
      return getRuleContexts(MultiTokenErrorContext.class);
    }

    public MultiTokenErrorContext multiTokenError(int i) {
      return getRuleContext(MultiTokenErrorContext.class, i);
    }

    public List<TerminalNode> NEWLINE() {
      return getTokens(TestPreprocessorParser.NEWLINE);
    }

    public TerminalNode NEWLINE(int i) {
      return getToken(TestPreprocessorParser.NEWLINE, i);
    }

    public StartRuleContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_startRule;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterStartRule(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitStartRule(this);
    }
  }

  public final StartRuleContext startRule() throws RecognitionException {
    StartRuleContext _localctx = new StartRuleContext(_ctx, getState());
    enterRule(_localctx, 0, RULE_startRule);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      {
        setState(41);
        _errHandler.sync(this);
        _alt = getInterpreter().adaptivePredict(_input, 0, _ctx);
        while (_alt != 1 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER) {
          if (_alt == 1 + 1) {
            {
              {
                setState(38);
                matchWildcard();
              }
            }
          }
          setState(43);
          _errHandler.sync(this);
          _alt = getInterpreter().adaptivePredict(_input, 0, _ctx);
        }
        setState(60);
        _errHandler.sync(this);
        _la = _input.LA(1);
        do {
          {
            {
              setState(50);
              _errHandler.sync(this);
              _alt = 1;
              do {
                switch (_alt) {
                  case 1:
                    {
                      setState(50);
                      _errHandler.sync(this);
                      switch (_input.LA(1)) {
                        case COPYBOOKDEFINITION:
                        case COPYBOOKUSAGE:
                          {
                            setState(44);
                            copybookStatement();
                          }
                          break;
                        case VARIABLEDEFINITION:
                        case VARIABLEUSAGE:
                          {
                            setState(45);
                            variableStatement();
                          }
                          break;
                        case PARAGRPHDEFINITION:
                        case PARAGRPHUSAGE:
                          {
                            setState(46);
                            paragraphStatement();
                          }
                          break;
                        case START:
                          {
                            setState(47);
                            errorStatement();
                          }
                          break;
                        case MULTITOKENSTART:
                          {
                            setState(48);
                            multiTokenError();
                          }
                          break;
                        case NEWLINE:
                          {
                            setState(49);
                            match(NEWLINE);
                          }
                          break;
                        default:
                          throw new NoViableAltException(this);
                      }
                    }
                    break;
                  default:
                    throw new NoViableAltException(this);
                }
                setState(52);
                _errHandler.sync(this);
                _alt = getInterpreter().adaptivePredict(_input, 2, _ctx);
              } while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER);
              setState(57);
              _errHandler.sync(this);
              _alt = getInterpreter().adaptivePredict(_input, 3, _ctx);
              while (_alt != 1 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER) {
                if (_alt == 1 + 1) {
                  {
                    {
                      setState(54);
                      matchWildcard();
                    }
                  }
                }
                setState(59);
                _errHandler.sync(this);
                _alt = getInterpreter().adaptivePredict(_input, 3, _ctx);
              }
            }
          }
          setState(62);
          _errHandler.sync(this);
          _la = _input.LA(1);
        } while ((((_la) & ~0x3f) == 0
            && ((1L << _la)
                    & ((1L << START)
                        | (1L << VARIABLEDEFINITION)
                        | (1L << VARIABLEUSAGE)
                        | (1L << PARAGRPHDEFINITION)
                        | (1L << PARAGRPHUSAGE)
                        | (1L << COPYBOOKDEFINITION)
                        | (1L << COPYBOOKUSAGE)
                        | (1L << MULTITOKENSTART)
                        | (1L << NEWLINE)))
                != 0));
        setState(64);
        match(EOF);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class MultiTokenErrorContext extends ParserRuleContext {
    public TerminalNode MULTITOKENSTART() {
      return getToken(TestPreprocessorParser.MULTITOKENSTART, 0);
    }

    public MultiTokenContext multiToken() {
      return getRuleContext(MultiTokenContext.class, 0);
    }

    public TerminalNode MULTITOKENSTOP() {
      return getToken(TestPreprocessorParser.MULTITOKENSTOP, 0);
    }

    public List<DiagnosticContext> diagnostic() {
      return getRuleContexts(DiagnosticContext.class);
    }

    public DiagnosticContext diagnostic(int i) {
      return getRuleContext(DiagnosticContext.class, i);
    }

    public MultiTokenErrorContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_multiTokenError;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterMultiTokenError(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitMultiTokenError(this);
    }
  }

  public final MultiTokenErrorContext multiTokenError() throws RecognitionException {
    MultiTokenErrorContext _localctx = new MultiTokenErrorContext(_ctx, getState());
    enterRule(_localctx, 2, RULE_multiTokenError);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(66);
        match(MULTITOKENSTART);
        setState(67);
        multiToken();
        setState(71);
        _errHandler.sync(this);
        _la = _input.LA(1);
        while (_la == DIAGNOSTICSTART) {
          {
            {
              setState(68);
              diagnostic();
            }
          }
          setState(73);
          _errHandler.sync(this);
          _la = _input.LA(1);
        }
        setState(74);
        match(MULTITOKENSTOP);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class MultiTokenContext extends ParserRuleContext {
    public List<WordContext> word() {
      return getRuleContexts(WordContext.class);
    }

    public WordContext word(int i) {
      return getRuleContext(WordContext.class, i);
    }

    public List<CopybookStatementContext> copybookStatement() {
      return getRuleContexts(CopybookStatementContext.class);
    }

    public CopybookStatementContext copybookStatement(int i) {
      return getRuleContext(CopybookStatementContext.class, i);
    }

    public List<VariableStatementContext> variableStatement() {
      return getRuleContexts(VariableStatementContext.class);
    }

    public VariableStatementContext variableStatement(int i) {
      return getRuleContext(VariableStatementContext.class, i);
    }

    public List<ParagraphStatementContext> paragraphStatement() {
      return getRuleContexts(ParagraphStatementContext.class);
    }

    public ParagraphStatementContext paragraphStatement(int i) {
      return getRuleContext(ParagraphStatementContext.class, i);
    }

    public List<ErrorStatementContext> errorStatement() {
      return getRuleContexts(ErrorStatementContext.class);
    }

    public ErrorStatementContext errorStatement(int i) {
      return getRuleContext(ErrorStatementContext.class, i);
    }

    public List<MultiTokenErrorContext> multiTokenError() {
      return getRuleContexts(MultiTokenErrorContext.class);
    }

    public MultiTokenErrorContext multiTokenError(int i) {
      return getRuleContext(MultiTokenErrorContext.class, i);
    }

    public MultiTokenContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_multiToken;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterMultiToken(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitMultiToken(this);
    }
  }

  public final MultiTokenContext multiToken() throws RecognitionException {
    MultiTokenContext _localctx = new MultiTokenContext(_ctx, getState());
    enterRule(_localctx, 4, RULE_multiToken);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(82);
        _errHandler.sync(this);
        _la = _input.LA(1);
        do {
          {
            setState(82);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
              case IDENTIFIER:
                {
                  setState(76);
                  word();
                }
                break;
              case COPYBOOKDEFINITION:
              case COPYBOOKUSAGE:
                {
                  setState(77);
                  copybookStatement();
                }
                break;
              case VARIABLEDEFINITION:
              case VARIABLEUSAGE:
                {
                  setState(78);
                  variableStatement();
                }
                break;
              case PARAGRPHDEFINITION:
              case PARAGRPHUSAGE:
                {
                  setState(79);
                  paragraphStatement();
                }
                break;
              case START:
                {
                  setState(80);
                  errorStatement();
                }
                break;
              case MULTITOKENSTART:
                {
                  setState(81);
                  multiTokenError();
                }
                break;
              default:
                throw new NoViableAltException(this);
            }
          }
          setState(84);
          _errHandler.sync(this);
          _la = _input.LA(1);
        } while ((((_la) & ~0x3f) == 0
            && ((1L << _la)
                    & ((1L << START)
                        | (1L << VARIABLEDEFINITION)
                        | (1L << VARIABLEUSAGE)
                        | (1L << PARAGRPHDEFINITION)
                        | (1L << PARAGRPHUSAGE)
                        | (1L << COPYBOOKDEFINITION)
                        | (1L << COPYBOOKUSAGE)
                        | (1L << MULTITOKENSTART)
                        | (1L << IDENTIFIER)))
                != 0));
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class ErrorStatementContext extends ParserRuleContext {
    public TerminalNode START() {
      return getToken(TestPreprocessorParser.START, 0);
    }

    public TerminalNode STOP() {
      return getToken(TestPreprocessorParser.STOP, 0);
    }

    public TerminalNode STRINGLITERAL() {
      return getToken(TestPreprocessorParser.STRINGLITERAL, 0);
    }

    public WordContext word() {
      return getRuleContext(WordContext.class, 0);
    }

    public TerminalNode TEXT() {
      return getToken(TestPreprocessorParser.TEXT, 0);
    }

    public List<DiagnosticContext> diagnostic() {
      return getRuleContexts(DiagnosticContext.class);
    }

    public DiagnosticContext diagnostic(int i) {
      return getRuleContext(DiagnosticContext.class, i);
    }

    public ErrorStatementContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_errorStatement;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterErrorStatement(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitErrorStatement(this);
    }
  }

  public final ErrorStatementContext errorStatement() throws RecognitionException {
    ErrorStatementContext _localctx = new ErrorStatementContext(_ctx, getState());
    enterRule(_localctx, 6, RULE_errorStatement);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(86);
        match(START);
        setState(90);
        _errHandler.sync(this);
        switch (_input.LA(1)) {
          case STRINGLITERAL:
            {
              setState(87);
              match(STRINGLITERAL);
            }
            break;
          case IDENTIFIER:
            {
              setState(88);
              word();
            }
            break;
          case TEXT:
            {
              setState(89);
              match(TEXT);
            }
            break;
          case STOP:
          case DIAGNOSTICSTART:
            break;
          default:
            break;
        }
        setState(95);
        _errHandler.sync(this);
        _la = _input.LA(1);
        while (_la == DIAGNOSTICSTART) {
          {
            {
              setState(92);
              diagnostic();
            }
          }
          setState(97);
          _errHandler.sync(this);
          _la = _input.LA(1);
        }
        setState(98);
        match(STOP);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class CopybookStatementContext extends ParserRuleContext {
    public TerminalNode STOP() {
      return getToken(TestPreprocessorParser.STOP, 0);
    }

    public CopybookUsageContext copybookUsage() {
      return getRuleContext(CopybookUsageContext.class, 0);
    }

    public CopybookDefinitionContext copybookDefinition() {
      return getRuleContext(CopybookDefinitionContext.class, 0);
    }

    public List<DiagnosticContext> diagnostic() {
      return getRuleContexts(DiagnosticContext.class);
    }

    public DiagnosticContext diagnostic(int i) {
      return getRuleContext(DiagnosticContext.class, i);
    }

    public CopybookStatementContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_copybookStatement;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterCopybookStatement(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitCopybookStatement(this);
    }
  }

  public final CopybookStatementContext copybookStatement() throws RecognitionException {
    CopybookStatementContext _localctx = new CopybookStatementContext(_ctx, getState());
    enterRule(_localctx, 8, RULE_copybookStatement);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(102);
        _errHandler.sync(this);
        switch (_input.LA(1)) {
          case COPYBOOKUSAGE:
            {
              setState(100);
              copybookUsage();
            }
            break;
          case COPYBOOKDEFINITION:
            {
              setState(101);
              copybookDefinition();
            }
            break;
          default:
            throw new NoViableAltException(this);
        }
        setState(107);
        _errHandler.sync(this);
        _la = _input.LA(1);
        while (_la == DIAGNOSTICSTART) {
          {
            {
              setState(104);
              diagnostic();
            }
          }
          setState(109);
          _errHandler.sync(this);
          _la = _input.LA(1);
        }
        setState(110);
        match(STOP);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class CopybookUsageContext extends ParserRuleContext {
    public TerminalNode COPYBOOKUSAGE() {
      return getToken(TestPreprocessorParser.COPYBOOKUSAGE, 0);
    }

    public CpyIdentifierContext cpyIdentifier() {
      return getRuleContext(CpyIdentifierContext.class, 0);
    }

    public CopybookUsageContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_copybookUsage;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterCopybookUsage(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitCopybookUsage(this);
    }
  }

  public final CopybookUsageContext copybookUsage() throws RecognitionException {
    CopybookUsageContext _localctx = new CopybookUsageContext(_ctx, getState());
    enterRule(_localctx, 10, RULE_copybookUsage);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(112);
        match(COPYBOOKUSAGE);
        setState(113);
        cpyIdentifier();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class CopybookDefinitionContext extends ParserRuleContext {
    public TerminalNode COPYBOOKDEFINITION() {
      return getToken(TestPreprocessorParser.COPYBOOKDEFINITION, 0);
    }

    public CpyIdentifierContext cpyIdentifier() {
      return getRuleContext(CpyIdentifierContext.class, 0);
    }

    public CopybookDefinitionContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_copybookDefinition;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterCopybookDefinition(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitCopybookDefinition(this);
    }
  }

  public final CopybookDefinitionContext copybookDefinition() throws RecognitionException {
    CopybookDefinitionContext _localctx = new CopybookDefinitionContext(_ctx, getState());
    enterRule(_localctx, 12, RULE_copybookDefinition);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(115);
        match(COPYBOOKDEFINITION);
        setState(116);
        cpyIdentifier();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class VariableStatementContext extends ParserRuleContext {
    public TerminalNode STOP() {
      return getToken(TestPreprocessorParser.STOP, 0);
    }

    public VariableUsageContext variableUsage() {
      return getRuleContext(VariableUsageContext.class, 0);
    }

    public VariableDefinitionContext variableDefinition() {
      return getRuleContext(VariableDefinitionContext.class, 0);
    }

    public List<DiagnosticContext> diagnostic() {
      return getRuleContexts(DiagnosticContext.class);
    }

    public DiagnosticContext diagnostic(int i) {
      return getRuleContext(DiagnosticContext.class, i);
    }

    public VariableStatementContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_variableStatement;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterVariableStatement(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitVariableStatement(this);
    }
  }

  public final VariableStatementContext variableStatement() throws RecognitionException {
    VariableStatementContext _localctx = new VariableStatementContext(_ctx, getState());
    enterRule(_localctx, 14, RULE_variableStatement);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(120);
        _errHandler.sync(this);
        switch (_input.LA(1)) {
          case VARIABLEUSAGE:
            {
              setState(118);
              variableUsage();
            }
            break;
          case VARIABLEDEFINITION:
            {
              setState(119);
              variableDefinition();
            }
            break;
          default:
            throw new NoViableAltException(this);
        }
        setState(125);
        _errHandler.sync(this);
        _la = _input.LA(1);
        while (_la == DIAGNOSTICSTART) {
          {
            {
              setState(122);
              diagnostic();
            }
          }
          setState(127);
          _errHandler.sync(this);
          _la = _input.LA(1);
        }
        setState(128);
        match(STOP);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class VariableUsageContext extends ParserRuleContext {
    public TerminalNode VARIABLEUSAGE() {
      return getToken(TestPreprocessorParser.VARIABLEUSAGE, 0);
    }

    public WordContext word() {
      return getRuleContext(WordContext.class, 0);
    }

    public VariableUsageContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_variableUsage;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterVariableUsage(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitVariableUsage(this);
    }
  }

  public final VariableUsageContext variableUsage() throws RecognitionException {
    VariableUsageContext _localctx = new VariableUsageContext(_ctx, getState());
    enterRule(_localctx, 16, RULE_variableUsage);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(130);
        match(VARIABLEUSAGE);
        setState(131);
        word();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class VariableDefinitionContext extends ParserRuleContext {
    public TerminalNode VARIABLEDEFINITION() {
      return getToken(TestPreprocessorParser.VARIABLEDEFINITION, 0);
    }

    public WordContext word() {
      return getRuleContext(WordContext.class, 0);
    }

    public VariableDefinitionContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_variableDefinition;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterVariableDefinition(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitVariableDefinition(this);
    }
  }

  public final VariableDefinitionContext variableDefinition() throws RecognitionException {
    VariableDefinitionContext _localctx = new VariableDefinitionContext(_ctx, getState());
    enterRule(_localctx, 18, RULE_variableDefinition);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(133);
        match(VARIABLEDEFINITION);
        setState(134);
        word();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class ParagraphStatementContext extends ParserRuleContext {
    public TerminalNode STOP() {
      return getToken(TestPreprocessorParser.STOP, 0);
    }

    public ParagraphUsageContext paragraphUsage() {
      return getRuleContext(ParagraphUsageContext.class, 0);
    }

    public ParagraphDefinitionContext paragraphDefinition() {
      return getRuleContext(ParagraphDefinitionContext.class, 0);
    }

    public List<DiagnosticContext> diagnostic() {
      return getRuleContexts(DiagnosticContext.class);
    }

    public DiagnosticContext diagnostic(int i) {
      return getRuleContext(DiagnosticContext.class, i);
    }

    public ParagraphStatementContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_paragraphStatement;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterParagraphStatement(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitParagraphStatement(this);
    }
  }

  public final ParagraphStatementContext paragraphStatement() throws RecognitionException {
    ParagraphStatementContext _localctx = new ParagraphStatementContext(_ctx, getState());
    enterRule(_localctx, 20, RULE_paragraphStatement);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(138);
        _errHandler.sync(this);
        switch (_input.LA(1)) {
          case PARAGRPHUSAGE:
            {
              setState(136);
              paragraphUsage();
            }
            break;
          case PARAGRPHDEFINITION:
            {
              setState(137);
              paragraphDefinition();
            }
            break;
          default:
            throw new NoViableAltException(this);
        }
        setState(143);
        _errHandler.sync(this);
        _la = _input.LA(1);
        while (_la == DIAGNOSTICSTART) {
          {
            {
              setState(140);
              diagnostic();
            }
          }
          setState(145);
          _errHandler.sync(this);
          _la = _input.LA(1);
        }
        setState(146);
        match(STOP);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class ParagraphUsageContext extends ParserRuleContext {
    public TerminalNode PARAGRPHUSAGE() {
      return getToken(TestPreprocessorParser.PARAGRPHUSAGE, 0);
    }

    public WordContext word() {
      return getRuleContext(WordContext.class, 0);
    }

    public ParagraphUsageContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_paragraphUsage;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterParagraphUsage(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitParagraphUsage(this);
    }
  }

  public final ParagraphUsageContext paragraphUsage() throws RecognitionException {
    ParagraphUsageContext _localctx = new ParagraphUsageContext(_ctx, getState());
    enterRule(_localctx, 22, RULE_paragraphUsage);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(148);
        match(PARAGRPHUSAGE);
        setState(149);
        word();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class ParagraphDefinitionContext extends ParserRuleContext {
    public TerminalNode PARAGRPHDEFINITION() {
      return getToken(TestPreprocessorParser.PARAGRPHDEFINITION, 0);
    }

    public WordContext word() {
      return getRuleContext(WordContext.class, 0);
    }

    public ParagraphDefinitionContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_paragraphDefinition;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterParagraphDefinition(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitParagraphDefinition(this);
    }
  }

  public final ParagraphDefinitionContext paragraphDefinition() throws RecognitionException {
    ParagraphDefinitionContext _localctx = new ParagraphDefinitionContext(_ctx, getState());
    enterRule(_localctx, 24, RULE_paragraphDefinition);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(151);
        match(PARAGRPHDEFINITION);
        setState(152);
        word();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class DiagnosticContext extends ParserRuleContext {
    public TerminalNode DIAGNOSTICSTART() {
      return getToken(TestPreprocessorParser.DIAGNOSTICSTART, 0);
    }

    public IdentifierContext identifier() {
      return getRuleContext(IdentifierContext.class, 0);
    }

    public DiagnosticContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_diagnostic;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterDiagnostic(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitDiagnostic(this);
    }
  }

  public final DiagnosticContext diagnostic() throws RecognitionException {
    DiagnosticContext _localctx = new DiagnosticContext(_ctx, getState());
    enterRule(_localctx, 26, RULE_diagnostic);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(154);
        match(DIAGNOSTICSTART);
        setState(155);
        identifier();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class WordContext extends ParserRuleContext {
    public IdentifierContext identifier() {
      return getRuleContext(IdentifierContext.class, 0);
    }

    public ReplacementContext replacement() {
      return getRuleContext(ReplacementContext.class, 0);
    }

    public WordContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_word;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterWord(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitWord(this);
    }
  }

  public final WordContext word() throws RecognitionException {
    WordContext _localctx = new WordContext(_ctx, getState());
    enterRule(_localctx, 28, RULE_word);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(157);
        identifier();
        setState(159);
        _errHandler.sync(this);
        _la = _input.LA(1);
        if (_la == REPLACEMENTSTART) {
          {
            setState(158);
            replacement();
          }
        }
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class ReplacementContext extends ParserRuleContext {
    public TerminalNode REPLACEMENTSTART() {
      return getToken(TestPreprocessorParser.REPLACEMENTSTART, 0);
    }

    public IdentifierContext identifier() {
      return getRuleContext(IdentifierContext.class, 0);
    }

    public ReplacementContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_replacement;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterReplacement(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitReplacement(this);
    }
  }

  public final ReplacementContext replacement() throws RecognitionException {
    ReplacementContext _localctx = new ReplacementContext(_ctx, getState());
    enterRule(_localctx, 30, RULE_replacement);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(161);
        match(REPLACEMENTSTART);
        setState(162);
        identifier();
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class IdentifierContext extends ParserRuleContext {
    public TerminalNode IDENTIFIER() {
      return getToken(TestPreprocessorParser.IDENTIFIER, 0);
    }

    public IdentifierContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_identifier;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterIdentifier(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitIdentifier(this);
    }
  }

  public final IdentifierContext identifier() throws RecognitionException {
    IdentifierContext _localctx = new IdentifierContext(_ctx, getState());
    enterRule(_localctx, 32, RULE_identifier);
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(164);
        match(IDENTIFIER);
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class CpyIdentifierContext extends ParserRuleContext {
    public CpyNameContext cpyName() {
      return getRuleContext(CpyNameContext.class, 0);
    }

    public ReplacementContext replacement() {
      return getRuleContext(ReplacementContext.class, 0);
    }

    public CpyIdentifierContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_cpyIdentifier;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterCpyIdentifier(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitCpyIdentifier(this);
    }
  }

  public final CpyIdentifierContext cpyIdentifier() throws RecognitionException {
    CpyIdentifierContext _localctx = new CpyIdentifierContext(_ctx, getState());
    enterRule(_localctx, 34, RULE_cpyIdentifier);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(166);
        cpyName();
        setState(168);
        _errHandler.sync(this);
        _la = _input.LA(1);
        if (_la == REPLACEMENTSTART) {
          {
            setState(167);
            replacement();
          }
        }
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class CpyNameContext extends ParserRuleContext {
    public TerminalNode IDENTIFIER() {
      return getToken(TestPreprocessorParser.IDENTIFIER, 0);
    }

    public TerminalNode COPYBOOKNAME() {
      return getToken(TestPreprocessorParser.COPYBOOKNAME, 0);
    }

    public CpyNameContext(ParserRuleContext parent, int invokingState) {
      super(parent, invokingState);
    }

    @Override
    public int getRuleIndex() {
      return RULE_cpyName;
    }

    @Override
    public void enterRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).enterCpyName(this);
    }

    @Override
    public void exitRule(ParseTreeListener listener) {
      if (listener instanceof TestPreprocessorListener)
        ((TestPreprocessorListener) listener).exitCpyName(this);
    }
  }

  public final CpyNameContext cpyName() throws RecognitionException {
    CpyNameContext _localctx = new CpyNameContext(_ctx, getState());
    enterRule(_localctx, 36, RULE_cpyName);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      {
        setState(170);
        _la = _input.LA(1);
        if (!(_la == IDENTIFIER || _la == COPYBOOKNAME)) {
          _errHandler.recoverInline(this);
        } else {
          if (_input.LA(1) == Token.EOF) matchedEOF = true;
          _errHandler.reportMatch(this);
          consume();
        }
      }
    } catch (RecognitionException re) {
      _localctx.exception = re;
      _errHandler.reportError(this, re);
      _errHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static final String _serializedATN =
      "\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\25\u00af\4\2\t\2"
          + "\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"
          + "\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"
          + "\4\23\t\23\4\24\t\24\3\2\7\2*\n\2\f\2\16\2-\13\2\3\2\3\2\3\2\3\2\3\2\3"
          + "\2\6\2\65\n\2\r\2\16\2\66\3\2\7\2:\n\2\f\2\16\2=\13\2\6\2?\n\2\r\2\16"
          + "\2@\3\2\3\2\3\3\3\3\3\3\7\3H\n\3\f\3\16\3K\13\3\3\3\3\3\3\4\3\4\3\4\3"
          + "\4\3\4\3\4\6\4U\n\4\r\4\16\4V\3\5\3\5\3\5\3\5\5\5]\n\5\3\5\7\5`\n\5\f"
          + "\5\16\5c\13\5\3\5\3\5\3\6\3\6\5\6i\n\6\3\6\7\6l\n\6\f\6\16\6o\13\6\3\6"
          + "\3\6\3\7\3\7\3\7\3\b\3\b\3\b\3\t\3\t\5\t{\n\t\3\t\7\t~\n\t\f\t\16\t\u0081"
          + "\13\t\3\t\3\t\3\n\3\n\3\n\3\13\3\13\3\13\3\f\3\f\5\f\u008d\n\f\3\f\7\f"
          + "\u0090\n\f\f\f\16\f\u0093\13\f\3\f\3\f\3\r\3\r\3\r\3\16\3\16\3\16\3\17"
          + "\3\17\3\17\3\20\3\20\5\20\u00a2\n\20\3\21\3\21\3\21\3\22\3\22\3\23\3\23"
          + "\5\23\u00ab\n\23\3\24\3\24\3\24\4+;\2\25\2\4\6\b\n\f\16\20\22\24\26\30"
          + "\32\34\36 \"$&\2\3\3\2\20\21\2\u00b7\2+\3\2\2\2\4D\3\2\2\2\6T\3\2\2\2"
          + "\bX\3\2\2\2\nh\3\2\2\2\fr\3\2\2\2\16u\3\2\2\2\20z\3\2\2\2\22\u0084\3\2"
          + "\2\2\24\u0087\3\2\2\2\26\u008c\3\2\2\2\30\u0096\3\2\2\2\32\u0099\3\2\2"
          + "\2\34\u009c\3\2\2\2\36\u009f\3\2\2\2 \u00a3\3\2\2\2\"\u00a6\3\2\2\2$\u00a8"
          + "\3\2\2\2&\u00ac\3\2\2\2(*\13\2\2\2)(\3\2\2\2*-\3\2\2\2+,\3\2\2\2+)\3\2"
          + "\2\2,>\3\2\2\2-+\3\2\2\2.\65\5\n\6\2/\65\5\20\t\2\60\65\5\26\f\2\61\65"
          + "\5\b\5\2\62\65\5\4\3\2\63\65\7\22\2\2\64.\3\2\2\2\64/\3\2\2\2\64\60\3"
          + "\2\2\2\64\61\3\2\2\2\64\62\3\2\2\2\64\63\3\2\2\2\65\66\3\2\2\2\66\64\3"
          + "\2\2\2\66\67\3\2\2\2\67;\3\2\2\28:\13\2\2\298\3\2\2\2:=\3\2\2\2;<\3\2"
          + "\2\2;9\3\2\2\2<?\3\2\2\2=;\3\2\2\2>\64\3\2\2\2?@\3\2\2\2@>\3\2\2\2@A\3"
          + "\2\2\2AB\3\2\2\2BC\7\2\2\3C\3\3\2\2\2DE\7\r\2\2EI\5\6\4\2FH\5\34\17\2"
          + "GF\3\2\2\2HK\3\2\2\2IG\3\2\2\2IJ\3\2\2\2JL\3\2\2\2KI\3\2\2\2LM\7\16\2"
          + "\2M\5\3\2\2\2NU\5\36\20\2OU\5\n\6\2PU\5\20\t\2QU\5\26\f\2RU\5\b\5\2SU"
          + "\5\4\3\2TN\3\2\2\2TO\3\2\2\2TP\3\2\2\2TQ\3\2\2\2TR\3\2\2\2TS\3\2\2\2U"
          + "V\3\2\2\2VT\3\2\2\2VW\3\2\2\2W\7\3\2\2\2X\\\7\3\2\2Y]\7\17\2\2Z]\5\36"
          + "\20\2[]\7\24\2\2\\Y\3\2\2\2\\Z\3\2\2\2\\[\3\2\2\2\\]\3\2\2\2]a\3\2\2\2"
          + "^`\5\34\17\2_^\3\2\2\2`c\3\2\2\2a_\3\2\2\2ab\3\2\2\2bd\3\2\2\2ca\3\2\2"
          + "\2de\7\4\2\2e\t\3\2\2\2fi\5\f\7\2gi\5\16\b\2hf\3\2\2\2hg\3\2\2\2im\3\2"
          + "\2\2jl\5\34\17\2kj\3\2\2\2lo\3\2\2\2mk\3\2\2\2mn\3\2\2\2np\3\2\2\2om\3"
          + "\2\2\2pq\7\4\2\2q\13\3\2\2\2rs\7\n\2\2st\5$\23\2t\r\3\2\2\2uv\7\t\2\2"
          + "vw\5$\23\2w\17\3\2\2\2x{\5\22\n\2y{\5\24\13\2zx\3\2\2\2zy\3\2\2\2{\177"
          + "\3\2\2\2|~\5\34\17\2}|\3\2\2\2~\u0081\3\2\2\2\177}\3\2\2\2\177\u0080\3"
          + "\2\2\2\u0080\u0082\3\2\2\2\u0081\177\3\2\2\2\u0082\u0083\7\4\2\2\u0083"
          + "\21\3\2\2\2\u0084\u0085\7\6\2\2\u0085\u0086\5\36\20\2\u0086\23\3\2\2\2"
          + "\u0087\u0088\7\5\2\2\u0088\u0089\5\36\20\2\u0089\25\3\2\2\2\u008a\u008d"
          + "\5\30\r\2\u008b\u008d\5\32\16\2\u008c\u008a\3\2\2\2\u008c\u008b\3\2\2"
          + "\2\u008d\u0091\3\2\2\2\u008e\u0090\5\34\17\2\u008f\u008e\3\2\2\2\u0090"
          + "\u0093\3\2\2\2\u0091\u008f\3\2\2\2\u0091\u0092\3\2\2\2\u0092\u0094\3\2"
          + "\2\2\u0093\u0091\3\2\2\2\u0094\u0095\7\4\2\2\u0095\27\3\2\2\2\u0096\u0097"
          + "\7\b\2\2\u0097\u0098\5\36\20\2\u0098\31\3\2\2\2\u0099\u009a\7\7\2\2\u009a"
          + "\u009b\5\36\20\2\u009b\33\3\2\2\2\u009c\u009d\7\13\2\2\u009d\u009e\5\""
          + "\22\2\u009e\35\3\2\2\2\u009f\u00a1\5\"\22\2\u00a0\u00a2\5 \21\2\u00a1"
          + "\u00a0\3\2\2\2\u00a1\u00a2\3\2\2\2\u00a2\37\3\2\2\2\u00a3\u00a4\7\f\2"
          + "\2\u00a4\u00a5\5\"\22\2\u00a5!\3\2\2\2\u00a6\u00a7\7\20\2\2\u00a7#\3\2"
          + "\2\2\u00a8\u00aa\5&\24\2\u00a9\u00ab\5 \21\2\u00aa\u00a9\3\2\2\2\u00aa"
          + "\u00ab\3\2\2\2\u00ab%\3\2\2\2\u00ac\u00ad\t\2\2\2\u00ad\'\3\2\2\2\24+"
          + "\64\66;@ITV\\ahmz\177\u008c\u0091\u00a1\u00aa";
  public static final ATN _ATN = new ATNDeserializer().deserialize(_serializedATN.toCharArray());

  static {
    _decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
    for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
      _decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
    }
  }
}
