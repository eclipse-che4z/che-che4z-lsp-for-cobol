// Generated from /Users/leonid/Documents/GitHub/che-che4z-lsp-for-cobol/server/src/main/antlr4/org/eclipse/lsp/cobol/core/parser/CobolPreprocessor.g4 by ANTLR 4.9.2
package org.eclipse.lsp.cobol.core.parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CobolPreprocessor}.
 */
public interface CobolPreprocessorListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#startRule}.
	 * @param ctx the parse tree
	 */
	void enterStartRule(CobolPreprocessor.StartRuleContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#startRule}.
	 * @param ctx the parse tree
	 */
	void exitStartRule(CobolPreprocessor.StartRuleContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#linkageSection}.
	 * @param ctx the parse tree
	 */
	void enterLinkageSection(CobolPreprocessor.LinkageSectionContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#linkageSection}.
	 * @param ctx the parse tree
	 */
	void exitLinkageSection(CobolPreprocessor.LinkageSectionContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copyStatement}.
	 * @param ctx the parse tree
	 */
	void enterCopyStatement(CobolPreprocessor.CopyStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copyStatement}.
	 * @param ctx the parse tree
	 */
	void exitCopyStatement(CobolPreprocessor.CopyStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#includeStatement}.
	 * @param ctx the parse tree
	 */
	void enterIncludeStatement(CobolPreprocessor.IncludeStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#includeStatement}.
	 * @param ctx the parse tree
	 */
	void exitIncludeStatement(CobolPreprocessor.IncludeStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#plusplusIncludeStatement}.
	 * @param ctx the parse tree
	 */
	void enterPlusplusIncludeStatement(CobolPreprocessor.PlusplusIncludeStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#plusplusIncludeStatement}.
	 * @param ctx the parse tree
	 */
	void exitPlusplusIncludeStatement(CobolPreprocessor.PlusplusIncludeStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copyIdmsStatement}.
	 * @param ctx the parse tree
	 */
	void enterCopyIdmsStatement(CobolPreprocessor.CopyIdmsStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copyIdmsStatement}.
	 * @param ctx the parse tree
	 */
	void exitCopyIdmsStatement(CobolPreprocessor.CopyIdmsStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copyIdmsOptions}.
	 * @param ctx the parse tree
	 */
	void enterCopyIdmsOptions(CobolPreprocessor.CopyIdmsOptionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copyIdmsOptions}.
	 * @param ctx the parse tree
	 */
	void exitCopyIdmsOptions(CobolPreprocessor.CopyIdmsOptionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copyIdmsSource}.
	 * @param ctx the parse tree
	 */
	void enterCopyIdmsSource(CobolPreprocessor.CopyIdmsSourceContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copyIdmsSource}.
	 * @param ctx the parse tree
	 */
	void exitCopyIdmsSource(CobolPreprocessor.CopyIdmsSourceContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#versionClause}.
	 * @param ctx the parse tree
	 */
	void enterVersionClause(CobolPreprocessor.VersionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#versionClause}.
	 * @param ctx the parse tree
	 */
	void exitVersionClause(CobolPreprocessor.VersionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copyMaidStatement}.
	 * @param ctx the parse tree
	 */
	void enterCopyMaidStatement(CobolPreprocessor.CopyMaidStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copyMaidStatement}.
	 * @param ctx the parse tree
	 */
	void exitCopyMaidStatement(CobolPreprocessor.CopyMaidStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copySource}.
	 * @param ctx the parse tree
	 */
	void enterCopySource(CobolPreprocessor.CopySourceContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copySource}.
	 * @param ctx the parse tree
	 */
	void exitCopySource(CobolPreprocessor.CopySourceContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#copyLibrary}.
	 * @param ctx the parse tree
	 */
	void enterCopyLibrary(CobolPreprocessor.CopyLibraryContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#copyLibrary}.
	 * @param ctx the parse tree
	 */
	void exitCopyLibrary(CobolPreprocessor.CopyLibraryContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#qualifier}.
	 * @param ctx the parse tree
	 */
	void enterQualifier(CobolPreprocessor.QualifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#qualifier}.
	 * @param ctx the parse tree
	 */
	void exitQualifier(CobolPreprocessor.QualifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#titleDirective}.
	 * @param ctx the parse tree
	 */
	void enterTitleDirective(CobolPreprocessor.TitleDirectiveContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#titleDirective}.
	 * @param ctx the parse tree
	 */
	void exitTitleDirective(CobolPreprocessor.TitleDirectiveContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#enterDirective}.
	 * @param ctx the parse tree
	 */
	void enterEnterDirective(CobolPreprocessor.EnterDirectiveContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#enterDirective}.
	 * @param ctx the parse tree
	 */
	void exitEnterDirective(CobolPreprocessor.EnterDirectiveContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#routineName}.
	 * @param ctx the parse tree
	 */
	void enterRoutineName(CobolPreprocessor.RoutineNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#routineName}.
	 * @param ctx the parse tree
	 */
	void exitRoutineName(CobolPreprocessor.RoutineNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#languageName}.
	 * @param ctx the parse tree
	 */
	void enterLanguageName(CobolPreprocessor.LanguageNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#languageName}.
	 * @param ctx the parse tree
	 */
	void exitLanguageName(CobolPreprocessor.LanguageNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#controlDirective}.
	 * @param ctx the parse tree
	 */
	void enterControlDirective(CobolPreprocessor.ControlDirectiveContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#controlDirective}.
	 * @param ctx the parse tree
	 */
	void exitControlDirective(CobolPreprocessor.ControlDirectiveContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#controlCbl}.
	 * @param ctx the parse tree
	 */
	void enterControlCbl(CobolPreprocessor.ControlCblContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#controlCbl}.
	 * @param ctx the parse tree
	 */
	void exitControlCbl(CobolPreprocessor.ControlCblContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#controlOptions}.
	 * @param ctx the parse tree
	 */
	void enterControlOptions(CobolPreprocessor.ControlOptionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#controlOptions}.
	 * @param ctx the parse tree
	 */
	void exitControlOptions(CobolPreprocessor.ControlOptionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replacingPhrase}.
	 * @param ctx the parse tree
	 */
	void enterReplacingPhrase(CobolPreprocessor.ReplacingPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replacingPhrase}.
	 * @param ctx the parse tree
	 */
	void exitReplacingPhrase(CobolPreprocessor.ReplacingPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replaceAreaStart}.
	 * @param ctx the parse tree
	 */
	void enterReplaceAreaStart(CobolPreprocessor.ReplaceAreaStartContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replaceAreaStart}.
	 * @param ctx the parse tree
	 */
	void exitReplaceAreaStart(CobolPreprocessor.ReplaceAreaStartContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replaceOffStatement}.
	 * @param ctx the parse tree
	 */
	void enterReplaceOffStatement(CobolPreprocessor.ReplaceOffStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replaceOffStatement}.
	 * @param ctx the parse tree
	 */
	void exitReplaceOffStatement(CobolPreprocessor.ReplaceOffStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replaceClause}.
	 * @param ctx the parse tree
	 */
	void enterReplaceClause(CobolPreprocessor.ReplaceClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replaceClause}.
	 * @param ctx the parse tree
	 */
	void exitReplaceClause(CobolPreprocessor.ReplaceClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replaceLiteral}.
	 * @param ctx the parse tree
	 */
	void enterReplaceLiteral(CobolPreprocessor.ReplaceLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replaceLiteral}.
	 * @param ctx the parse tree
	 */
	void exitReplaceLiteral(CobolPreprocessor.ReplaceLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replacePseudoText}.
	 * @param ctx the parse tree
	 */
	void enterReplacePseudoText(CobolPreprocessor.ReplacePseudoTextContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replacePseudoText}.
	 * @param ctx the parse tree
	 */
	void exitReplacePseudoText(CobolPreprocessor.ReplacePseudoTextContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#pseudoReplaceable}.
	 * @param ctx the parse tree
	 */
	void enterPseudoReplaceable(CobolPreprocessor.PseudoReplaceableContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#pseudoReplaceable}.
	 * @param ctx the parse tree
	 */
	void exitPseudoReplaceable(CobolPreprocessor.PseudoReplaceableContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#pseudoReplacement}.
	 * @param ctx the parse tree
	 */
	void enterPseudoReplacement(CobolPreprocessor.PseudoReplacementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#pseudoReplacement}.
	 * @param ctx the parse tree
	 */
	void exitPseudoReplacement(CobolPreprocessor.PseudoReplacementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#openingPseudoTextDelimiter}.
	 * @param ctx the parse tree
	 */
	void enterOpeningPseudoTextDelimiter(CobolPreprocessor.OpeningPseudoTextDelimiterContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#openingPseudoTextDelimiter}.
	 * @param ctx the parse tree
	 */
	void exitOpeningPseudoTextDelimiter(CobolPreprocessor.OpeningPseudoTextDelimiterContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#closingPseudoTextDelimiter}.
	 * @param ctx the parse tree
	 */
	void enterClosingPseudoTextDelimiter(CobolPreprocessor.ClosingPseudoTextDelimiterContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#closingPseudoTextDelimiter}.
	 * @param ctx the parse tree
	 */
	void exitClosingPseudoTextDelimiter(CobolPreprocessor.ClosingPseudoTextDelimiterContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replaceable}.
	 * @param ctx the parse tree
	 */
	void enterReplaceable(CobolPreprocessor.ReplaceableContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replaceable}.
	 * @param ctx the parse tree
	 */
	void exitReplaceable(CobolPreprocessor.ReplaceableContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(CobolPreprocessor.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(CobolPreprocessor.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(CobolPreprocessor.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(CobolPreprocessor.FunctionNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#argument}.
	 * @param ctx the parse tree
	 */
	void enterArgument(CobolPreprocessor.ArgumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#argument}.
	 * @param ctx the parse tree
	 */
	void exitArgument(CobolPreprocessor.ArgumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#replacement}.
	 * @param ctx the parse tree
	 */
	void enterReplacement(CobolPreprocessor.ReplacementContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#replacement}.
	 * @param ctx the parse tree
	 */
	void exitReplacement(CobolPreprocessor.ReplacementContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#charDataLine}.
	 * @param ctx the parse tree
	 */
	void enterCharDataLine(CobolPreprocessor.CharDataLineContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#charDataLine}.
	 * @param ctx the parse tree
	 */
	void exitCharDataLine(CobolPreprocessor.CharDataLineContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#cobolWord}.
	 * @param ctx the parse tree
	 */
	void enterCobolWord(CobolPreprocessor.CobolWordContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#cobolWord}.
	 * @param ctx the parse tree
	 */
	void exitCobolWord(CobolPreprocessor.CobolWordContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(CobolPreprocessor.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(CobolPreprocessor.LiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link CobolPreprocessor#integerLiteral}.
	 * @param ctx the parse tree
	 */
	void enterIntegerLiteral(CobolPreprocessor.IntegerLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link CobolPreprocessor#integerLiteral}.
	 * @param ctx the parse tree
	 */
	void exitIntegerLiteral(CobolPreprocessor.IntegerLiteralContext ctx);
}