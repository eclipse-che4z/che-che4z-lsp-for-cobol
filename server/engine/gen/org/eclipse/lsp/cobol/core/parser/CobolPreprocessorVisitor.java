// Generated from /Users/leonid/Documents/GitHub/che-che4z-lsp-for-cobol/server/src/main/antlr4/org/eclipse/lsp/cobol/core/parser/CobolPreprocessor.g4 by ANTLR 4.9.2
package org.eclipse.lsp.cobol.core.parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link CobolPreprocessor}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface CobolPreprocessorVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#startRule}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStartRule(CobolPreprocessor.StartRuleContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#linkageSection}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLinkageSection(CobolPreprocessor.LinkageSectionContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copyStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyStatement(CobolPreprocessor.CopyStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#includeStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIncludeStatement(CobolPreprocessor.IncludeStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#plusplusIncludeStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlusplusIncludeStatement(CobolPreprocessor.PlusplusIncludeStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copyIdmsStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyIdmsStatement(CobolPreprocessor.CopyIdmsStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copyIdmsOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyIdmsOptions(CobolPreprocessor.CopyIdmsOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copyIdmsSource}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyIdmsSource(CobolPreprocessor.CopyIdmsSourceContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#versionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVersionClause(CobolPreprocessor.VersionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copyMaidStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyMaidStatement(CobolPreprocessor.CopyMaidStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copySource}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopySource(CobolPreprocessor.CopySourceContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#copyLibrary}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyLibrary(CobolPreprocessor.CopyLibraryContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#qualifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQualifier(CobolPreprocessor.QualifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#titleDirective}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTitleDirective(CobolPreprocessor.TitleDirectiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#enterDirective}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnterDirective(CobolPreprocessor.EnterDirectiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#routineName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRoutineName(CobolPreprocessor.RoutineNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#languageName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLanguageName(CobolPreprocessor.LanguageNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#controlDirective}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitControlDirective(CobolPreprocessor.ControlDirectiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#controlCbl}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitControlCbl(CobolPreprocessor.ControlCblContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#controlOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitControlOptions(CobolPreprocessor.ControlOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replacingPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplacingPhrase(CobolPreprocessor.ReplacingPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replaceAreaStart}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplaceAreaStart(CobolPreprocessor.ReplaceAreaStartContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replaceOffStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplaceOffStatement(CobolPreprocessor.ReplaceOffStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replaceClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplaceClause(CobolPreprocessor.ReplaceClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replaceLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplaceLiteral(CobolPreprocessor.ReplaceLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replacePseudoText}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplacePseudoText(CobolPreprocessor.ReplacePseudoTextContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#pseudoReplaceable}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPseudoReplaceable(CobolPreprocessor.PseudoReplaceableContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#pseudoReplacement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPseudoReplacement(CobolPreprocessor.PseudoReplacementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#openingPseudoTextDelimiter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOpeningPseudoTextDelimiter(CobolPreprocessor.OpeningPseudoTextDelimiterContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#closingPseudoTextDelimiter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClosingPseudoTextDelimiter(CobolPreprocessor.ClosingPseudoTextDelimiterContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replaceable}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplaceable(CobolPreprocessor.ReplaceableContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#functionCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCall(CobolPreprocessor.FunctionCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#functionName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionName(CobolPreprocessor.FunctionNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#argument}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArgument(CobolPreprocessor.ArgumentContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#replacement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplacement(CobolPreprocessor.ReplacementContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#charDataLine}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCharDataLine(CobolPreprocessor.CharDataLineContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#cobolWord}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCobolWord(CobolPreprocessor.CobolWordContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#literal}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiteral(CobolPreprocessor.LiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link CobolPreprocessor#integerLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIntegerLiteral(CobolPreprocessor.IntegerLiteralContext ctx);
}