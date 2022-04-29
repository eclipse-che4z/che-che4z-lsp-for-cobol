// Generated from /Users/leonid/Documents/GitHub/che-che4z-lsp-for-cobol/server/src/main/antlr4/org/eclipse/lsp/cobol/core/parser/TechnicalLexer.g4 by ANTLR 4.9.2
package org.eclipse.lsp.cobol.core.parser;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class TechnicalLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		ASTERISKCHAR=1, DOUBLEASTERISKCHAR=2, COLONCHAR=3, COMMACHAR=4, COMMENTTAG=5, 
		DOLLARCHAR=6, DOUBLEQUOTE=7, DOUBLEEQUALCHAR=8, DOT_FS=9, EQUALCHAR=10, 
		LESSTHANCHAR=11, LESSTHANOREQUAL=12, LPARENCHAR=13, MINUSCHAR=14, MORETHANCHAR=15, 
		MORETHANOREQUAL=16, NOTEQUALCHAR=17, PLUSCHAR=18, SEMICOLON_FS=19, SINGLEQUOTE=20, 
		RPARENCHAR=21, SLASHCHAR=22, SQLLINECOMMENTCHAR=23, UNDERSCORECHAR=24, 
		DIALECT_IF=25, ZERO_WIDTH_SPACE=26, LEVEL_NUMBER=27, LEVEL_NUMBER_66=28, 
		LEVEL_NUMBER_77=29, LEVEL_NUMBER_88=30, INTEGERLITERAL=31, SINGLEDIGITLITERAL=32, 
		NUMERICLITERAL=33, NONNUMERICLITERAL=34, CHAR_STRING_CONSTANT=35, IDENTIFIER=36, 
		COPYBOOK_IDENTIFIER=37, FILENAME=38, OCTDIGITS=39, HEX_NUMBERS=40, NEWLINE=41, 
		COMMENTLINE=42, WS=43, SQLLINECOMMENT=44, ERRORCHAR=45, ZERO_DIGIT=46;
	public static final int
		COMMENTS=2;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN", "COMMENTS"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"ASTERISKCHAR", "DOUBLEASTERISKCHAR", "COLONCHAR", "COMMACHAR", "COMMENTTAG", 
			"DOLLARCHAR", "DOUBLEQUOTE", "DOUBLEEQUALCHAR", "DOT_FS", "EQUALCHAR", 
			"LESSTHANCHAR", "LESSTHANOREQUAL", "LPARENCHAR", "MINUSCHAR", "MORETHANCHAR", 
			"MORETHANOREQUAL", "NOTEQUALCHAR", "PLUSCHAR", "SEMICOLON_FS", "SINGLEQUOTE", 
			"RPARENCHAR", "SLASHCHAR", "SQLLINECOMMENTCHAR", "UNDERSCORECHAR", "DIALECT_IF", 
			"ZERO_WIDTH_SPACE", "LEVEL_NUMBER", "LEVEL_NUMBER_66", "LEVEL_NUMBER_77", 
			"LEVEL_NUMBER_88", "INTEGERLITERAL", "SINGLEDIGITLITERAL", "NUMERICLITERAL", 
			"NONNUMERICLITERAL", "CHAR_STRING_CONSTANT", "IDENTIFIER", "COPYBOOK_IDENTIFIER", 
			"FILENAME", "OCTDIGITS", "HEX_NUMBERS", "NEWLINE", "COMMENTLINE", "WS", 
			"SQLLINECOMMENT", "ERRORCHAR", "ZERO_DIGIT", "HEXNUMBER", "NULLTERMINATED", 
			"STRINGLITERAL", "UNTRMSTRINGLITERAL", "DBCSLITERAL", "OCT_DIGIT", "DIGIT", 
			"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", 
			"O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'*'", "'**'", "':'", "','", "'*>'", "'$'", "'\"'", "'=='", null, 
			"'='", "'<'", "'<='", "'('", "'-'", "'>'", "'>='", "'<>'", "'+'", null, 
			"'''", "')'", "'/'", "'--'", "'_'", null, "'\u200B'", null, "'66'", "'77'", 
			"'88'", null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, "'0'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "ASTERISKCHAR", "DOUBLEASTERISKCHAR", "COLONCHAR", "COMMACHAR", 
			"COMMENTTAG", "DOLLARCHAR", "DOUBLEQUOTE", "DOUBLEEQUALCHAR", "DOT_FS", 
			"EQUALCHAR", "LESSTHANCHAR", "LESSTHANOREQUAL", "LPARENCHAR", "MINUSCHAR", 
			"MORETHANCHAR", "MORETHANOREQUAL", "NOTEQUALCHAR", "PLUSCHAR", "SEMICOLON_FS", 
			"SINGLEQUOTE", "RPARENCHAR", "SLASHCHAR", "SQLLINECOMMENTCHAR", "UNDERSCORECHAR", 
			"DIALECT_IF", "ZERO_WIDTH_SPACE", "LEVEL_NUMBER", "LEVEL_NUMBER_66", 
			"LEVEL_NUMBER_77", "LEVEL_NUMBER_88", "INTEGERLITERAL", "SINGLEDIGITLITERAL", 
			"NUMERICLITERAL", "NONNUMERICLITERAL", "CHAR_STRING_CONSTANT", "IDENTIFIER", 
			"COPYBOOK_IDENTIFIER", "FILENAME", "OCTDIGITS", "HEX_NUMBERS", "NEWLINE", 
			"COMMENTLINE", "WS", "SQLLINECOMMENT", "ERRORCHAR", "ZERO_DIGIT"
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


	public TechnicalLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "TechnicalLexer.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\60\u0221\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t"+
		" \4!\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t"+
		"+\4,\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64"+
		"\t\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t"+
		"=\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\4D\tD\4E\tE\4F\tF\4G\tG\4H\tH\4"+
		"I\tI\4J\tJ\4K\tK\4L\tL\4M\tM\4N\tN\4O\tO\4P\tP\3\2\3\2\3\3\3\3\3\3\3\4"+
		"\3\4\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\t\3\n\3\n\5\n\u00b7"+
		"\n\n\3\13\3\13\3\f\3\f\3\r\3\r\3\r\3\16\3\16\3\17\3\17\3\20\3\20\3\21"+
		"\3\21\3\21\3\22\3\22\3\22\3\23\3\23\3\24\3\24\5\24\u00d0\n\24\3\25\3\25"+
		"\3\26\3\26\3\27\3\27\3\30\3\30\3\30\3\31\3\31\3\32\3\32\3\32\3\32\3\32"+
		"\3\33\3\33\3\34\3\34\3\34\3\34\3\34\5\34\u00e9\n\34\3\35\3\35\3\35\3\36"+
		"\3\36\3\36\3\37\3\37\3\37\3 \3 \5 \u00f6\n \3 \6 \u00f9\n \r \16 \u00fa"+
		"\3 \5 \u00fe\n \3!\3!\3\"\3\"\5\"\u0104\n\"\3\"\7\"\u0107\n\"\f\"\16\""+
		"\u010a\13\"\3\"\3\"\5\"\u010e\n\"\3\"\6\"\u0111\n\"\r\"\16\"\u0112\3\""+
		"\3\"\3\"\5\"\u0118\n\"\3\"\6\"\u011b\n\"\r\"\16\"\u011c\5\"\u011f\n\""+
		"\3#\3#\3#\3#\3#\5#\u0126\n#\3$\3$\5$\u012a\n$\3%\3%\7%\u012e\n%\f%\16"+
		"%\u0131\13%\3&\3&\7&\u0135\n&\f&\16&\u0138\13&\3\'\6\'\u013b\n\'\r\'\16"+
		"\'\u013c\3\'\3\'\6\'\u0141\n\'\r\'\16\'\u0142\3(\3(\3)\3)\3*\5*\u014a"+
		"\n*\3*\3*\3*\3*\3+\3+\3+\7+\u0153\n+\f+\16+\u0156\13+\3+\3+\3,\6,\u015b"+
		"\n,\r,\16,\u015c\3,\3,\3-\3-\7-\u0163\n-\f-\16-\u0166\13-\3-\3-\3-\3-"+
		"\3.\3.\3/\3/\3\60\3\60\3\60\6\60\u0173\n\60\r\60\16\60\u0174\3\60\3\60"+
		"\3\60\3\60\3\60\6\60\u017c\n\60\r\60\16\60\u017d\3\60\3\60\5\60\u0182"+
		"\n\60\3\61\3\61\3\61\3\61\3\61\3\61\7\61\u018a\n\61\f\61\16\61\u018d\13"+
		"\61\3\61\3\61\3\61\3\61\3\61\3\61\3\61\3\61\7\61\u0197\n\61\f\61\16\61"+
		"\u019a\13\61\3\61\3\61\5\61\u019e\n\61\3\62\3\62\3\62\3\62\3\62\7\62\u01a5"+
		"\n\62\f\62\16\62\u01a8\13\62\3\62\3\62\3\62\3\62\3\62\3\62\7\62\u01b0"+
		"\n\62\f\62\16\62\u01b3\13\62\3\62\5\62\u01b6\n\62\3\63\3\63\3\63\3\63"+
		"\3\63\7\63\u01bd\n\63\f\63\16\63\u01c0\13\63\3\63\3\63\3\63\3\63\3\63"+
		"\7\63\u01c7\n\63\f\63\16\63\u01ca\13\63\5\63\u01cc\n\63\3\64\3\64\3\64"+
		"\3\64\3\64\3\64\7\64\u01d4\n\64\f\64\16\64\u01d7\13\64\3\64\3\64\3\64"+
		"\3\64\3\64\3\64\3\64\7\64\u01e0\n\64\f\64\16\64\u01e3\13\64\3\64\5\64"+
		"\u01e6\n\64\3\65\3\65\3\66\3\66\5\66\u01ec\n\66\3\67\3\67\38\38\39\39"+
		"\3:\3:\3;\3;\3<\3<\3=\3=\3>\3>\3?\3?\3@\3@\3A\3A\3B\3B\3C\3C\3D\3D\3E"+
		"\3E\3F\3F\3G\3G\3H\3H\3I\3I\3J\3J\3K\3K\3L\3L\3M\3M\3N\3N\3O\3O\3P\3P"+
		"\2\2Q\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35"+
		"\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33\65\34\67\359\36"+
		";\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\2a\2c\2e\2g\2i\2k\2m\2o\2"+
		"q\2s\2u\2w\2y\2{\2}\2\177\2\u0081\2\u0083\2\u0085\2\u0087\2\u0089\2\u008b"+
		"\2\u008d\2\u008f\2\u0091\2\u0093\2\u0095\2\u0097\2\u0099\2\u009b\2\u009d"+
		"\2\u009f\2\3\2,\3\2\63;\3\2\62\62\3\2\63\66\3\2\62;\4\2GGgg\5\2\62;C\\"+
		"c|\7\2//\62;C\\aac|\6\2%&\62;B\\c|\b\2%&//\62;B\\aac|\4\2\f\f\17\17\5"+
		"\2\13\13\16\16\"\"\4\2\62;CH\5\2\f\f\17\17$$\5\2\f\f\17\17))\4\2IIPP\3"+
		"\2\62:\3\2;;\4\2CCcc\4\2DDdd\4\2EEee\4\2FFff\4\2HHhh\4\2IIii\4\2JJjj\4"+
		"\2KKkk\4\2LLll\4\2MMmm\4\2NNnn\4\2OOoo\4\2PPpp\4\2QQqq\4\2RRrr\4\2SSs"+
		"s\4\2TTtt\4\2UUuu\4\2VVvv\4\2WWww\4\2XXxx\4\2YYyy\4\2ZZzz\4\2[[{{\4\2"+
		"\\\\||\2\u023d\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3"+
		"\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2"+
		"\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3"+
		"\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2"+
		"\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\2"+
		"9\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3"+
		"\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2"+
		"\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3\2\2\2\3"+
		"\u00a1\3\2\2\2\5\u00a3\3\2\2\2\7\u00a6\3\2\2\2\t\u00a8\3\2\2\2\13\u00aa"+
		"\3\2\2\2\r\u00ad\3\2\2\2\17\u00af\3\2\2\2\21\u00b1\3\2\2\2\23\u00b4\3"+
		"\2\2\2\25\u00b8\3\2\2\2\27\u00ba\3\2\2\2\31\u00bc\3\2\2\2\33\u00bf\3\2"+
		"\2\2\35\u00c1\3\2\2\2\37\u00c3\3\2\2\2!\u00c5\3\2\2\2#\u00c8\3\2\2\2%"+
		"\u00cb\3\2\2\2\'\u00cd\3\2\2\2)\u00d1\3\2\2\2+\u00d3\3\2\2\2-\u00d5\3"+
		"\2\2\2/\u00d7\3\2\2\2\61\u00da\3\2\2\2\63\u00dc\3\2\2\2\65\u00e1\3\2\2"+
		"\2\67\u00e8\3\2\2\29\u00ea\3\2\2\2;\u00ed\3\2\2\2=\u00f0\3\2\2\2?\u00fd"+
		"\3\2\2\2A\u00ff\3\2\2\2C\u0103\3\2\2\2E\u0125\3\2\2\2G\u0129\3\2\2\2I"+
		"\u012b\3\2\2\2K\u0132\3\2\2\2M\u013a\3\2\2\2O\u0144\3\2\2\2Q\u0146\3\2"+
		"\2\2S\u0149\3\2\2\2U\u014f\3\2\2\2W\u015a\3\2\2\2Y\u0160\3\2\2\2[\u016b"+
		"\3\2\2\2]\u016d\3\2\2\2_\u0181\3\2\2\2a\u019d\3\2\2\2c\u01b5\3\2\2\2e"+
		"\u01cb\3\2\2\2g\u01e5\3\2\2\2i\u01e7\3\2\2\2k\u01eb\3\2\2\2m\u01ed\3\2"+
		"\2\2o\u01ef\3\2\2\2q\u01f1\3\2\2\2s\u01f3\3\2\2\2u\u01f5\3\2\2\2w\u01f7"+
		"\3\2\2\2y\u01f9\3\2\2\2{\u01fb\3\2\2\2}\u01fd\3\2\2\2\177\u01ff\3\2\2"+
		"\2\u0081\u0201\3\2\2\2\u0083\u0203\3\2\2\2\u0085\u0205\3\2\2\2\u0087\u0207"+
		"\3\2\2\2\u0089\u0209\3\2\2\2\u008b\u020b\3\2\2\2\u008d\u020d\3\2\2\2\u008f"+
		"\u020f\3\2\2\2\u0091\u0211\3\2\2\2\u0093\u0213\3\2\2\2\u0095\u0215\3\2"+
		"\2\2\u0097\u0217\3\2\2\2\u0099\u0219\3\2\2\2\u009b\u021b\3\2\2\2\u009d"+
		"\u021d\3\2\2\2\u009f\u021f\3\2\2\2\u00a1\u00a2\7,\2\2\u00a2\4\3\2\2\2"+
		"\u00a3\u00a4\7,\2\2\u00a4\u00a5\7,\2\2\u00a5\6\3\2\2\2\u00a6\u00a7\7<"+
		"\2\2\u00a7\b\3\2\2\2\u00a8\u00a9\7.\2\2\u00a9\n\3\2\2\2\u00aa\u00ab\7"+
		",\2\2\u00ab\u00ac\7@\2\2\u00ac\f\3\2\2\2\u00ad\u00ae\7&\2\2\u00ae\16\3"+
		"\2\2\2\u00af\u00b0\7$\2\2\u00b0\20\3\2\2\2\u00b1\u00b2\7?\2\2\u00b2\u00b3"+
		"\7?\2\2\u00b3\22\3\2\2\2\u00b4\u00b6\7\60\2\2\u00b5\u00b7\7\2\2\3\u00b6"+
		"\u00b5\3\2\2\2\u00b6\u00b7\3\2\2\2\u00b7\24\3\2\2\2\u00b8\u00b9\7?\2\2"+
		"\u00b9\26\3\2\2\2\u00ba\u00bb\7>\2\2\u00bb\30\3\2\2\2\u00bc\u00bd\7>\2"+
		"\2\u00bd\u00be\7?\2\2\u00be\32\3\2\2\2\u00bf\u00c0\7*\2\2\u00c0\34\3\2"+
		"\2\2\u00c1\u00c2\7/\2\2\u00c2\36\3\2\2\2\u00c3\u00c4\7@\2\2\u00c4 \3\2"+
		"\2\2\u00c5\u00c6\7@\2\2\u00c6\u00c7\7?\2\2\u00c7\"\3\2\2\2\u00c8\u00c9"+
		"\7>\2\2\u00c9\u00ca\7@\2\2\u00ca$\3\2\2\2\u00cb\u00cc\7-\2\2\u00cc&\3"+
		"\2\2\2\u00cd\u00cf\7=\2\2\u00ce\u00d0\7\2\2\3\u00cf\u00ce\3\2\2\2\u00cf"+
		"\u00d0\3\2\2\2\u00d0(\3\2\2\2\u00d1\u00d2\7)\2\2\u00d2*\3\2\2\2\u00d3"+
		"\u00d4\7+\2\2\u00d4,\3\2\2\2\u00d5\u00d6\7\61\2\2\u00d6.\3\2\2\2\u00d7"+
		"\u00d8\7/\2\2\u00d8\u00d9\7/\2\2\u00d9\60\3\2\2\2\u00da\u00db\7a\2\2\u00db"+
		"\62\3\2\2\2\u00dc\u00dd\5\61\31\2\u00dd\u00de\5}?\2\u00de\u00df\5w<\2"+
		"\u00df\u00e0\5\61\31\2\u00e0\64\3\2\2\2\u00e1\u00e2\7\u200d\2\2\u00e2"+
		"\66\3\2\2\2\u00e3\u00e9\t\2\2\2\u00e4\u00e5\t\3\2\2\u00e5\u00e9\t\2\2"+
		"\2\u00e6\u00e7\t\4\2\2\u00e7\u00e9\t\5\2\2\u00e8\u00e3\3\2\2\2\u00e8\u00e4"+
		"\3\2\2\2\u00e8\u00e6\3\2\2\2\u00e98\3\2\2\2\u00ea\u00eb\78\2\2\u00eb\u00ec"+
		"\78\2\2\u00ec:\3\2\2\2\u00ed\u00ee\79\2\2\u00ee\u00ef\79\2\2\u00ef<\3"+
		"\2\2\2\u00f0\u00f1\7:\2\2\u00f1\u00f2\7:\2\2\u00f2>\3\2\2\2\u00f3\u00f6"+
		"\5%\23\2\u00f4\u00f6\5\35\17\2\u00f5\u00f3\3\2\2\2\u00f5\u00f4\3\2\2\2"+
		"\u00f5\u00f6\3\2\2\2\u00f6\u00f8\3\2\2\2\u00f7\u00f9\5k\66\2\u00f8\u00f7"+
		"\3\2\2\2\u00f9\u00fa\3\2\2\2\u00fa\u00f8\3\2\2\2\u00fa\u00fb\3\2\2\2\u00fb"+
		"\u00fe\3\2\2\2\u00fc\u00fe\5\67\34\2\u00fd\u00f5\3\2\2\2\u00fd\u00fc\3"+
		"\2\2\2\u00fe@\3\2\2\2\u00ff\u0100\5k\66\2\u0100B\3\2\2\2\u0101\u0104\5"+
		"%\23\2\u0102\u0104\5\35\17\2\u0103\u0101\3\2\2\2\u0103\u0102\3\2\2\2\u0103"+
		"\u0104\3\2\2\2\u0104\u0108\3\2\2\2\u0105\u0107\5k\66\2\u0106\u0105\3\2"+
		"\2\2\u0107\u010a\3\2\2\2\u0108\u0106\3\2\2\2\u0108\u0109\3\2\2\2\u0109"+
		"\u010d\3\2\2\2\u010a\u0108\3\2\2\2\u010b\u010e\5\23\n\2\u010c\u010e\5"+
		"\t\5\2\u010d\u010b\3\2\2\2\u010d\u010c\3\2\2\2\u010e\u0110\3\2\2\2\u010f"+
		"\u0111\5k\66\2\u0110\u010f\3\2\2\2\u0111\u0112\3\2\2\2\u0112\u0110\3\2"+
		"\2\2\u0112\u0113\3\2\2\2\u0113\u011e\3\2\2\2\u0114\u0117\t\6\2\2\u0115"+
		"\u0118\5%\23\2\u0116\u0118\5\35\17\2\u0117\u0115\3\2\2\2\u0117\u0116\3"+
		"\2\2\2\u0117\u0118\3\2\2\2\u0118\u011a\3\2\2\2\u0119\u011b\5k\66\2\u011a"+
		"\u0119\3\2\2\2\u011b\u011c\3\2\2\2\u011c\u011a\3\2\2\2\u011c\u011d\3\2"+
		"\2\2\u011d\u011f\3\2\2\2\u011e\u0114\3\2\2\2\u011e\u011f\3\2\2\2\u011f"+
		"D\3\2\2\2\u0120\u0126\5e\63\2\u0121\u0126\5c\62\2\u0122\u0126\5g\64\2"+
		"\u0123\u0126\5_\60\2\u0124\u0126\5a\61\2\u0125\u0120\3\2\2\2\u0125\u0121"+
		"\3\2\2\2\u0125\u0122\3\2\2\2\u0125\u0123\3\2\2\2\u0125\u0124\3\2\2\2\u0126"+
		"F\3\2\2\2\u0127\u012a\5_\60\2\u0128\u012a\5c\62\2\u0129\u0127\3\2\2\2"+
		"\u0129\u0128\3\2\2\2\u012aH\3\2\2\2\u012b\u012f\t\7\2\2\u012c\u012e\t"+
		"\b\2\2\u012d\u012c\3\2\2\2\u012e\u0131\3\2\2\2\u012f\u012d\3\2\2\2\u012f"+
		"\u0130\3\2\2\2\u0130J\3\2\2\2\u0131\u012f\3\2\2\2\u0132\u0136\t\t\2\2"+
		"\u0133\u0135\t\n\2\2\u0134\u0133\3\2\2\2\u0135\u0138\3\2\2\2\u0136\u0134"+
		"\3\2\2\2\u0136\u0137\3\2\2\2\u0137L\3\2\2\2\u0138\u0136\3\2\2\2\u0139"+
		"\u013b\5I%\2\u013a\u0139\3\2\2\2\u013b\u013c\3\2\2\2\u013c\u013a\3\2\2"+
		"\2\u013c\u013d\3\2\2\2\u013d\u013e\3\2\2\2\u013e\u0140\7\60\2\2\u013f"+
		"\u0141\5I%\2\u0140\u013f\3\2\2\2\u0141\u0142\3\2\2\2\u0142\u0140\3\2\2"+
		"\2\u0142\u0143\3\2\2\2\u0143N\3\2\2\2\u0144\u0145\5i\65\2\u0145P\3\2\2"+
		"\2\u0146\u0147\5_\60\2\u0147R\3\2\2\2\u0148\u014a\7\17\2\2\u0149\u0148"+
		"\3\2\2\2\u0149\u014a\3\2\2\2\u014a\u014b\3\2\2\2\u014b\u014c\7\f\2\2\u014c"+
		"\u014d\3\2\2\2\u014d\u014e\b*\2\2\u014eT\3\2\2\2\u014f\u0150\5\13\6\2"+
		"\u0150\u0154\5W,\2\u0151\u0153\n\13\2\2\u0152\u0151\3\2\2\2\u0153\u0156"+
		"\3\2\2\2\u0154\u0152\3\2\2\2\u0154\u0155\3\2\2\2\u0155\u0157\3\2\2\2\u0156"+
		"\u0154\3\2\2\2\u0157\u0158\b+\3\2\u0158V\3\2\2\2\u0159\u015b\t\f\2\2\u015a"+
		"\u0159\3\2\2\2\u015b\u015c\3\2\2\2\u015c\u015a\3\2\2\2\u015c\u015d\3\2"+
		"\2\2\u015d\u015e\3\2\2\2\u015e\u015f\b,\2\2\u015fX\3\2\2\2\u0160\u0164"+
		"\5/\30\2\u0161\u0163\n\13\2\2\u0162\u0161\3\2\2\2\u0163\u0166\3\2\2\2"+
		"\u0164\u0162\3\2\2\2\u0164\u0165\3\2\2\2\u0165\u0167\3\2\2\2\u0166\u0164"+
		"\3\2\2\2\u0167\u0168\5S*\2\u0168\u0169\3\2\2\2\u0169\u016a\b-\2\2\u016a"+
		"Z\3\2\2\2\u016b\u016c\13\2\2\2\u016c\\\3\2\2\2\u016d\u016e\7\62\2\2\u016e"+
		"^\3\2\2\2\u016f\u0170\5\u009bN\2\u0170\u0172\7$\2\2\u0171\u0173\t\r\2"+
		"\2\u0172\u0171\3\2\2\2\u0173\u0174\3\2\2\2\u0174\u0172\3\2\2\2\u0174\u0175"+
		"\3\2\2\2\u0175\u0176\3\2\2\2\u0176\u0177\7$\2\2\u0177\u0182\3\2\2\2\u0178"+
		"\u0179\5\u009bN\2\u0179\u017b\7)\2\2\u017a\u017c\t\r\2\2\u017b\u017a\3"+
		"\2\2\2\u017c\u017d\3\2\2\2\u017d\u017b\3\2\2\2\u017d\u017e\3\2\2\2\u017e"+
		"\u017f\3\2\2\2\u017f\u0180\7)\2\2\u0180\u0182\3\2\2\2\u0181\u016f\3\2"+
		"\2\2\u0181\u0178\3\2\2\2\u0182`\3\2\2\2\u0183\u0184\5\u009fP\2\u0184\u018b"+
		"\7$\2\2\u0185\u018a\n\16\2\2\u0186\u0187\7$\2\2\u0187\u018a\7$\2\2\u0188"+
		"\u018a\7)\2\2\u0189\u0185\3\2\2\2\u0189\u0186\3\2\2\2\u0189\u0188\3\2"+
		"\2\2\u018a\u018d\3\2\2\2\u018b\u0189\3\2\2\2\u018b\u018c\3\2\2\2\u018c"+
		"\u018e\3\2\2\2\u018d\u018b\3\2\2\2\u018e\u018f\7$\2\2\u018f\u019e\3\2"+
		"\2\2\u0190\u0191\5\u009fP\2\u0191\u0198\7)\2\2\u0192\u0197\n\17\2\2\u0193"+
		"\u0194\7)\2\2\u0194\u0197\7)\2\2\u0195\u0197\7$\2\2\u0196\u0192\3\2\2"+
		"\2\u0196\u0193\3\2\2\2\u0196\u0195\3\2\2\2\u0197\u019a\3\2\2\2\u0198\u0196"+
		"\3\2\2\2\u0198\u0199\3\2\2\2\u0199\u019b\3\2\2\2\u019a\u0198\3\2\2\2\u019b"+
		"\u019c\7)\2\2\u019c\u019e\3\2\2\2\u019d\u0183\3\2\2\2\u019d\u0190\3\2"+
		"\2\2\u019eb\3\2\2\2\u019f\u01a6\7$\2\2\u01a0\u01a5\n\16\2\2\u01a1\u01a2"+
		"\7$\2\2\u01a2\u01a5\7$\2\2\u01a3\u01a5\7)\2\2\u01a4\u01a0\3\2\2\2\u01a4"+
		"\u01a1\3\2\2\2\u01a4\u01a3\3\2\2\2\u01a5\u01a8\3\2\2\2\u01a6\u01a4\3\2"+
		"\2\2\u01a6\u01a7\3\2\2\2\u01a7\u01a9\3\2\2\2\u01a8\u01a6\3\2\2\2\u01a9"+
		"\u01b6\7$\2\2\u01aa\u01b1\7)\2\2\u01ab\u01b0\n\17\2\2\u01ac\u01ad\7)\2"+
		"\2\u01ad\u01b0\7)\2\2\u01ae\u01b0\7$\2\2\u01af\u01ab\3\2\2\2\u01af\u01ac"+
		"\3\2\2\2\u01af\u01ae\3\2\2\2\u01b0\u01b3\3\2\2\2\u01b1\u01af\3\2\2\2\u01b1"+
		"\u01b2\3\2\2\2\u01b2\u01b4\3\2\2\2\u01b3\u01b1\3\2\2\2\u01b4\u01b6\7)"+
		"\2\2\u01b5\u019f\3\2\2\2\u01b5\u01aa\3\2\2\2\u01b6d\3\2\2\2\u01b7\u01be"+
		"\7$\2\2\u01b8\u01bd\n\16\2\2\u01b9\u01ba\7$\2\2\u01ba\u01bd\7$\2\2\u01bb"+
		"\u01bd\7)\2\2\u01bc\u01b8\3\2\2\2\u01bc\u01b9\3\2\2\2\u01bc\u01bb\3\2"+
		"\2\2\u01bd\u01c0\3\2\2\2\u01be\u01bc\3\2\2\2\u01be\u01bf\3\2\2\2\u01bf"+
		"\u01cc\3\2\2\2\u01c0\u01be\3\2\2\2\u01c1\u01c8\7)\2\2\u01c2\u01c7\n\17"+
		"\2\2\u01c3\u01c4\7)\2\2\u01c4\u01c7\7)\2\2\u01c5\u01c7\7$\2\2\u01c6\u01c2"+
		"\3\2\2\2\u01c6\u01c3\3\2\2\2\u01c6\u01c5\3\2\2\2\u01c7\u01ca\3\2\2\2\u01c8"+
		"\u01c6\3\2\2\2\u01c8\u01c9\3\2\2\2\u01c9\u01cc\3\2\2\2\u01ca\u01c8\3\2"+
		"\2\2\u01cb\u01b7\3\2\2\2\u01cb\u01c1\3\2\2\2\u01ccf\3\2\2\2\u01cd\u01ce"+
		"\t\20\2\2\u01ce\u01d5\7$\2\2\u01cf\u01d4\n\16\2\2\u01d0\u01d1\7$\2\2\u01d1"+
		"\u01d4\7$\2\2\u01d2\u01d4\7)\2\2\u01d3\u01cf\3\2\2\2\u01d3\u01d0\3\2\2"+
		"\2\u01d3\u01d2\3\2\2\2\u01d4\u01d7\3\2\2\2\u01d5\u01d3\3\2\2\2\u01d5\u01d6"+
		"\3\2\2\2\u01d6\u01d8\3\2\2\2\u01d7\u01d5\3\2\2\2\u01d8\u01e6\7$\2\2\u01d9"+
		"\u01da\t\20\2\2\u01da\u01e1\7)\2\2\u01db\u01e0\n\17\2\2\u01dc\u01dd\7"+
		")\2\2\u01dd\u01e0\7)\2\2\u01de\u01e0\7$\2\2\u01df\u01db\3\2\2\2\u01df"+
		"\u01dc\3\2\2\2\u01df\u01de\3\2\2\2\u01e0\u01e3\3\2\2\2\u01e1\u01df\3\2"+
		"\2\2\u01e1\u01e2\3\2\2\2\u01e2\u01e4\3\2\2\2\u01e3\u01e1\3\2\2\2\u01e4"+
		"\u01e6\7)\2\2\u01e5\u01cd\3\2\2\2\u01e5\u01d9\3\2\2\2\u01e6h\3\2\2\2\u01e7"+
		"\u01e8\t\21\2\2\u01e8j\3\2\2\2\u01e9\u01ec\5i\65\2\u01ea\u01ec\t\22\2"+
		"\2\u01eb\u01e9\3\2\2\2\u01eb\u01ea\3\2\2\2\u01ecl\3\2\2\2\u01ed\u01ee"+
		"\t\23\2\2\u01een\3\2\2\2\u01ef\u01f0\t\24\2\2\u01f0p\3\2\2\2\u01f1\u01f2"+
		"\t\25\2\2\u01f2r\3\2\2\2\u01f3\u01f4\t\26\2\2\u01f4t\3\2\2\2\u01f5\u01f6"+
		"\t\6\2\2\u01f6v\3\2\2\2\u01f7\u01f8\t\27\2\2\u01f8x\3\2\2\2\u01f9\u01fa"+
		"\t\30\2\2\u01faz\3\2\2\2\u01fb\u01fc\t\31\2\2\u01fc|\3\2\2\2\u01fd\u01fe"+
		"\t\32\2\2\u01fe~\3\2\2\2\u01ff\u0200\t\33\2\2\u0200\u0080\3\2\2\2\u0201"+
		"\u0202\t\34\2\2\u0202\u0082\3\2\2\2\u0203\u0204\t\35\2\2\u0204\u0084\3"+
		"\2\2\2\u0205\u0206\t\36\2\2\u0206\u0086\3\2\2\2\u0207\u0208\t\37\2\2\u0208"+
		"\u0088\3\2\2\2\u0209\u020a\t \2\2\u020a\u008a\3\2\2\2\u020b\u020c\t!\2"+
		"\2\u020c\u008c\3\2\2\2\u020d\u020e\t\"\2\2\u020e\u008e\3\2\2\2\u020f\u0210"+
		"\t#\2\2\u0210\u0090\3\2\2\2\u0211\u0212\t$\2\2\u0212\u0092\3\2\2\2\u0213"+
		"\u0214\t%\2\2\u0214\u0094\3\2\2\2\u0215\u0216\t&\2\2\u0216\u0096\3\2\2"+
		"\2\u0217\u0218\t\'\2\2\u0218\u0098\3\2\2\2\u0219\u021a\t(\2\2\u021a\u009a"+
		"\3\2\2\2\u021b\u021c\t)\2\2\u021c\u009c\3\2\2\2\u021d\u021e\t*\2\2\u021e"+
		"\u009e\3\2\2\2\u021f\u0220\t+\2\2\u0220\u00a0\3\2\2\2\62\2\u00b6\u00cf"+
		"\u00e8\u00f5\u00fa\u00fd\u0103\u0108\u010d\u0112\u0117\u011c\u011e\u0125"+
		"\u0129\u012f\u0136\u013c\u0142\u0149\u0154\u015c\u0164\u0174\u017d\u0181"+
		"\u0189\u018b\u0196\u0198\u019d\u01a4\u01a6\u01af\u01b1\u01b5\u01bc\u01be"+
		"\u01c6\u01c8\u01cb\u01d3\u01d5\u01df\u01e1\u01e5\u01eb\4\2\3\2\2\4\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}