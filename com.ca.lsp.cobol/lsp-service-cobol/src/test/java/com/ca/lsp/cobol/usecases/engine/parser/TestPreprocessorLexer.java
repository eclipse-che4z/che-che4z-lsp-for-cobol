package com.ca.lsp.cobol.usecases.engine.parser;// Generated from .\TestPreprocessor.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class TestPreprocessorLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		START=1, STOP=2, VARIABLEDEFINITION=3, VARIABLEUSAGE=4, PARAGRPHDEFINITION=5, 
		PARAGRPHUSAGE=6, COPYBOOKDEFINITION=7, COPYBOOKUSAGE=8, DIAGNOSTICSTART=9, 
		REPLACEMENTSTART=10, MULTITOKENSTART=11, MULTITOKENSTOP=12, STRINGLITERAL=13, 
		IDENTIFIER=14, COPYBOOKNAME=15, NEWLINE=16, WS=17, TEXT=18, SEPARATOR=19;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"START", "STOP", "VARIABLEDEFINITION", "VARIABLEUSAGE", "PARAGRPHDEFINITION", 
			"PARAGRPHUSAGE", "COPYBOOKDEFINITION", "COPYBOOKUSAGE", "DIAGNOSTICSTART", 
			"REPLACEMENTSTART", "MULTITOKENSTART", "MULTITOKENSTOP", "STRINGLITERAL", 
			"IDENTIFIER", "COPYBOOKNAME", "NEWLINE", "WS", "TEXT", "SEPARATOR", "A", 
			"B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", 
			"P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'{'", "'}'", null, null, null, null, null, null, "'|'", "'^'", 
			null, null, null, null, null, null, null, null, "', '"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "START", "STOP", "VARIABLEDEFINITION", "VARIABLEUSAGE", "PARAGRPHDEFINITION", 
			"PARAGRPHUSAGE", "COPYBOOKDEFINITION", "COPYBOOKUSAGE", "DIAGNOSTICSTART", 
			"REPLACEMENTSTART", "MULTITOKENSTART", "MULTITOKENSTOP", "STRINGLITERAL", 
			"IDENTIFIER", "COPYBOOKNAME", "NEWLINE", "WS", "TEXT", "SEPARATOR"
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


	public TestPreprocessorLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "TestPreprocessor.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\25\u011a\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t"+
		" \4!\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t"+
		"+\4,\t,\4-\t-\4.\t.\3\2\3\2\3\3\3\3\3\4\6\4c\n\4\r\4\16\4d\3\4\3\4\3\4"+
		"\3\5\6\5k\n\5\r\5\16\5l\3\5\3\5\3\6\6\6r\n\6\r\6\16\6s\3\6\3\6\3\6\3\7"+
		"\6\7z\n\7\r\7\16\7{\3\7\3\7\3\b\6\b\u0081\n\b\r\b\16\b\u0082\3\b\3\b\3"+
		"\b\3\t\6\t\u0089\n\t\r\t\16\t\u008a\3\t\3\t\3\n\3\n\3\13\3\13\3\f\6\f"+
		"\u0094\n\f\r\f\16\f\u0095\3\f\3\f\3\r\6\r\u009b\n\r\r\r\16\r\u009c\3\r"+
		"\3\r\3\16\3\16\7\16\u00a3\n\16\f\16\16\16\u00a6\13\16\3\16\3\16\3\17\6"+
		"\17\u00ab\n\17\r\17\16\17\u00ac\3\17\6\17\u00b0\n\17\r\17\16\17\u00b1"+
		"\3\17\6\17\u00b5\n\17\r\17\16\17\u00b6\7\17\u00b9\n\17\f\17\16\17\u00bc"+
		"\13\17\3\20\6\20\u00bf\n\20\r\20\16\20\u00c0\3\20\6\20\u00c4\n\20\r\20"+
		"\16\20\u00c5\3\20\6\20\u00c9\n\20\r\20\16\20\u00ca\7\20\u00cd\n\20\f\20"+
		"\16\20\u00d0\13\20\3\21\5\21\u00d3\n\21\3\21\3\21\3\21\3\21\3\22\6\22"+
		"\u00da\n\22\r\22\16\22\u00db\3\22\3\22\3\23\3\23\3\24\3\24\3\24\3\24\3"+
		"\24\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\31\3\31\3\32\3\32\3\33\3"+
		"\33\3\34\3\34\3\35\3\35\3\36\3\36\3\37\3\37\3 \3 \3!\3!\3\"\3\"\3#\3#"+
		"\3$\3$\3%\3%\3&\3&\3\'\3\'\3(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\2"+
		"\2/\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35"+
		"\20\37\21!\22#\23%\24\'\25)\2+\2-\2/\2\61\2\63\2\65\2\67\29\2;\2=\2?\2"+
		"A\2C\2E\2G\2I\2K\2M\2O\2Q\2S\2U\2W\2Y\2[\2\3\2\"\3\2$$\5\2\62<C\\c|\4"+
		"\2//aa\6\2%&\62;B\\c|\6\2\13\13\16\16\"\"==\4\2\f\f\17\17\4\2CCcc\4\2"+
		"DDdd\4\2EEee\4\2FFff\4\2GGgg\4\2HHhh\4\2IIii\4\2JJjj\4\2KKkk\4\2LLll\4"+
		"\2MMmm\4\2NNnn\4\2OOoo\4\2PPpp\4\2QQqq\4\2RRrr\4\2SSss\4\2TTtt\4\2UUu"+
		"u\4\2VVvv\4\2WWww\4\2XXxx\4\2YYyy\4\2ZZzz\4\2[[{{\4\2\\\\||\2\u0112\2"+
		"\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2"+
		"\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2"+
		"\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2"+
		"\2\2%\3\2\2\2\2\'\3\2\2\2\3]\3\2\2\2\5_\3\2\2\2\7b\3\2\2\2\tj\3\2\2\2"+
		"\13q\3\2\2\2\ry\3\2\2\2\17\u0080\3\2\2\2\21\u0088\3\2\2\2\23\u008e\3\2"+
		"\2\2\25\u0090\3\2\2\2\27\u0093\3\2\2\2\31\u009a\3\2\2\2\33\u00a0\3\2\2"+
		"\2\35\u00aa\3\2\2\2\37\u00be\3\2\2\2!\u00d2\3\2\2\2#\u00d9\3\2\2\2%\u00df"+
		"\3\2\2\2\'\u00e1\3\2\2\2)\u00e6\3\2\2\2+\u00e8\3\2\2\2-\u00ea\3\2\2\2"+
		"/\u00ec\3\2\2\2\61\u00ee\3\2\2\2\63\u00f0\3\2\2\2\65\u00f2\3\2\2\2\67"+
		"\u00f4\3\2\2\29\u00f6\3\2\2\2;\u00f8\3\2\2\2=\u00fa\3\2\2\2?\u00fc\3\2"+
		"\2\2A\u00fe\3\2\2\2C\u0100\3\2\2\2E\u0102\3\2\2\2G\u0104\3\2\2\2I\u0106"+
		"\3\2\2\2K\u0108\3\2\2\2M\u010a\3\2\2\2O\u010c\3\2\2\2Q\u010e\3\2\2\2S"+
		"\u0110\3\2\2\2U\u0112\3\2\2\2W\u0114\3\2\2\2Y\u0116\3\2\2\2[\u0118\3\2"+
		"\2\2]^\7}\2\2^\4\3\2\2\2_`\7\177\2\2`\6\3\2\2\2ac\5\3\2\2ba\3\2\2\2cd"+
		"\3\2\2\2db\3\2\2\2de\3\2\2\2ef\3\2\2\2fg\7&\2\2gh\7,\2\2h\b\3\2\2\2ik"+
		"\5\3\2\2ji\3\2\2\2kl\3\2\2\2lj\3\2\2\2lm\3\2\2\2mn\3\2\2\2no\7&\2\2o\n"+
		"\3\2\2\2pr\5\3\2\2qp\3\2\2\2rs\3\2\2\2sq\3\2\2\2st\3\2\2\2tu\3\2\2\2u"+
		"v\7%\2\2vw\7,\2\2w\f\3\2\2\2xz\5\3\2\2yx\3\2\2\2z{\3\2\2\2{y\3\2\2\2{"+
		"|\3\2\2\2|}\3\2\2\2}~\7%\2\2~\16\3\2\2\2\177\u0081\5\3\2\2\u0080\177\3"+
		"\2\2\2\u0081\u0082\3\2\2\2\u0082\u0080\3\2\2\2\u0082\u0083\3\2\2\2\u0083"+
		"\u0084\3\2\2\2\u0084\u0085\7\u0080\2\2\u0085\u0086\7,\2\2\u0086\20\3\2"+
		"\2\2\u0087\u0089\5\3\2\2\u0088\u0087\3\2\2\2\u0089\u008a\3\2\2\2\u008a"+
		"\u0088\3\2\2\2\u008a\u008b\3\2\2\2\u008b\u008c\3\2\2\2\u008c\u008d\7\u0080"+
		"\2\2\u008d\22\3\2\2\2\u008e\u008f\7~\2\2\u008f\24\3\2\2\2\u0090\u0091"+
		"\7`\2\2\u0091\26\3\2\2\2\u0092\u0094\5\3\2\2\u0093\u0092\3\2\2\2\u0094"+
		"\u0095\3\2\2\2\u0095\u0093\3\2\2\2\u0095\u0096\3\2\2\2\u0096\u0097\3\2"+
		"\2\2\u0097\u0098\7a\2\2\u0098\30\3\2\2\2\u0099\u009b\7a\2\2\u009a\u0099"+
		"\3\2\2\2\u009b\u009c\3\2\2\2\u009c\u009a\3\2\2\2\u009c\u009d\3\2\2\2\u009d"+
		"\u009e\3\2\2\2\u009e\u009f\5\5\3\2\u009f\32\3\2\2\2\u00a0\u00a4\t\2\2"+
		"\2\u00a1\u00a3\n\2\2\2\u00a2\u00a1\3\2\2\2\u00a3\u00a6\3\2\2\2\u00a4\u00a2"+
		"\3\2\2\2\u00a4\u00a5\3\2\2\2\u00a5\u00a7\3\2\2\2\u00a6\u00a4\3\2\2\2\u00a7"+
		"\u00a8\t\2\2\2\u00a8\34\3\2\2\2\u00a9\u00ab\t\3\2\2\u00aa\u00a9\3\2\2"+
		"\2\u00ab\u00ac\3\2\2\2\u00ac\u00aa\3\2\2\2\u00ac\u00ad\3\2\2\2\u00ad\u00ba"+
		"\3\2\2\2\u00ae\u00b0\t\4\2\2\u00af\u00ae\3\2\2\2\u00b0\u00b1\3\2\2\2\u00b1"+
		"\u00af\3\2\2\2\u00b1\u00b2\3\2\2\2\u00b2\u00b4\3\2\2\2\u00b3\u00b5\t\3"+
		"\2\2\u00b4\u00b3\3\2\2\2\u00b5\u00b6\3\2\2\2\u00b6\u00b4\3\2\2\2\u00b6"+
		"\u00b7\3\2\2\2\u00b7\u00b9\3\2\2\2\u00b8\u00af\3\2\2\2\u00b9\u00bc\3\2"+
		"\2\2\u00ba\u00b8\3\2\2\2\u00ba\u00bb\3\2\2\2\u00bb\36\3\2\2\2\u00bc\u00ba"+
		"\3\2\2\2\u00bd\u00bf\t\5\2\2\u00be\u00bd\3\2\2\2\u00bf\u00c0\3\2\2\2\u00c0"+
		"\u00be\3\2\2\2\u00c0\u00c1\3\2\2\2\u00c1\u00ce\3\2\2\2\u00c2\u00c4\t\4"+
		"\2\2\u00c3\u00c2\3\2\2\2\u00c4\u00c5\3\2\2\2\u00c5\u00c3\3\2\2\2\u00c5"+
		"\u00c6\3\2\2\2\u00c6\u00c8\3\2\2\2\u00c7\u00c9\t\5\2\2\u00c8\u00c7\3\2"+
		"\2\2\u00c9\u00ca\3\2\2\2\u00ca\u00c8\3\2\2\2\u00ca\u00cb\3\2\2\2\u00cb"+
		"\u00cd\3\2\2\2\u00cc\u00c3\3\2\2\2\u00cd\u00d0\3\2\2\2\u00ce\u00cc\3\2"+
		"\2\2\u00ce\u00cf\3\2\2\2\u00cf \3\2\2\2\u00d0\u00ce\3\2\2\2\u00d1\u00d3"+
		"\7\17\2\2\u00d2\u00d1\3\2\2\2\u00d2\u00d3\3\2\2\2\u00d3\u00d4\3\2\2\2"+
		"\u00d4\u00d5\7\f\2\2\u00d5\u00d6\3\2\2\2\u00d6\u00d7\b\21\2\2\u00d7\""+
		"\3\2\2\2\u00d8\u00da\t\6\2\2\u00d9\u00d8\3\2\2\2\u00da\u00db\3\2\2\2\u00db"+
		"\u00d9\3\2\2\2\u00db\u00dc\3\2\2\2\u00dc\u00dd\3\2\2\2\u00dd\u00de\b\22"+
		"\2\2\u00de$\3\2\2\2\u00df\u00e0\n\7\2\2\u00e0&\3\2\2\2\u00e1\u00e2\7."+
		"\2\2\u00e2\u00e3\7\"\2\2\u00e3\u00e4\3\2\2\2\u00e4\u00e5\b\24\2\2\u00e5"+
		"(\3\2\2\2\u00e6\u00e7\t\b\2\2\u00e7*\3\2\2\2\u00e8\u00e9\t\t\2\2\u00e9"+
		",\3\2\2\2\u00ea\u00eb\t\n\2\2\u00eb.\3\2\2\2\u00ec\u00ed\t\13\2\2\u00ed"+
		"\60\3\2\2\2\u00ee\u00ef\t\f\2\2\u00ef\62\3\2\2\2\u00f0\u00f1\t\r\2\2\u00f1"+
		"\64\3\2\2\2\u00f2\u00f3\t\16\2\2\u00f3\66\3\2\2\2\u00f4\u00f5\t\17\2\2"+
		"\u00f58\3\2\2\2\u00f6\u00f7\t\20\2\2\u00f7:\3\2\2\2\u00f8\u00f9\t\21\2"+
		"\2\u00f9<\3\2\2\2\u00fa\u00fb\t\22\2\2\u00fb>\3\2\2\2\u00fc\u00fd\t\23"+
		"\2\2\u00fd@\3\2\2\2\u00fe\u00ff\t\24\2\2\u00ffB\3\2\2\2\u0100\u0101\t"+
		"\25\2\2\u0101D\3\2\2\2\u0102\u0103\t\26\2\2\u0103F\3\2\2\2\u0104\u0105"+
		"\t\27\2\2\u0105H\3\2\2\2\u0106\u0107\t\30\2\2\u0107J\3\2\2\2\u0108\u0109"+
		"\t\31\2\2\u0109L\3\2\2\2\u010a\u010b\t\32\2\2\u010bN\3\2\2\2\u010c\u010d"+
		"\t\33\2\2\u010dP\3\2\2\2\u010e\u010f\t\34\2\2\u010fR\3\2\2\2\u0110\u0111"+
		"\t\35\2\2\u0111T\3\2\2\2\u0112\u0113\t\36\2\2\u0113V\3\2\2\2\u0114\u0115"+
		"\t\37\2\2\u0115X\3\2\2\2\u0116\u0117\t \2\2\u0117Z\3\2\2\2\u0118\u0119"+
		"\t!\2\2\u0119\\\3\2\2\2\26\2dls{\u0082\u008a\u0095\u009c\u00a4\u00ac\u00b1"+
		"\u00b6\u00ba\u00c0\u00c5\u00ca\u00ce\u00d2\u00db\3\2\3\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}