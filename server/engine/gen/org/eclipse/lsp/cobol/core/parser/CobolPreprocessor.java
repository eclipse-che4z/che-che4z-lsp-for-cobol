// Generated from /Users/leonid/Documents/GitHub/che-che4z-lsp-for-cobol/server/src/main/antlr4/org/eclipse/lsp/cobol/core/parser/CobolPreprocessor.g4 by ANTLR 4.9.2
package org.eclipse.lsp.cobol.core.parser;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class CobolPreprocessor extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		CBL=1, CONTROL=2, COPY=3, BY=4, CR=5, DB=6, END_EXEC=7, ENTER=8, EXEC=9, 
		FILE=10, FUNCTION=11, IDMS=12, IN=13, INCLUDE=14, LEADING=15, LINKAGE=16, 
		LIST=17, MAID=18, MAP=19, MAP_CONTROL=20, MODULE=21, NO=22, NOLIST=23, 
		NOMAP=24, NOSOURCE=25, OF=26, OFF=27, PIC=28, PICTURE=29, PLUSPLUSINCLUDE=30, 
		RECORD=31, REDEFINES=32, REPLACING=33, REPLACE=34, TITLE=35, TRAILING=36, 
		SECTION=37, SOURCE=38, SQL=39, SUPPRESS=40, VERSION=41, EJECT=42, SKIP1=43, 
		SKIP2=44, SKIP3=45, DOUBLEEQUALCHAR=46, EMPTYPSEUDOTEXT=47, PIPECHAR=48, 
		SELECT_ALL=49, ASTERISKCHAR=50, DOUBLEASTERISKCHAR=51, COLONCHAR=52, COMMACHAR=53, 
		COMMENTTAG=54, DOLLARCHAR=55, DOUBLEQUOTE=56, DOT_FS=57, EQUALCHAR=58, 
		LESSTHANCHAR=59, LESSTHANOREQUAL=60, LPARENCHAR=61, MINUSCHAR=62, MORETHANCHAR=63, 
		MORETHANOREQUAL=64, NOTEQUALCHAR=65, PLUSCHAR=66, SEMICOLON_FS=67, SINGLEQUOTE=68, 
		RPARENCHAR=69, SLASHCHAR=70, SQLLINECOMMENTCHAR=71, UNDERSCORECHAR=72, 
		DIALECT_IF=73, ZERO_WIDTH_SPACE=74, LEVEL_NUMBER=75, LEVEL_NUMBER_66=76, 
		LEVEL_NUMBER_77=77, LEVEL_NUMBER_88=78, INTEGERLITERAL=79, SINGLEDIGITLITERAL=80, 
		NUMERICLITERAL=81, NONNUMERICLITERAL=82, CHAR_STRING_CONSTANT=83, IDENTIFIER=84, 
		COPYBOOK_IDENTIFIER=85, FILENAME=86, OCTDIGITS=87, HEX_NUMBERS=88, NEWLINE=89, 
		COMMENTLINE=90, WS=91, SQLLINECOMMENT=92, ERRORCHAR=93, ZERO_DIGIT=94, 
		FINALCHARSTRING=95, CHARSTRING=96, PICTURECHARSGROUP1=97, PICTURECHARSGROUP2=98, 
		WS2=99, LParIntegralRPar=100;
	public static final int
		RULE_startRule = 0, RULE_linkageSection = 1, RULE_copyStatement = 2, RULE_includeStatement = 3, 
		RULE_plusplusIncludeStatement = 4, RULE_copyIdmsStatement = 5, RULE_copyIdmsOptions = 6, 
		RULE_copyIdmsSource = 7, RULE_versionClause = 8, RULE_copyMaidStatement = 9, 
		RULE_copySource = 10, RULE_copyLibrary = 11, RULE_qualifier = 12, RULE_titleDirective = 13, 
		RULE_enterDirective = 14, RULE_routineName = 15, RULE_languageName = 16, 
		RULE_controlDirective = 17, RULE_controlCbl = 18, RULE_controlOptions = 19, 
		RULE_replacingPhrase = 20, RULE_replaceAreaStart = 21, RULE_replaceOffStatement = 22, 
		RULE_replaceClause = 23, RULE_replaceLiteral = 24, RULE_replacePseudoText = 25, 
		RULE_pseudoReplaceable = 26, RULE_pseudoReplacement = 27, RULE_openingPseudoTextDelimiter = 28, 
		RULE_closingPseudoTextDelimiter = 29, RULE_replaceable = 30, RULE_functionCall = 31, 
		RULE_functionName = 32, RULE_argument = 33, RULE_replacement = 34, RULE_charDataLine = 35, 
		RULE_cobolWord = 36, RULE_literal = 37, RULE_integerLiteral = 38;
	private static String[] makeRuleNames() {
		return new String[] {
			"startRule", "linkageSection", "copyStatement", "includeStatement", "plusplusIncludeStatement", 
			"copyIdmsStatement", "copyIdmsOptions", "copyIdmsSource", "versionClause", 
			"copyMaidStatement", "copySource", "copyLibrary", "qualifier", "titleDirective", 
			"enterDirective", "routineName", "languageName", "controlDirective", 
			"controlCbl", "controlOptions", "replacingPhrase", "replaceAreaStart", 
			"replaceOffStatement", "replaceClause", "replaceLiteral", "replacePseudoText", 
			"pseudoReplaceable", "pseudoReplacement", "openingPseudoTextDelimiter", 
			"closingPseudoTextDelimiter", "replaceable", "functionCall", "functionName", 
			"argument", "replacement", "charDataLine", "cobolWord", "literal", "integerLiteral"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, "'=='", "'===='", 
			"'||'", "'.*'", "'*'", "'**'", "':'", "','", "'*>'", "'$'", "'\"'", null, 
			"'='", "'<'", "'<='", "'('", "'-'", "'>'", "'>='", "'<>'", "'+'", null, 
			"'''", "')'", "'/'", "'--'", "'_'", null, "'\u200B'", null, "'66'", "'77'", 
			"'88'", null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, "'0'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "CBL", "CONTROL", "COPY", "BY", "CR", "DB", "END_EXEC", "ENTER", 
			"EXEC", "FILE", "FUNCTION", "IDMS", "IN", "INCLUDE", "LEADING", "LINKAGE", 
			"LIST", "MAID", "MAP", "MAP_CONTROL", "MODULE", "NO", "NOLIST", "NOMAP", 
			"NOSOURCE", "OF", "OFF", "PIC", "PICTURE", "PLUSPLUSINCLUDE", "RECORD", 
			"REDEFINES", "REPLACING", "REPLACE", "TITLE", "TRAILING", "SECTION", 
			"SOURCE", "SQL", "SUPPRESS", "VERSION", "EJECT", "SKIP1", "SKIP2", "SKIP3", 
			"DOUBLEEQUALCHAR", "EMPTYPSEUDOTEXT", "PIPECHAR", "SELECT_ALL", "ASTERISKCHAR", 
			"DOUBLEASTERISKCHAR", "COLONCHAR", "COMMACHAR", "COMMENTTAG", "DOLLARCHAR", 
			"DOUBLEQUOTE", "DOT_FS", "EQUALCHAR", "LESSTHANCHAR", "LESSTHANOREQUAL", 
			"LPARENCHAR", "MINUSCHAR", "MORETHANCHAR", "MORETHANOREQUAL", "NOTEQUALCHAR", 
			"PLUSCHAR", "SEMICOLON_FS", "SINGLEQUOTE", "RPARENCHAR", "SLASHCHAR", 
			"SQLLINECOMMENTCHAR", "UNDERSCORECHAR", "DIALECT_IF", "ZERO_WIDTH_SPACE", 
			"LEVEL_NUMBER", "LEVEL_NUMBER_66", "LEVEL_NUMBER_77", "LEVEL_NUMBER_88", 
			"INTEGERLITERAL", "SINGLEDIGITLITERAL", "NUMERICLITERAL", "NONNUMERICLITERAL", 
			"CHAR_STRING_CONSTANT", "IDENTIFIER", "COPYBOOK_IDENTIFIER", "FILENAME", 
			"OCTDIGITS", "HEX_NUMBERS", "NEWLINE", "COMMENTLINE", "WS", "SQLLINECOMMENT", 
			"ERRORCHAR", "ZERO_DIGIT", "FINALCHARSTRING", "CHARSTRING", "PICTURECHARSGROUP1", 
			"PICTURECHARSGROUP2", "WS2", "LParIntegralRPar"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
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
	public String getGrammarFileName() { return "CobolPreprocessor.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public CobolPreprocessor(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class StartRuleContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(CobolPreprocessor.EOF, 0); }
		public List<IncludeStatementContext> includeStatement() {
			return getRuleContexts(IncludeStatementContext.class);
		}
		public IncludeStatementContext includeStatement(int i) {
			return getRuleContext(IncludeStatementContext.class,i);
		}
		public List<CopyStatementContext> copyStatement() {
			return getRuleContexts(CopyStatementContext.class);
		}
		public CopyStatementContext copyStatement(int i) {
			return getRuleContext(CopyStatementContext.class,i);
		}
		public List<CopyIdmsStatementContext> copyIdmsStatement() {
			return getRuleContexts(CopyIdmsStatementContext.class);
		}
		public CopyIdmsStatementContext copyIdmsStatement(int i) {
			return getRuleContext(CopyIdmsStatementContext.class,i);
		}
		public List<CopyMaidStatementContext> copyMaidStatement() {
			return getRuleContexts(CopyMaidStatementContext.class);
		}
		public CopyMaidStatementContext copyMaidStatement(int i) {
			return getRuleContext(CopyMaidStatementContext.class,i);
		}
		public List<ReplaceAreaStartContext> replaceAreaStart() {
			return getRuleContexts(ReplaceAreaStartContext.class);
		}
		public ReplaceAreaStartContext replaceAreaStart(int i) {
			return getRuleContext(ReplaceAreaStartContext.class,i);
		}
		public List<ReplaceOffStatementContext> replaceOffStatement() {
			return getRuleContexts(ReplaceOffStatementContext.class);
		}
		public ReplaceOffStatementContext replaceOffStatement(int i) {
			return getRuleContext(ReplaceOffStatementContext.class,i);
		}
		public List<TitleDirectiveContext> titleDirective() {
			return getRuleContexts(TitleDirectiveContext.class);
		}
		public TitleDirectiveContext titleDirective(int i) {
			return getRuleContext(TitleDirectiveContext.class,i);
		}
		public List<EnterDirectiveContext> enterDirective() {
			return getRuleContexts(EnterDirectiveContext.class);
		}
		public EnterDirectiveContext enterDirective(int i) {
			return getRuleContext(EnterDirectiveContext.class,i);
		}
		public List<ControlDirectiveContext> controlDirective() {
			return getRuleContexts(ControlDirectiveContext.class);
		}
		public ControlDirectiveContext controlDirective(int i) {
			return getRuleContext(ControlDirectiveContext.class,i);
		}
		public List<LinkageSectionContext> linkageSection() {
			return getRuleContexts(LinkageSectionContext.class);
		}
		public LinkageSectionContext linkageSection(int i) {
			return getRuleContext(LinkageSectionContext.class,i);
		}
		public List<PlusplusIncludeStatementContext> plusplusIncludeStatement() {
			return getRuleContexts(PlusplusIncludeStatementContext.class);
		}
		public PlusplusIncludeStatementContext plusplusIncludeStatement(int i) {
			return getRuleContext(PlusplusIncludeStatementContext.class,i);
		}
		public StartRuleContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_startRule; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterStartRule(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitStartRule(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitStartRule(this);
			else return visitor.visitChildren(this);
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
			setState(81);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,0,_ctx);
			while ( _alt!=1 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1+1 ) {
					{
					{
					setState(78);
					matchWildcard();
					}
					} 
				}
				setState(83);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,0,_ctx);
			}
			setState(107);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << COPY) | (1L << ENTER) | (1L << EXEC) | (1L << LINKAGE) | (1L << PLUSPLUSINCLUDE) | (1L << REPLACE) | (1L << TITLE) | (1L << ASTERISKCHAR))) != 0) || _la==LEVEL_NUMBER) {
				{
				{
				setState(95); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						setState(95);
						_errHandler.sync(this);
						switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
						case 1:
							{
							setState(84);
							includeStatement();
							}
							break;
						case 2:
							{
							setState(85);
							copyStatement();
							}
							break;
						case 3:
							{
							setState(86);
							copyIdmsStatement();
							}
							break;
						case 4:
							{
							setState(87);
							copyMaidStatement();
							}
							break;
						case 5:
							{
							setState(88);
							replaceAreaStart();
							}
							break;
						case 6:
							{
							setState(89);
							replaceOffStatement();
							}
							break;
						case 7:
							{
							setState(90);
							titleDirective();
							}
							break;
						case 8:
							{
							setState(91);
							enterDirective();
							}
							break;
						case 9:
							{
							setState(92);
							controlDirective();
							}
							break;
						case 10:
							{
							setState(93);
							linkageSection();
							}
							break;
						case 11:
							{
							setState(94);
							plusplusIncludeStatement();
							}
							break;
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(97); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(102);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,3,_ctx);
				while ( _alt!=1 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1+1 ) {
						{
						{
						setState(99);
						matchWildcard();
						}
						} 
					}
					setState(104);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,3,_ctx);
				}
				}
				}
				setState(109);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(110);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LinkageSectionContext extends ParserRuleContext {
		public TerminalNode LINKAGE() { return getToken(CobolPreprocessor.LINKAGE, 0); }
		public TerminalNode SECTION() { return getToken(CobolPreprocessor.SECTION, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public LinkageSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_linkageSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterLinkageSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitLinkageSection(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitLinkageSection(this);
			else return visitor.visitChildren(this);
		}
	}

	public final LinkageSectionContext linkageSection() throws RecognitionException {
		LinkageSectionContext _localctx = new LinkageSectionContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_linkageSection);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(112);
			match(LINKAGE);
			setState(113);
			match(SECTION);
			setState(114);
			match(DOT_FS);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyStatementContext extends ParserRuleContext {
		public TerminalNode COPY() { return getToken(CobolPreprocessor.COPY, 0); }
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public ReplacingPhraseContext replacingPhrase() {
			return getRuleContext(ReplacingPhraseContext.class,0);
		}
		public TerminalNode SUPPRESS() { return getToken(CobolPreprocessor.SUPPRESS, 0); }
		public CopyStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopyStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopyStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopyStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopyStatementContext copyStatement() throws RecognitionException {
		CopyStatementContext _localctx = new CopyStatementContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_copyStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(116);
			match(COPY);
			setState(117);
			copySource();
			setState(120);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case REPLACING:
				{
				setState(118);
				replacingPhrase();
				}
				break;
			case SUPPRESS:
				{
				setState(119);
				match(SUPPRESS);
				}
				break;
			case DOT_FS:
				break;
			default:
				break;
			}
			setState(122);
			match(DOT_FS);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IncludeStatementContext extends ParserRuleContext {
		public TerminalNode EXEC() { return getToken(CobolPreprocessor.EXEC, 0); }
		public TerminalNode SQL() { return getToken(CobolPreprocessor.SQL, 0); }
		public TerminalNode INCLUDE() { return getToken(CobolPreprocessor.INCLUDE, 0); }
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public TerminalNode END_EXEC() { return getToken(CobolPreprocessor.END_EXEC, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public IncludeStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_includeStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterIncludeStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitIncludeStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitIncludeStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final IncludeStatementContext includeStatement() throws RecognitionException {
		IncludeStatementContext _localctx = new IncludeStatementContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_includeStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(124);
			match(EXEC);
			setState(125);
			match(SQL);
			setState(126);
			match(INCLUDE);
			setState(127);
			copySource();
			setState(128);
			match(END_EXEC);
			setState(129);
			match(DOT_FS);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PlusplusIncludeStatementContext extends ParserRuleContext {
		public TerminalNode PLUSPLUSINCLUDE() { return getToken(CobolPreprocessor.PLUSPLUSINCLUDE, 0); }
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public TerminalNode SEMICOLON_FS() { return getToken(CobolPreprocessor.SEMICOLON_FS, 0); }
		public PlusplusIncludeStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_plusplusIncludeStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterPlusplusIncludeStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitPlusplusIncludeStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitPlusplusIncludeStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PlusplusIncludeStatementContext plusplusIncludeStatement() throws RecognitionException {
		PlusplusIncludeStatementContext _localctx = new PlusplusIncludeStatementContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_plusplusIncludeStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(131);
			match(PLUSPLUSINCLUDE);
			setState(132);
			copySource();
			setState(134);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,6,_ctx) ) {
			case 1:
				{
				setState(133);
				_la = _input.LA(1);
				if ( !(_la==DOT_FS || _la==SEMICOLON_FS) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyIdmsStatementContext extends ParserRuleContext {
		public TerminalNode COPY() { return getToken(CobolPreprocessor.COPY, 0); }
		public TerminalNode IDMS() { return getToken(CobolPreprocessor.IDMS, 0); }
		public CopyIdmsOptionsContext copyIdmsOptions() {
			return getRuleContext(CopyIdmsOptionsContext.class,0);
		}
		public TerminalNode LEVEL_NUMBER() { return getToken(CobolPreprocessor.LEVEL_NUMBER, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public TerminalNode SEMICOLON_FS() { return getToken(CobolPreprocessor.SEMICOLON_FS, 0); }
		public CopyIdmsStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyIdmsStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopyIdmsStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopyIdmsStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopyIdmsStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopyIdmsStatementContext copyIdmsStatement() throws RecognitionException {
		CopyIdmsStatementContext _localctx = new CopyIdmsStatementContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_copyIdmsStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(137);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==LEVEL_NUMBER) {
				{
				setState(136);
				match(LEVEL_NUMBER);
				}
			}

			setState(139);
			match(COPY);
			setState(140);
			match(IDMS);
			setState(141);
			copyIdmsOptions();
			setState(143);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,8,_ctx) ) {
			case 1:
				{
				setState(142);
				_la = _input.LA(1);
				if ( !(_la==DOT_FS || _la==SEMICOLON_FS) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyIdmsOptionsContext extends ParserRuleContext {
		public TerminalNode RECORD() { return getToken(CobolPreprocessor.RECORD, 0); }
		public CopyIdmsSourceContext copyIdmsSource() {
			return getRuleContext(CopyIdmsSourceContext.class,0);
		}
		public VersionClauseContext versionClause() {
			return getRuleContext(VersionClauseContext.class,0);
		}
		public TerminalNode REDEFINES() { return getToken(CobolPreprocessor.REDEFINES, 0); }
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public TerminalNode FILE() { return getToken(CobolPreprocessor.FILE, 0); }
		public TerminalNode MAP() { return getToken(CobolPreprocessor.MAP, 0); }
		public TerminalNode MAP_CONTROL() { return getToken(CobolPreprocessor.MAP_CONTROL, 0); }
		public TerminalNode MODULE() { return getToken(CobolPreprocessor.MODULE, 0); }
		public CopyIdmsOptionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyIdmsOptions; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopyIdmsOptions(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopyIdmsOptions(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopyIdmsOptions(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopyIdmsOptionsContext copyIdmsOptions() throws RecognitionException {
		CopyIdmsOptionsContext _localctx = new CopyIdmsOptionsContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_copyIdmsOptions);
		int _la;
		try {
			setState(168);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				{
				setState(145);
				match(RECORD);
				setState(146);
				copyIdmsSource();
				setState(148);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,9,_ctx) ) {
				case 1:
					{
					setState(147);
					versionClause();
					}
					break;
				}
				setState(152);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,10,_ctx) ) {
				case 1:
					{
					setState(150);
					match(REDEFINES);
					setState(151);
					cobolWord();
					}
					break;
				}
				}
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				{
				setState(154);
				match(FILE);
				setState(155);
				copyIdmsSource();
				setState(157);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
				case 1:
					{
					setState(156);
					versionClause();
					}
					break;
				}
				}
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				{
				setState(159);
				_la = _input.LA(1);
				if ( !(_la==MAP || _la==MAP_CONTROL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(160);
				copyIdmsSource();
				}
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				{
				setState(162);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==MODULE) {
					{
					setState(161);
					match(MODULE);
					}
				}

				setState(164);
				copyIdmsSource();
				setState(166);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,13,_ctx) ) {
				case 1:
					{
					setState(165);
					versionClause();
					}
					break;
				}
				}
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyIdmsSourceContext extends ParserRuleContext {
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public CopyIdmsSourceContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyIdmsSource; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopyIdmsSource(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopyIdmsSource(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopyIdmsSource(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopyIdmsSourceContext copyIdmsSource() throws RecognitionException {
		CopyIdmsSourceContext _localctx = new CopyIdmsSourceContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_copyIdmsSource);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(170);
			copySource();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VersionClauseContext extends ParserRuleContext {
		public TerminalNode VERSION() { return getToken(CobolPreprocessor.VERSION, 0); }
		public IntegerLiteralContext integerLiteral() {
			return getRuleContext(IntegerLiteralContext.class,0);
		}
		public VersionClauseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_versionClause; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterVersionClause(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitVersionClause(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitVersionClause(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VersionClauseContext versionClause() throws RecognitionException {
		VersionClauseContext _localctx = new VersionClauseContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_versionClause);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(172);
			match(VERSION);
			setState(173);
			integerLiteral();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyMaidStatementContext extends ParserRuleContext {
		public TerminalNode COPY() { return getToken(CobolPreprocessor.COPY, 0); }
		public TerminalNode MAID() { return getToken(CobolPreprocessor.MAID, 0); }
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public TerminalNode LEVEL_NUMBER() { return getToken(CobolPreprocessor.LEVEL_NUMBER, 0); }
		public QualifierContext qualifier() {
			return getRuleContext(QualifierContext.class,0);
		}
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public CopyMaidStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyMaidStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopyMaidStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopyMaidStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopyMaidStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopyMaidStatementContext copyMaidStatement() throws RecognitionException {
		CopyMaidStatementContext _localctx = new CopyMaidStatementContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_copyMaidStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(176);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==LEVEL_NUMBER) {
				{
				setState(175);
				match(LEVEL_NUMBER);
				}
			}

			setState(178);
			match(COPY);
			setState(179);
			match(MAID);
			setState(180);
			copySource();
			setState(182);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				{
				setState(181);
				qualifier();
				}
				break;
			}
			setState(185);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
			case 1:
				{
				setState(184);
				match(DOT_FS);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopySourceContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CopyLibraryContext copyLibrary() {
			return getRuleContext(CopyLibraryContext.class,0);
		}
		public TerminalNode OF() { return getToken(CobolPreprocessor.OF, 0); }
		public TerminalNode IN() { return getToken(CobolPreprocessor.IN, 0); }
		public CopySourceContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copySource; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopySource(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopySource(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopySource(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopySourceContext copySource() throws RecognitionException {
		CopySourceContext _localctx = new CopySourceContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_copySource);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(189);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				{
				setState(187);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				{
				setState(188);
				cobolWord();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(193);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
			case 1:
				{
				setState(191);
				_la = _input.LA(1);
				if ( !(_la==IN || _la==OF) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(192);
				copyLibrary();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyLibraryContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CopyLibraryContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyLibrary; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCopyLibrary(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCopyLibrary(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCopyLibrary(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CopyLibraryContext copyLibrary() throws RecognitionException {
		CopyLibraryContext _localctx = new CopyLibraryContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_copyLibrary);
		try {
			setState(197);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(195);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(196);
				cobolWord();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class QualifierContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public QualifierContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_qualifier; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterQualifier(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitQualifier(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitQualifier(this);
			else return visitor.visitChildren(this);
		}
	}

	public final QualifierContext qualifier() throws RecognitionException {
		QualifierContext _localctx = new QualifierContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_qualifier);
		try {
			setState(201);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(199);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(200);
				cobolWord();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TitleDirectiveContext extends ParserRuleContext {
		public TerminalNode TITLE() { return getToken(CobolPreprocessor.TITLE, 0); }
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public TitleDirectiveContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_titleDirective; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterTitleDirective(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitTitleDirective(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitTitleDirective(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TitleDirectiveContext titleDirective() throws RecognitionException {
		TitleDirectiveContext _localctx = new TitleDirectiveContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_titleDirective);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(203);
			match(TITLE);
			setState(204);
			literal();
			setState(206);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,22,_ctx) ) {
			case 1:
				{
				setState(205);
				match(DOT_FS);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class EnterDirectiveContext extends ParserRuleContext {
		public TerminalNode ENTER() { return getToken(CobolPreprocessor.ENTER, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public LanguageNameContext languageName() {
			return getRuleContext(LanguageNameContext.class,0);
		}
		public RoutineNameContext routineName() {
			return getRuleContext(RoutineNameContext.class,0);
		}
		public EnterDirectiveContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_enterDirective; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterEnterDirective(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitEnterDirective(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitEnterDirective(this);
			else return visitor.visitChildren(this);
		}
	}

	public final EnterDirectiveContext enterDirective() throws RecognitionException {
		EnterDirectiveContext _localctx = new EnterDirectiveContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_enterDirective);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(208);
			match(ENTER);
			setState(210);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,23,_ctx) ) {
			case 1:
				{
				setState(209);
				languageName();
				}
				break;
			}
			setState(213);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LINKAGE) | (1L << LIST) | (1L << MAID) | (1L << MAP) | (1L << NOLIST) | (1L << NOMAP) | (1L << NOSOURCE) | (1L << SECTION) | (1L << SOURCE))) != 0) || _la==IDENTIFIER || _la==COPYBOOK_IDENTIFIER) {
				{
				setState(212);
				routineName();
				}
			}

			setState(215);
			match(DOT_FS);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class RoutineNameContext extends ParserRuleContext {
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public RoutineNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_routineName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterRoutineName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitRoutineName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitRoutineName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final RoutineNameContext routineName() throws RecognitionException {
		RoutineNameContext _localctx = new RoutineNameContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_routineName);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(217);
			cobolWord();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LanguageNameContext extends ParserRuleContext {
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public LanguageNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_languageName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterLanguageName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitLanguageName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitLanguageName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final LanguageNameContext languageName() throws RecognitionException {
		LanguageNameContext _localctx = new LanguageNameContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_languageName);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(219);
			cobolWord();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ControlDirectiveContext extends ParserRuleContext {
		public TerminalNode ASTERISKCHAR() { return getToken(CobolPreprocessor.ASTERISKCHAR, 0); }
		public ControlCblContext controlCbl() {
			return getRuleContext(ControlCblContext.class,0);
		}
		public List<ControlOptionsContext> controlOptions() {
			return getRuleContexts(ControlOptionsContext.class);
		}
		public ControlOptionsContext controlOptions(int i) {
			return getRuleContext(ControlOptionsContext.class,i);
		}
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public ControlDirectiveContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_controlDirective; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterControlDirective(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitControlDirective(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitControlDirective(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ControlDirectiveContext controlDirective() throws RecognitionException {
		ControlDirectiveContext _localctx = new ControlDirectiveContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_controlDirective);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(221);
			match(ASTERISKCHAR);
			setState(222);
			controlCbl();
			setState(226);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(223);
					controlOptions();
					}
					} 
				}
				setState(228);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			}
			setState(230);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,26,_ctx) ) {
			case 1:
				{
				setState(229);
				match(DOT_FS);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ControlCblContext extends ParserRuleContext {
		public TerminalNode CONTROL() { return getToken(CobolPreprocessor.CONTROL, 0); }
		public TerminalNode CBL() { return getToken(CobolPreprocessor.CBL, 0); }
		public ControlCblContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_controlCbl; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterControlCbl(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitControlCbl(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitControlCbl(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ControlCblContext controlCbl() throws RecognitionException {
		ControlCblContext _localctx = new ControlCblContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_controlCbl);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(232);
			_la = _input.LA(1);
			if ( !(_la==CBL || _la==CONTROL) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ControlOptionsContext extends ParserRuleContext {
		public TerminalNode SOURCE() { return getToken(CobolPreprocessor.SOURCE, 0); }
		public TerminalNode NOSOURCE() { return getToken(CobolPreprocessor.NOSOURCE, 0); }
		public TerminalNode LIST() { return getToken(CobolPreprocessor.LIST, 0); }
		public TerminalNode NOLIST() { return getToken(CobolPreprocessor.NOLIST, 0); }
		public TerminalNode MAP() { return getToken(CobolPreprocessor.MAP, 0); }
		public TerminalNode NOMAP() { return getToken(CobolPreprocessor.NOMAP, 0); }
		public ControlOptionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_controlOptions; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterControlOptions(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitControlOptions(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitControlOptions(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ControlOptionsContext controlOptions() throws RecognitionException {
		ControlOptionsContext _localctx = new ControlOptionsContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_controlOptions);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(234);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LIST) | (1L << MAP) | (1L << NOLIST) | (1L << NOMAP) | (1L << NOSOURCE) | (1L << SOURCE))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplacingPhraseContext extends ParserRuleContext {
		public TerminalNode REPLACING() { return getToken(CobolPreprocessor.REPLACING, 0); }
		public List<ReplaceClauseContext> replaceClause() {
			return getRuleContexts(ReplaceClauseContext.class);
		}
		public ReplaceClauseContext replaceClause(int i) {
			return getRuleContext(ReplaceClauseContext.class,i);
		}
		public ReplacingPhraseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replacingPhrase; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplacingPhrase(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplacingPhrase(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplacingPhrase(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplacingPhraseContext replacingPhrase() throws RecognitionException {
		ReplacingPhraseContext _localctx = new ReplacingPhraseContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_replacingPhrase);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(236);
			match(REPLACING);
			setState(238); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(237);
					replaceClause();
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(240); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceAreaStartContext extends ParserRuleContext {
		public TerminalNode REPLACE() { return getToken(CobolPreprocessor.REPLACE, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public List<ReplacePseudoTextContext> replacePseudoText() {
			return getRuleContexts(ReplacePseudoTextContext.class);
		}
		public ReplacePseudoTextContext replacePseudoText(int i) {
			return getRuleContext(ReplacePseudoTextContext.class,i);
		}
		public ReplaceAreaStartContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceAreaStart; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplaceAreaStart(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplaceAreaStart(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplaceAreaStart(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplaceAreaStartContext replaceAreaStart() throws RecognitionException {
		ReplaceAreaStartContext _localctx = new ReplaceAreaStartContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_replaceAreaStart);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(242);
			match(REPLACE);
			setState(244); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(243);
				replacePseudoText();
				}
				}
				setState(246); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LEADING) | (1L << TRAILING) | (1L << DOUBLEEQUALCHAR))) != 0) );
			setState(248);
			match(DOT_FS);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceOffStatementContext extends ParserRuleContext {
		public TerminalNode REPLACE() { return getToken(CobolPreprocessor.REPLACE, 0); }
		public TerminalNode OFF() { return getToken(CobolPreprocessor.OFF, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public ReplaceOffStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceOffStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplaceOffStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplaceOffStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplaceOffStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplaceOffStatementContext replaceOffStatement() throws RecognitionException {
		ReplaceOffStatementContext _localctx = new ReplaceOffStatementContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_replaceOffStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(250);
			match(REPLACE);
			setState(251);
			match(OFF);
			setState(252);
			match(DOT_FS);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceClauseContext extends ParserRuleContext {
		public ReplacePseudoTextContext replacePseudoText() {
			return getRuleContext(ReplacePseudoTextContext.class,0);
		}
		public ReplaceLiteralContext replaceLiteral() {
			return getRuleContext(ReplaceLiteralContext.class,0);
		}
		public ReplaceClauseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceClause; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplaceClause(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplaceClause(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplaceClause(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplaceClauseContext replaceClause() throws RecognitionException {
		ReplaceClauseContext _localctx = new ReplaceClauseContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_replaceClause);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(256);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEADING:
			case TRAILING:
			case DOUBLEEQUALCHAR:
				{
				setState(254);
				replacePseudoText();
				}
				break;
			case FUNCTION:
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case DOT_FS:
			case LPARENCHAR:
			case RPARENCHAR:
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
			case FILENAME:
				{
				setState(255);
				replaceLiteral();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceLiteralContext extends ParserRuleContext {
		public ReplaceableContext replaceable() {
			return getRuleContext(ReplaceableContext.class,0);
		}
		public TerminalNode BY() { return getToken(CobolPreprocessor.BY, 0); }
		public ReplacementContext replacement() {
			return getRuleContext(ReplacementContext.class,0);
		}
		public ReplaceLiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceLiteral; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplaceLiteral(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplaceLiteral(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplaceLiteral(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplaceLiteralContext replaceLiteral() throws RecognitionException {
		ReplaceLiteralContext _localctx = new ReplaceLiteralContext(_ctx, getState());
		enterRule(_localctx, 48, RULE_replaceLiteral);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(258);
			replaceable();
			setState(259);
			match(BY);
			setState(260);
			replacement();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplacePseudoTextContext extends ParserRuleContext {
		public PseudoReplaceableContext pseudoReplaceable() {
			return getRuleContext(PseudoReplaceableContext.class,0);
		}
		public TerminalNode BY() { return getToken(CobolPreprocessor.BY, 0); }
		public PseudoReplacementContext pseudoReplacement() {
			return getRuleContext(PseudoReplacementContext.class,0);
		}
		public TerminalNode LEADING() { return getToken(CobolPreprocessor.LEADING, 0); }
		public TerminalNode TRAILING() { return getToken(CobolPreprocessor.TRAILING, 0); }
		public ReplacePseudoTextContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replacePseudoText; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplacePseudoText(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplacePseudoText(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplacePseudoText(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplacePseudoTextContext replacePseudoText() throws RecognitionException {
		ReplacePseudoTextContext _localctx = new ReplacePseudoTextContext(_ctx, getState());
		enterRule(_localctx, 50, RULE_replacePseudoText);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(263);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==LEADING || _la==TRAILING) {
				{
				setState(262);
				_la = _input.LA(1);
				if ( !(_la==LEADING || _la==TRAILING) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
			}

			setState(265);
			pseudoReplaceable();
			setState(266);
			match(BY);
			setState(267);
			pseudoReplacement();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PseudoReplaceableContext extends ParserRuleContext {
		public OpeningPseudoTextDelimiterContext openingPseudoTextDelimiter() {
			return getRuleContext(OpeningPseudoTextDelimiterContext.class,0);
		}
		public ClosingPseudoTextDelimiterContext closingPseudoTextDelimiter() {
			return getRuleContext(ClosingPseudoTextDelimiterContext.class,0);
		}
		public List<TerminalNode> DOUBLEEQUALCHAR() { return getTokens(CobolPreprocessor.DOUBLEEQUALCHAR); }
		public TerminalNode DOUBLEEQUALCHAR(int i) {
			return getToken(CobolPreprocessor.DOUBLEEQUALCHAR, i);
		}
		public PseudoReplaceableContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_pseudoReplaceable; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterPseudoReplaceable(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitPseudoReplaceable(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitPseudoReplaceable(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PseudoReplaceableContext pseudoReplaceable() throws RecognitionException {
		PseudoReplaceableContext _localctx = new PseudoReplaceableContext(_ctx, getState());
		enterRule(_localctx, 52, RULE_pseudoReplaceable);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(269);
			openingPseudoTextDelimiter();
			setState(273);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,31,_ctx);
			while ( _alt!=1 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1+1 ) {
					{
					{
					setState(270);
					_la = _input.LA(1);
					if ( _la <= 0 || (_la==DOUBLEEQUALCHAR) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
					} 
				}
				setState(275);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,31,_ctx);
			}
			setState(276);
			closingPseudoTextDelimiter();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PseudoReplacementContext extends ParserRuleContext {
		public OpeningPseudoTextDelimiterContext openingPseudoTextDelimiter() {
			return getRuleContext(OpeningPseudoTextDelimiterContext.class,0);
		}
		public ClosingPseudoTextDelimiterContext closingPseudoTextDelimiter() {
			return getRuleContext(ClosingPseudoTextDelimiterContext.class,0);
		}
		public List<TerminalNode> DOUBLEEQUALCHAR() { return getTokens(CobolPreprocessor.DOUBLEEQUALCHAR); }
		public TerminalNode DOUBLEEQUALCHAR(int i) {
			return getToken(CobolPreprocessor.DOUBLEEQUALCHAR, i);
		}
		public TerminalNode EMPTYPSEUDOTEXT() { return getToken(CobolPreprocessor.EMPTYPSEUDOTEXT, 0); }
		public PseudoReplacementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_pseudoReplacement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterPseudoReplacement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitPseudoReplacement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitPseudoReplacement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PseudoReplacementContext pseudoReplacement() throws RecognitionException {
		PseudoReplacementContext _localctx = new PseudoReplacementContext(_ctx, getState());
		enterRule(_localctx, 54, RULE_pseudoReplacement);
		int _la;
		try {
			int _alt;
			setState(288);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case DOUBLEEQUALCHAR:
				enterOuterAlt(_localctx, 1);
				{
				{
				setState(278);
				openingPseudoTextDelimiter();
				setState(282);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
				while ( _alt!=1 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1+1 ) {
						{
						{
						setState(279);
						_la = _input.LA(1);
						if ( _la <= 0 || (_la==DOUBLEEQUALCHAR) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						} 
					}
					setState(284);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
				}
				setState(285);
				closingPseudoTextDelimiter();
				}
				}
				break;
			case EMPTYPSEUDOTEXT:
				enterOuterAlt(_localctx, 2);
				{
				setState(287);
				match(EMPTYPSEUDOTEXT);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class OpeningPseudoTextDelimiterContext extends ParserRuleContext {
		public TerminalNode DOUBLEEQUALCHAR() { return getToken(CobolPreprocessor.DOUBLEEQUALCHAR, 0); }
		public OpeningPseudoTextDelimiterContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_openingPseudoTextDelimiter; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterOpeningPseudoTextDelimiter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitOpeningPseudoTextDelimiter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitOpeningPseudoTextDelimiter(this);
			else return visitor.visitChildren(this);
		}
	}

	public final OpeningPseudoTextDelimiterContext openingPseudoTextDelimiter() throws RecognitionException {
		OpeningPseudoTextDelimiterContext _localctx = new OpeningPseudoTextDelimiterContext(_ctx, getState());
		enterRule(_localctx, 56, RULE_openingPseudoTextDelimiter);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(290);
			match(DOUBLEEQUALCHAR);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClosingPseudoTextDelimiterContext extends ParserRuleContext {
		public TerminalNode DOUBLEEQUALCHAR() { return getToken(CobolPreprocessor.DOUBLEEQUALCHAR, 0); }
		public TerminalNode COMMACHAR() { return getToken(CobolPreprocessor.COMMACHAR, 0); }
		public TerminalNode DOT_FS() { return getToken(CobolPreprocessor.DOT_FS, 0); }
		public TerminalNode SEMICOLON_FS() { return getToken(CobolPreprocessor.SEMICOLON_FS, 0); }
		public ClosingPseudoTextDelimiterContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_closingPseudoTextDelimiter; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterClosingPseudoTextDelimiter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitClosingPseudoTextDelimiter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitClosingPseudoTextDelimiter(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClosingPseudoTextDelimiterContext closingPseudoTextDelimiter() throws RecognitionException {
		ClosingPseudoTextDelimiterContext _localctx = new ClosingPseudoTextDelimiterContext(_ctx, getState());
		enterRule(_localctx, 58, RULE_closingPseudoTextDelimiter);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(292);
			match(DOUBLEEQUALCHAR);
			setState(294);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,34,_ctx) ) {
			case 1:
				{
				setState(293);
				_la = _input.LA(1);
				if ( !(((((_la - 53)) & ~0x3f) == 0 && ((1L << (_la - 53)) & ((1L << (COMMACHAR - 53)) | (1L << (DOT_FS - 53)) | (1L << (SEMICOLON_FS - 53)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceableContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CharDataLineContext charDataLine() {
			return getRuleContext(CharDataLineContext.class,0);
		}
		public FunctionCallContext functionCall() {
			return getRuleContext(FunctionCallContext.class,0);
		}
		public ReplaceableContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceable; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplaceable(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplaceable(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplaceable(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplaceableContext replaceable() throws RecognitionException {
		ReplaceableContext _localctx = new ReplaceableContext(_ctx, getState());
		enterRule(_localctx, 60, RULE_replaceable);
		try {
			setState(300);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(296);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(297);
				cobolWord();
				}
				break;
			case DOT_FS:
			case LPARENCHAR:
			case RPARENCHAR:
			case FILENAME:
				enterOuterAlt(_localctx, 3);
				{
				setState(298);
				charDataLine();
				}
				break;
			case FUNCTION:
				enterOuterAlt(_localctx, 4);
				{
				setState(299);
				functionCall();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FunctionCallContext extends ParserRuleContext {
		public TerminalNode FUNCTION() { return getToken(CobolPreprocessor.FUNCTION, 0); }
		public FunctionNameContext functionName() {
			return getRuleContext(FunctionNameContext.class,0);
		}
		public TerminalNode LPARENCHAR() { return getToken(CobolPreprocessor.LPARENCHAR, 0); }
		public List<ArgumentContext> argument() {
			return getRuleContexts(ArgumentContext.class);
		}
		public ArgumentContext argument(int i) {
			return getRuleContext(ArgumentContext.class,i);
		}
		public TerminalNode RPARENCHAR() { return getToken(CobolPreprocessor.RPARENCHAR, 0); }
		public List<TerminalNode> COMMACHAR() { return getTokens(CobolPreprocessor.COMMACHAR); }
		public TerminalNode COMMACHAR(int i) {
			return getToken(CobolPreprocessor.COMMACHAR, i);
		}
		public FunctionCallContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_functionCall; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterFunctionCall(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitFunctionCall(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitFunctionCall(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionCallContext functionCall() throws RecognitionException {
		FunctionCallContext _localctx = new FunctionCallContext(_ctx, getState());
		enterRule(_localctx, 62, RULE_functionCall);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(302);
			match(FUNCTION);
			setState(303);
			functionName();
			{
			setState(304);
			match(LPARENCHAR);
			setState(305);
			argument();
			setState(312);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,37,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(307);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==COMMACHAR) {
						{
						setState(306);
						match(COMMACHAR);
						}
					}

					setState(309);
					argument();
					}
					} 
				}
				setState(314);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,37,_ctx);
			}
			setState(315);
			match(RPARENCHAR);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FunctionNameContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CharDataLineContext charDataLine() {
			return getRuleContext(CharDataLineContext.class,0);
		}
		public FunctionNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_functionName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterFunctionName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitFunctionName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitFunctionName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionNameContext functionName() throws RecognitionException {
		FunctionNameContext _localctx = new FunctionNameContext(_ctx, getState());
		enterRule(_localctx, 64, RULE_functionName);
		try {
			setState(320);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(317);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(318);
				cobolWord();
				}
				break;
			case DOT_FS:
			case LPARENCHAR:
			case RPARENCHAR:
			case FILENAME:
				enterOuterAlt(_localctx, 3);
				{
				setState(319);
				charDataLine();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArgumentContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CharDataLineContext charDataLine() {
			return getRuleContext(CharDataLineContext.class,0);
		}
		public ArgumentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_argument; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterArgument(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitArgument(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitArgument(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ArgumentContext argument() throws RecognitionException {
		ArgumentContext _localctx = new ArgumentContext(_ctx, getState());
		enterRule(_localctx, 66, RULE_argument);
		try {
			setState(325);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(322);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(323);
				cobolWord();
				}
				break;
			case DOT_FS:
			case LPARENCHAR:
			case RPARENCHAR:
			case FILENAME:
				enterOuterAlt(_localctx, 3);
				{
				setState(324);
				charDataLine();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplacementContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CharDataLineContext charDataLine() {
			return getRuleContext(CharDataLineContext.class,0);
		}
		public FunctionCallContext functionCall() {
			return getRuleContext(FunctionCallContext.class,0);
		}
		public ReplacementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replacement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterReplacement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitReplacement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitReplacement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ReplacementContext replacement() throws RecognitionException {
		ReplacementContext _localctx = new ReplacementContext(_ctx, getState());
		enterRule(_localctx, 68, RULE_replacement);
		try {
			setState(331);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LEVEL_NUMBER:
			case LEVEL_NUMBER_66:
			case LEVEL_NUMBER_77:
			case LEVEL_NUMBER_88:
			case INTEGERLITERAL:
			case NUMERICLITERAL:
			case NONNUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(327);
				literal();
				}
				break;
			case LINKAGE:
			case LIST:
			case MAID:
			case MAP:
			case NOLIST:
			case NOMAP:
			case NOSOURCE:
			case SECTION:
			case SOURCE:
			case IDENTIFIER:
			case COPYBOOK_IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(328);
				cobolWord();
				}
				break;
			case DOT_FS:
			case LPARENCHAR:
			case RPARENCHAR:
			case FILENAME:
				enterOuterAlt(_localctx, 3);
				{
				setState(329);
				charDataLine();
				}
				break;
			case FUNCTION:
				enterOuterAlt(_localctx, 4);
				{
				setState(330);
				functionCall();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CharDataLineContext extends ParserRuleContext {
		public List<TerminalNode> FILENAME() { return getTokens(CobolPreprocessor.FILENAME); }
		public TerminalNode FILENAME(int i) {
			return getToken(CobolPreprocessor.FILENAME, i);
		}
		public List<TerminalNode> DOT_FS() { return getTokens(CobolPreprocessor.DOT_FS); }
		public TerminalNode DOT_FS(int i) {
			return getToken(CobolPreprocessor.DOT_FS, i);
		}
		public List<TerminalNode> LPARENCHAR() { return getTokens(CobolPreprocessor.LPARENCHAR); }
		public TerminalNode LPARENCHAR(int i) {
			return getToken(CobolPreprocessor.LPARENCHAR, i);
		}
		public List<TerminalNode> RPARENCHAR() { return getTokens(CobolPreprocessor.RPARENCHAR); }
		public TerminalNode RPARENCHAR(int i) {
			return getToken(CobolPreprocessor.RPARENCHAR, i);
		}
		public CharDataLineContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_charDataLine; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCharDataLine(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCharDataLine(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCharDataLine(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CharDataLineContext charDataLine() throws RecognitionException {
		CharDataLineContext _localctx = new CharDataLineContext(_ctx, getState());
		enterRule(_localctx, 70, RULE_charDataLine);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(334); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(333);
					_la = _input.LA(1);
					if ( !(((((_la - 57)) & ~0x3f) == 0 && ((1L << (_la - 57)) & ((1L << (DOT_FS - 57)) | (1L << (LPARENCHAR - 57)) | (1L << (RPARENCHAR - 57)) | (1L << (FILENAME - 57)))) != 0)) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(336); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,41,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CobolWordContext extends ParserRuleContext {
		public TerminalNode COPYBOOK_IDENTIFIER() { return getToken(CobolPreprocessor.COPYBOOK_IDENTIFIER, 0); }
		public TerminalNode IDENTIFIER() { return getToken(CobolPreprocessor.IDENTIFIER, 0); }
		public TerminalNode MAID() { return getToken(CobolPreprocessor.MAID, 0); }
		public TerminalNode SOURCE() { return getToken(CobolPreprocessor.SOURCE, 0); }
		public TerminalNode NOSOURCE() { return getToken(CobolPreprocessor.NOSOURCE, 0); }
		public TerminalNode LIST() { return getToken(CobolPreprocessor.LIST, 0); }
		public TerminalNode NOLIST() { return getToken(CobolPreprocessor.NOLIST, 0); }
		public TerminalNode MAP() { return getToken(CobolPreprocessor.MAP, 0); }
		public TerminalNode NOMAP() { return getToken(CobolPreprocessor.NOMAP, 0); }
		public TerminalNode LINKAGE() { return getToken(CobolPreprocessor.LINKAGE, 0); }
		public TerminalNode SECTION() { return getToken(CobolPreprocessor.SECTION, 0); }
		public CobolWordContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_cobolWord; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterCobolWord(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitCobolWord(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitCobolWord(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CobolWordContext cobolWord() throws RecognitionException {
		CobolWordContext _localctx = new CobolWordContext(_ctx, getState());
		enterRule(_localctx, 72, RULE_cobolWord);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(338);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LINKAGE) | (1L << LIST) | (1L << MAID) | (1L << MAP) | (1L << NOLIST) | (1L << NOMAP) | (1L << NOSOURCE) | (1L << SECTION) | (1L << SOURCE))) != 0) || _la==IDENTIFIER || _la==COPYBOOK_IDENTIFIER) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LiteralContext extends ParserRuleContext {
		public TerminalNode NONNUMERICLITERAL() { return getToken(CobolPreprocessor.NONNUMERICLITERAL, 0); }
		public TerminalNode NUMERICLITERAL() { return getToken(CobolPreprocessor.NUMERICLITERAL, 0); }
		public TerminalNode INTEGERLITERAL() { return getToken(CobolPreprocessor.INTEGERLITERAL, 0); }
		public TerminalNode LEVEL_NUMBER() { return getToken(CobolPreprocessor.LEVEL_NUMBER, 0); }
		public TerminalNode LEVEL_NUMBER_66() { return getToken(CobolPreprocessor.LEVEL_NUMBER_66, 0); }
		public TerminalNode LEVEL_NUMBER_77() { return getToken(CobolPreprocessor.LEVEL_NUMBER_77, 0); }
		public TerminalNode LEVEL_NUMBER_88() { return getToken(CobolPreprocessor.LEVEL_NUMBER_88, 0); }
		public LiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_literal; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterLiteral(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitLiteral(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitLiteral(this);
			else return visitor.visitChildren(this);
		}
	}

	public final LiteralContext literal() throws RecognitionException {
		LiteralContext _localctx = new LiteralContext(_ctx, getState());
		enterRule(_localctx, 74, RULE_literal);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(340);
			_la = _input.LA(1);
			if ( !(((((_la - 75)) & ~0x3f) == 0 && ((1L << (_la - 75)) & ((1L << (LEVEL_NUMBER - 75)) | (1L << (LEVEL_NUMBER_66 - 75)) | (1L << (LEVEL_NUMBER_77 - 75)) | (1L << (LEVEL_NUMBER_88 - 75)) | (1L << (INTEGERLITERAL - 75)) | (1L << (NUMERICLITERAL - 75)) | (1L << (NONNUMERICLITERAL - 75)))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IntegerLiteralContext extends ParserRuleContext {
		public TerminalNode INTEGERLITERAL() { return getToken(CobolPreprocessor.INTEGERLITERAL, 0); }
		public TerminalNode LEVEL_NUMBER() { return getToken(CobolPreprocessor.LEVEL_NUMBER, 0); }
		public TerminalNode LEVEL_NUMBER_66() { return getToken(CobolPreprocessor.LEVEL_NUMBER_66, 0); }
		public TerminalNode LEVEL_NUMBER_77() { return getToken(CobolPreprocessor.LEVEL_NUMBER_77, 0); }
		public TerminalNode LEVEL_NUMBER_88() { return getToken(CobolPreprocessor.LEVEL_NUMBER_88, 0); }
		public IntegerLiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_integerLiteral; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).enterIntegerLiteral(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CobolPreprocessorListener ) ((CobolPreprocessorListener)listener).exitIntegerLiteral(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CobolPreprocessorVisitor ) return ((CobolPreprocessorVisitor<? extends T>)visitor).visitIntegerLiteral(this);
			else return visitor.visitChildren(this);
		}
	}

	public final IntegerLiteralContext integerLiteral() throws RecognitionException {
		IntegerLiteralContext _localctx = new IntegerLiteralContext(_ctx, getState());
		enterRule(_localctx, 76, RULE_integerLiteral);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(342);
			_la = _input.LA(1);
			if ( !(((((_la - 75)) & ~0x3f) == 0 && ((1L << (_la - 75)) & ((1L << (LEVEL_NUMBER - 75)) | (1L << (LEVEL_NUMBER_66 - 75)) | (1L << (LEVEL_NUMBER_77 - 75)) | (1L << (LEVEL_NUMBER_88 - 75)) | (1L << (INTEGERLITERAL - 75)))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3f\u015b\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\3\2\7\2R\n\2\f\2\16"+
		"\2U\13\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\6\2b\n\2\r\2\16\2"+
		"c\3\2\7\2g\n\2\f\2\16\2j\13\2\7\2l\n\2\f\2\16\2o\13\2\3\2\3\2\3\3\3\3"+
		"\3\3\3\3\3\4\3\4\3\4\3\4\5\4{\n\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\3\6\3\6\3\6\5\6\u0089\n\6\3\7\5\7\u008c\n\7\3\7\3\7\3\7\3\7\5\7\u0092"+
		"\n\7\3\b\3\b\3\b\5\b\u0097\n\b\3\b\3\b\5\b\u009b\n\b\3\b\3\b\3\b\5\b\u00a0"+
		"\n\b\3\b\3\b\3\b\5\b\u00a5\n\b\3\b\3\b\5\b\u00a9\n\b\5\b\u00ab\n\b\3\t"+
		"\3\t\3\n\3\n\3\n\3\13\5\13\u00b3\n\13\3\13\3\13\3\13\3\13\5\13\u00b9\n"+
		"\13\3\13\5\13\u00bc\n\13\3\f\3\f\5\f\u00c0\n\f\3\f\3\f\5\f\u00c4\n\f\3"+
		"\r\3\r\5\r\u00c8\n\r\3\16\3\16\5\16\u00cc\n\16\3\17\3\17\3\17\5\17\u00d1"+
		"\n\17\3\20\3\20\5\20\u00d5\n\20\3\20\5\20\u00d8\n\20\3\20\3\20\3\21\3"+
		"\21\3\22\3\22\3\23\3\23\3\23\7\23\u00e3\n\23\f\23\16\23\u00e6\13\23\3"+
		"\23\5\23\u00e9\n\23\3\24\3\24\3\25\3\25\3\26\3\26\6\26\u00f1\n\26\r\26"+
		"\16\26\u00f2\3\27\3\27\6\27\u00f7\n\27\r\27\16\27\u00f8\3\27\3\27\3\30"+
		"\3\30\3\30\3\30\3\31\3\31\5\31\u0103\n\31\3\32\3\32\3\32\3\32\3\33\5\33"+
		"\u010a\n\33\3\33\3\33\3\33\3\33\3\34\3\34\7\34\u0112\n\34\f\34\16\34\u0115"+
		"\13\34\3\34\3\34\3\35\3\35\7\35\u011b\n\35\f\35\16\35\u011e\13\35\3\35"+
		"\3\35\3\35\5\35\u0123\n\35\3\36\3\36\3\37\3\37\5\37\u0129\n\37\3 \3 \3"+
		" \3 \5 \u012f\n \3!\3!\3!\3!\3!\5!\u0136\n!\3!\7!\u0139\n!\f!\16!\u013c"+
		"\13!\3!\3!\3\"\3\"\3\"\5\"\u0143\n\"\3#\3#\3#\5#\u0148\n#\3$\3$\3$\3$"+
		"\5$\u014e\n$\3%\6%\u0151\n%\r%\16%\u0152\3&\3&\3\'\3\'\3(\3(\3(\6Sh\u0113"+
		"\u011c\2)\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"$&(*,.\60\62\64\66"+
		"8:<>@BDFHJLN\2\16\4\2;;EE\3\2\25\26\4\2\17\17\34\34\3\2\3\4\6\2\23\23"+
		"\25\25\31\33((\4\2\21\21&&\3\2\60\60\5\2\67\67;;EE\6\2;;??GGXX\6\2\22"+
		"\25\31\33\'(VW\4\2MQST\3\2MQ\2\u016f\2S\3\2\2\2\4r\3\2\2\2\6v\3\2\2\2"+
		"\b~\3\2\2\2\n\u0085\3\2\2\2\f\u008b\3\2\2\2\16\u00aa\3\2\2\2\20\u00ac"+
		"\3\2\2\2\22\u00ae\3\2\2\2\24\u00b2\3\2\2\2\26\u00bf\3\2\2\2\30\u00c7\3"+
		"\2\2\2\32\u00cb\3\2\2\2\34\u00cd\3\2\2\2\36\u00d2\3\2\2\2 \u00db\3\2\2"+
		"\2\"\u00dd\3\2\2\2$\u00df\3\2\2\2&\u00ea\3\2\2\2(\u00ec\3\2\2\2*\u00ee"+
		"\3\2\2\2,\u00f4\3\2\2\2.\u00fc\3\2\2\2\60\u0102\3\2\2\2\62\u0104\3\2\2"+
		"\2\64\u0109\3\2\2\2\66\u010f\3\2\2\28\u0122\3\2\2\2:\u0124\3\2\2\2<\u0126"+
		"\3\2\2\2>\u012e\3\2\2\2@\u0130\3\2\2\2B\u0142\3\2\2\2D\u0147\3\2\2\2F"+
		"\u014d\3\2\2\2H\u0150\3\2\2\2J\u0154\3\2\2\2L\u0156\3\2\2\2N\u0158\3\2"+
		"\2\2PR\13\2\2\2QP\3\2\2\2RU\3\2\2\2ST\3\2\2\2SQ\3\2\2\2Tm\3\2\2\2US\3"+
		"\2\2\2Vb\5\b\5\2Wb\5\6\4\2Xb\5\f\7\2Yb\5\24\13\2Zb\5,\27\2[b\5.\30\2\\"+
		"b\5\34\17\2]b\5\36\20\2^b\5$\23\2_b\5\4\3\2`b\5\n\6\2aV\3\2\2\2aW\3\2"+
		"\2\2aX\3\2\2\2aY\3\2\2\2aZ\3\2\2\2a[\3\2\2\2a\\\3\2\2\2a]\3\2\2\2a^\3"+
		"\2\2\2a_\3\2\2\2a`\3\2\2\2bc\3\2\2\2ca\3\2\2\2cd\3\2\2\2dh\3\2\2\2eg\13"+
		"\2\2\2fe\3\2\2\2gj\3\2\2\2hi\3\2\2\2hf\3\2\2\2il\3\2\2\2jh\3\2\2\2ka\3"+
		"\2\2\2lo\3\2\2\2mk\3\2\2\2mn\3\2\2\2np\3\2\2\2om\3\2\2\2pq\7\2\2\3q\3"+
		"\3\2\2\2rs\7\22\2\2st\7\'\2\2tu\7;\2\2u\5\3\2\2\2vw\7\5\2\2wz\5\26\f\2"+
		"x{\5*\26\2y{\7*\2\2zx\3\2\2\2zy\3\2\2\2z{\3\2\2\2{|\3\2\2\2|}\7;\2\2}"+
		"\7\3\2\2\2~\177\7\13\2\2\177\u0080\7)\2\2\u0080\u0081\7\20\2\2\u0081\u0082"+
		"\5\26\f\2\u0082\u0083\7\t\2\2\u0083\u0084\7;\2\2\u0084\t\3\2\2\2\u0085"+
		"\u0086\7 \2\2\u0086\u0088\5\26\f\2\u0087\u0089\t\2\2\2\u0088\u0087\3\2"+
		"\2\2\u0088\u0089\3\2\2\2\u0089\13\3\2\2\2\u008a\u008c\7M\2\2\u008b\u008a"+
		"\3\2\2\2\u008b\u008c\3\2\2\2\u008c\u008d\3\2\2\2\u008d\u008e\7\5\2\2\u008e"+
		"\u008f\7\16\2\2\u008f\u0091\5\16\b\2\u0090\u0092\t\2\2\2\u0091\u0090\3"+
		"\2\2\2\u0091\u0092\3\2\2\2\u0092\r\3\2\2\2\u0093\u0094\7!\2\2\u0094\u0096"+
		"\5\20\t\2\u0095\u0097\5\22\n\2\u0096\u0095\3\2\2\2\u0096\u0097\3\2\2\2"+
		"\u0097\u009a\3\2\2\2\u0098\u0099\7\"\2\2\u0099\u009b\5J&\2\u009a\u0098"+
		"\3\2\2\2\u009a\u009b\3\2\2\2\u009b\u00ab\3\2\2\2\u009c\u009d\7\f\2\2\u009d"+
		"\u009f\5\20\t\2\u009e\u00a0\5\22\n\2\u009f\u009e\3\2\2\2\u009f\u00a0\3"+
		"\2\2\2\u00a0\u00ab\3\2\2\2\u00a1\u00a2\t\3\2\2\u00a2\u00ab\5\20\t\2\u00a3"+
		"\u00a5\7\27\2\2\u00a4\u00a3\3\2\2\2\u00a4\u00a5\3\2\2\2\u00a5\u00a6\3"+
		"\2\2\2\u00a6\u00a8\5\20\t\2\u00a7\u00a9\5\22\n\2\u00a8\u00a7\3\2\2\2\u00a8"+
		"\u00a9\3\2\2\2\u00a9\u00ab\3\2\2\2\u00aa\u0093\3\2\2\2\u00aa\u009c\3\2"+
		"\2\2\u00aa\u00a1\3\2\2\2\u00aa\u00a4\3\2\2\2\u00ab\17\3\2\2\2\u00ac\u00ad"+
		"\5\26\f\2\u00ad\21\3\2\2\2\u00ae\u00af\7+\2\2\u00af\u00b0\5N(\2\u00b0"+
		"\23\3\2\2\2\u00b1\u00b3\7M\2\2\u00b2\u00b1\3\2\2\2\u00b2\u00b3\3\2\2\2"+
		"\u00b3\u00b4\3\2\2\2\u00b4\u00b5\7\5\2\2\u00b5\u00b6\7\24\2\2\u00b6\u00b8"+
		"\5\26\f\2\u00b7\u00b9\5\32\16\2\u00b8\u00b7\3\2\2\2\u00b8\u00b9\3\2\2"+
		"\2\u00b9\u00bb\3\2\2\2\u00ba\u00bc\7;\2\2\u00bb\u00ba\3\2\2\2\u00bb\u00bc"+
		"\3\2\2\2\u00bc\25\3\2\2\2\u00bd\u00c0\5L\'\2\u00be\u00c0\5J&\2\u00bf\u00bd"+
		"\3\2\2\2\u00bf\u00be\3\2\2\2\u00c0\u00c3\3\2\2\2\u00c1\u00c2\t\4\2\2\u00c2"+
		"\u00c4\5\30\r\2\u00c3\u00c1\3\2\2\2\u00c3\u00c4\3\2\2\2\u00c4\27\3\2\2"+
		"\2\u00c5\u00c8\5L\'\2\u00c6\u00c8\5J&\2\u00c7\u00c5\3\2\2\2\u00c7\u00c6"+
		"\3\2\2\2\u00c8\31\3\2\2\2\u00c9\u00cc\5L\'\2\u00ca\u00cc\5J&\2\u00cb\u00c9"+
		"\3\2\2\2\u00cb\u00ca\3\2\2\2\u00cc\33\3\2\2\2\u00cd\u00ce\7%\2\2\u00ce"+
		"\u00d0\5L\'\2\u00cf\u00d1\7;\2\2\u00d0\u00cf\3\2\2\2\u00d0\u00d1\3\2\2"+
		"\2\u00d1\35\3\2\2\2\u00d2\u00d4\7\n\2\2\u00d3\u00d5\5\"\22\2\u00d4\u00d3"+
		"\3\2\2\2\u00d4\u00d5\3\2\2\2\u00d5\u00d7\3\2\2\2\u00d6\u00d8\5 \21\2\u00d7"+
		"\u00d6\3\2\2\2\u00d7\u00d8\3\2\2\2\u00d8\u00d9\3\2\2\2\u00d9\u00da\7;"+
		"\2\2\u00da\37\3\2\2\2\u00db\u00dc\5J&\2\u00dc!\3\2\2\2\u00dd\u00de\5J"+
		"&\2\u00de#\3\2\2\2\u00df\u00e0\7\64\2\2\u00e0\u00e4\5&\24\2\u00e1\u00e3"+
		"\5(\25\2\u00e2\u00e1\3\2\2\2\u00e3\u00e6\3\2\2\2\u00e4\u00e2\3\2\2\2\u00e4"+
		"\u00e5\3\2\2\2\u00e5\u00e8\3\2\2\2\u00e6\u00e4\3\2\2\2\u00e7\u00e9\7;"+
		"\2\2\u00e8\u00e7\3\2\2\2\u00e8\u00e9\3\2\2\2\u00e9%\3\2\2\2\u00ea\u00eb"+
		"\t\5\2\2\u00eb\'\3\2\2\2\u00ec\u00ed\t\6\2\2\u00ed)\3\2\2\2\u00ee\u00f0"+
		"\7#\2\2\u00ef\u00f1\5\60\31\2\u00f0\u00ef\3\2\2\2\u00f1\u00f2\3\2\2\2"+
		"\u00f2\u00f0\3\2\2\2\u00f2\u00f3\3\2\2\2\u00f3+\3\2\2\2\u00f4\u00f6\7"+
		"$\2\2\u00f5\u00f7\5\64\33\2\u00f6\u00f5\3\2\2\2\u00f7\u00f8\3\2\2\2\u00f8"+
		"\u00f6\3\2\2\2\u00f8\u00f9\3\2\2\2\u00f9\u00fa\3\2\2\2\u00fa\u00fb\7;"+
		"\2\2\u00fb-\3\2\2\2\u00fc\u00fd\7$\2\2\u00fd\u00fe\7\35\2\2\u00fe\u00ff"+
		"\7;\2\2\u00ff/\3\2\2\2\u0100\u0103\5\64\33\2\u0101\u0103\5\62\32\2\u0102"+
		"\u0100\3\2\2\2\u0102\u0101\3\2\2\2\u0103\61\3\2\2\2\u0104\u0105\5> \2"+
		"\u0105\u0106\7\6\2\2\u0106\u0107\5F$\2\u0107\63\3\2\2\2\u0108\u010a\t"+
		"\7\2\2\u0109\u0108\3\2\2\2\u0109\u010a\3\2\2\2\u010a\u010b\3\2\2\2\u010b"+
		"\u010c\5\66\34\2\u010c\u010d\7\6\2\2\u010d\u010e\58\35\2\u010e\65\3\2"+
		"\2\2\u010f\u0113\5:\36\2\u0110\u0112\n\b\2\2\u0111\u0110\3\2\2\2\u0112"+
		"\u0115\3\2\2\2\u0113\u0114\3\2\2\2\u0113\u0111\3\2\2\2\u0114\u0116\3\2"+
		"\2\2\u0115\u0113\3\2\2\2\u0116\u0117\5<\37\2\u0117\67\3\2\2\2\u0118\u011c"+
		"\5:\36\2\u0119\u011b\n\b\2\2\u011a\u0119\3\2\2\2\u011b\u011e\3\2\2\2\u011c"+
		"\u011d\3\2\2\2\u011c\u011a\3\2\2\2\u011d\u011f\3\2\2\2\u011e\u011c\3\2"+
		"\2\2\u011f\u0120\5<\37\2\u0120\u0123\3\2\2\2\u0121\u0123\7\61\2\2\u0122"+
		"\u0118\3\2\2\2\u0122\u0121\3\2\2\2\u01239\3\2\2\2\u0124\u0125\7\60\2\2"+
		"\u0125;\3\2\2\2\u0126\u0128\7\60\2\2\u0127\u0129\t\t\2\2\u0128\u0127\3"+
		"\2\2\2\u0128\u0129\3\2\2\2\u0129=\3\2\2\2\u012a\u012f\5L\'\2\u012b\u012f"+
		"\5J&\2\u012c\u012f\5H%\2\u012d\u012f\5@!\2\u012e\u012a\3\2\2\2\u012e\u012b"+
		"\3\2\2\2\u012e\u012c\3\2\2\2\u012e\u012d\3\2\2\2\u012f?\3\2\2\2\u0130"+
		"\u0131\7\r\2\2\u0131\u0132\5B\"\2\u0132\u0133\7?\2\2\u0133\u013a\5D#\2"+
		"\u0134\u0136\7\67\2\2\u0135\u0134\3\2\2\2\u0135\u0136\3\2\2\2\u0136\u0137"+
		"\3\2\2\2\u0137\u0139\5D#\2\u0138\u0135\3\2\2\2\u0139\u013c\3\2\2\2\u013a"+
		"\u0138\3\2\2\2\u013a\u013b\3\2\2\2\u013b\u013d\3\2\2\2\u013c\u013a\3\2"+
		"\2\2\u013d\u013e\7G\2\2\u013eA\3\2\2\2\u013f\u0143\5L\'\2\u0140\u0143"+
		"\5J&\2\u0141\u0143\5H%\2\u0142\u013f\3\2\2\2\u0142\u0140\3\2\2\2\u0142"+
		"\u0141\3\2\2\2\u0143C\3\2\2\2\u0144\u0148\5L\'\2\u0145\u0148\5J&\2\u0146"+
		"\u0148\5H%\2\u0147\u0144\3\2\2\2\u0147\u0145\3\2\2\2\u0147\u0146\3\2\2"+
		"\2\u0148E\3\2\2\2\u0149\u014e\5L\'\2\u014a\u014e\5J&\2\u014b\u014e\5H"+
		"%\2\u014c\u014e\5@!\2\u014d\u0149\3\2\2\2\u014d\u014a\3\2\2\2\u014d\u014b"+
		"\3\2\2\2\u014d\u014c\3\2\2\2\u014eG\3\2\2\2\u014f\u0151\t\n\2\2\u0150"+
		"\u014f\3\2\2\2\u0151\u0152\3\2\2\2\u0152\u0150\3\2\2\2\u0152\u0153\3\2"+
		"\2\2\u0153I\3\2\2\2\u0154\u0155\t\13\2\2\u0155K\3\2\2\2\u0156\u0157\t"+
		"\f\2\2\u0157M\3\2\2\2\u0158\u0159\t\r\2\2\u0159O\3\2\2\2,Sachmz\u0088"+
		"\u008b\u0091\u0096\u009a\u009f\u00a4\u00a8\u00aa\u00b2\u00b8\u00bb\u00bf"+
		"\u00c3\u00c7\u00cb\u00d0\u00d4\u00d7\u00e4\u00e8\u00f2\u00f8\u0102\u0109"+
		"\u0113\u011c\u0122\u0128\u012e\u0135\u013a\u0142\u0147\u014d\u0152";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}