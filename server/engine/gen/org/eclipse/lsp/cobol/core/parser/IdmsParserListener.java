// Generated from /Users/leonid/Documents/GitHub/che-che4z-lsp-for-cobol/server/src/main/antlr4/org/eclipse/lsp/cobol/core/parser/IdmsParser.g4 by ANTLR 4.9.2
package org.eclipse.lsp.cobol.core.parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link IdmsParser}.
 */
public interface IdmsParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link IdmsParser#startRule}.
	 * @param ctx the parse tree
	 */
	void enterStartRule(IdmsParser.StartRuleContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#startRule}.
	 * @param ctx the parse tree
	 */
	void exitStartRule(IdmsParser.StartRuleContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsRules}.
	 * @param ctx the parse tree
	 */
	void enterIdmsRules(IdmsParser.IdmsRulesContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsRules}.
	 * @param ctx the parse tree
	 */
	void exitIdmsRules(IdmsParser.IdmsRulesContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsSections}.
	 * @param ctx the parse tree
	 */
	void enterIdmsSections(IdmsParser.IdmsSectionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsSections}.
	 * @param ctx the parse tree
	 */
	void exitIdmsSections(IdmsParser.IdmsSectionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#copyIdmsStatement}.
	 * @param ctx the parse tree
	 */
	void enterCopyIdmsStatement(IdmsParser.CopyIdmsStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#copyIdmsStatement}.
	 * @param ctx the parse tree
	 */
	void exitCopyIdmsStatement(IdmsParser.CopyIdmsStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#copyIdmsOptions}.
	 * @param ctx the parse tree
	 */
	void enterCopyIdmsOptions(IdmsParser.CopyIdmsOptionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#copyIdmsOptions}.
	 * @param ctx the parse tree
	 */
	void exitCopyIdmsOptions(IdmsParser.CopyIdmsOptionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#copyIdmsSource}.
	 * @param ctx the parse tree
	 */
	void enterCopyIdmsSource(IdmsParser.CopyIdmsSourceContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#copyIdmsSource}.
	 * @param ctx the parse tree
	 */
	void exitCopyIdmsSource(IdmsParser.CopyIdmsSourceContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#copySource}.
	 * @param ctx the parse tree
	 */
	void enterCopySource(IdmsParser.CopySourceContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#copySource}.
	 * @param ctx the parse tree
	 */
	void exitCopySource(IdmsParser.CopySourceContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#copyLibrary}.
	 * @param ctx the parse tree
	 */
	void enterCopyLibrary(IdmsParser.CopyLibraryContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#copyLibrary}.
	 * @param ctx the parse tree
	 */
	void exitCopyLibrary(IdmsParser.CopyLibraryContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#schemaSection}.
	 * @param ctx the parse tree
	 */
	void enterSchemaSection(IdmsParser.SchemaSectionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#schemaSection}.
	 * @param ctx the parse tree
	 */
	void exitSchemaSection(IdmsParser.SchemaSectionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#schemaDBEntry}.
	 * @param ctx the parse tree
	 */
	void enterSchemaDBEntry(IdmsParser.SchemaDBEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#schemaDBEntry}.
	 * @param ctx the parse tree
	 */
	void exitSchemaDBEntry(IdmsParser.SchemaDBEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapSection}.
	 * @param ctx the parse tree
	 */
	void enterMapSection(IdmsParser.MapSectionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapSection}.
	 * @param ctx the parse tree
	 */
	void exitMapSection(IdmsParser.MapSectionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#maxFieldListClause}.
	 * @param ctx the parse tree
	 */
	void enterMaxFieldListClause(IdmsParser.MaxFieldListClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#maxFieldListClause}.
	 * @param ctx the parse tree
	 */
	void exitMaxFieldListClause(IdmsParser.MaxFieldListClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapClause}.
	 * @param ctx the parse tree
	 */
	void enterMapClause(IdmsParser.MapClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapClause}.
	 * @param ctx the parse tree
	 */
	void exitMapClause(IdmsParser.MapClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#versionClause}.
	 * @param ctx the parse tree
	 */
	void enterVersionClause(IdmsParser.VersionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#versionClause}.
	 * @param ctx the parse tree
	 */
	void exitVersionClause(IdmsParser.VersionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsControlSection}.
	 * @param ctx the parse tree
	 */
	void enterIdmsControlSection(IdmsParser.IdmsControlSectionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsControlSection}.
	 * @param ctx the parse tree
	 */
	void exitIdmsControlSection(IdmsParser.IdmsControlSectionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsControlSectionParagraph}.
	 * @param ctx the parse tree
	 */
	void enterIdmsControlSectionParagraph(IdmsParser.IdmsControlSectionParagraphContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsControlSectionParagraph}.
	 * @param ctx the parse tree
	 */
	void exitIdmsControlSectionParagraph(IdmsParser.IdmsControlSectionParagraphContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#protocolParagraphs}.
	 * @param ctx the parse tree
	 */
	void enterProtocolParagraphs(IdmsParser.ProtocolParagraphsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#protocolParagraphs}.
	 * @param ctx the parse tree
	 */
	void exitProtocolParagraphs(IdmsParser.ProtocolParagraphsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#protocolParagraph}.
	 * @param ctx the parse tree
	 */
	void enterProtocolParagraph(IdmsParser.ProtocolParagraphContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#protocolParagraph}.
	 * @param ctx the parse tree
	 */
	void exitProtocolParagraph(IdmsParser.ProtocolParagraphContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#protocolEntry}.
	 * @param ctx the parse tree
	 */
	void enterProtocolEntry(IdmsParser.ProtocolEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#protocolEntry}.
	 * @param ctx the parse tree
	 */
	void exitProtocolEntry(IdmsParser.ProtocolEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#modeClause}.
	 * @param ctx the parse tree
	 */
	void enterModeClause(IdmsParser.ModeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#modeClause}.
	 * @param ctx the parse tree
	 */
	void exitModeClause(IdmsParser.ModeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#ssNamesLengthParagraph}.
	 * @param ctx the parse tree
	 */
	void enterSsNamesLengthParagraph(IdmsParser.SsNamesLengthParagraphContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#ssNamesLengthParagraph}.
	 * @param ctx the parse tree
	 */
	void exitSsNamesLengthParagraph(IdmsParser.SsNamesLengthParagraphContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsRecordLocationParagraph}.
	 * @param ctx the parse tree
	 */
	void enterIdmsRecordLocationParagraph(IdmsParser.IdmsRecordLocationParagraphContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsRecordLocationParagraph}.
	 * @param ctx the parse tree
	 */
	void exitIdmsRecordLocationParagraph(IdmsParser.IdmsRecordLocationParagraphContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#withinClause}.
	 * @param ctx the parse tree
	 */
	void enterWithinClause(IdmsParser.WithinClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#withinClause}.
	 * @param ctx the parse tree
	 */
	void exitWithinClause(IdmsParser.WithinClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#withinEntry}.
	 * @param ctx the parse tree
	 */
	void enterWithinEntry(IdmsParser.WithinEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#withinEntry}.
	 * @param ctx the parse tree
	 */
	void exitWithinEntry(IdmsParser.WithinEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#levelsClause}.
	 * @param ctx the parse tree
	 */
	void enterLevelsClause(IdmsParser.LevelsClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#levelsClause}.
	 * @param ctx the parse tree
	 */
	void exitLevelsClause(IdmsParser.LevelsClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#ss_names_length}.
	 * @param ctx the parse tree
	 */
	void enterSs_names_length(IdmsParser.Ss_names_lengthContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#ss_names_length}.
	 * @param ctx the parse tree
	 */
	void exitSs_names_length(IdmsParser.Ss_names_lengthContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(IdmsParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(IdmsParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsIfCondition}.
	 * @param ctx the parse tree
	 */
	void enterIdmsIfCondition(IdmsParser.IdmsIfConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsIfCondition}.
	 * @param ctx the parse tree
	 */
	void exitIdmsIfCondition(IdmsParser.IdmsIfConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsIfEmpty}.
	 * @param ctx the parse tree
	 */
	void enterIdmsIfEmpty(IdmsParser.IdmsIfEmptyContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsIfEmpty}.
	 * @param ctx the parse tree
	 */
	void exitIdmsIfEmpty(IdmsParser.IdmsIfEmptyContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsIfMember}.
	 * @param ctx the parse tree
	 */
	void enterIdmsIfMember(IdmsParser.IdmsIfMemberContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsIfMember}.
	 * @param ctx the parse tree
	 */
	void exitIdmsIfMember(IdmsParser.IdmsIfMemberContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsIfStatement}.
	 * @param ctx the parse tree
	 */
	void enterIdmsIfStatement(IdmsParser.IdmsIfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsIfStatement}.
	 * @param ctx the parse tree
	 */
	void exitIdmsIfStatement(IdmsParser.IdmsIfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsStatements}.
	 * @param ctx the parse tree
	 */
	void enterIdmsStatements(IdmsParser.IdmsStatementsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsStatements}.
	 * @param ctx the parse tree
	 */
	void exitIdmsStatements(IdmsParser.IdmsStatementsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsStmtsOptTermOn}.
	 * @param ctx the parse tree
	 */
	void enterIdmsStmtsOptTermOn(IdmsParser.IdmsStmtsOptTermOnContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsStmtsOptTermOn}.
	 * @param ctx the parse tree
	 */
	void exitIdmsStmtsOptTermOn(IdmsParser.IdmsStmtsOptTermOnContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsStmtsMandTermOn}.
	 * @param ctx the parse tree
	 */
	void enterIdmsStmtsMandTermOn(IdmsParser.IdmsStmtsMandTermOnContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsStmtsMandTermOn}.
	 * @param ctx the parse tree
	 */
	void exitIdmsStmtsMandTermOn(IdmsParser.IdmsStmtsMandTermOnContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsOnClause}.
	 * @param ctx the parse tree
	 */
	void enterIdmsOnClause(IdmsParser.IdmsOnClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsOnClause}.
	 * @param ctx the parse tree
	 */
	void exitIdmsOnClause(IdmsParser.IdmsOnClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#abendCodeStatement}.
	 * @param ctx the parse tree
	 */
	void enterAbendCodeStatement(IdmsParser.AbendCodeStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#abendCodeStatement}.
	 * @param ctx the parse tree
	 */
	void exitAbendCodeStatement(IdmsParser.AbendCodeStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#abendCodeDumpClause}.
	 * @param ctx the parse tree
	 */
	void enterAbendCodeDumpClause(IdmsParser.AbendCodeDumpClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#abendCodeDumpClause}.
	 * @param ctx the parse tree
	 */
	void exitAbendCodeDumpClause(IdmsParser.AbendCodeDumpClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#abendCodeExitClause}.
	 * @param ctx the parse tree
	 */
	void enterAbendCodeExitClause(IdmsParser.AbendCodeExitClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#abendCodeExitClause}.
	 * @param ctx the parse tree
	 */
	void exitAbendCodeExitClause(IdmsParser.AbendCodeExitClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#attachTaskCodeStatement}.
	 * @param ctx the parse tree
	 */
	void enterAttachTaskCodeStatement(IdmsParser.AttachTaskCodeStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#attachTaskCodeStatement}.
	 * @param ctx the parse tree
	 */
	void exitAttachTaskCodeStatement(IdmsParser.AttachTaskCodeStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#attachTaskCodePriorityClause}.
	 * @param ctx the parse tree
	 */
	void enterAttachTaskCodePriorityClause(IdmsParser.AttachTaskCodePriorityClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#attachTaskCodePriorityClause}.
	 * @param ctx the parse tree
	 */
	void exitAttachTaskCodePriorityClause(IdmsParser.AttachTaskCodePriorityClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindStatement}.
	 * @param ctx the parse tree
	 */
	void enterBindStatement(IdmsParser.BindStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindStatement}.
	 * @param ctx the parse tree
	 */
	void exitBindStatement(IdmsParser.BindStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindMapClause}.
	 * @param ctx the parse tree
	 */
	void enterBindMapClause(IdmsParser.BindMapClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindMapClause}.
	 * @param ctx the parse tree
	 */
	void exitBindMapClause(IdmsParser.BindMapClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindProcedureClause}.
	 * @param ctx the parse tree
	 */
	void enterBindProcedureClause(IdmsParser.BindProcedureClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindProcedureClause}.
	 * @param ctx the parse tree
	 */
	void exitBindProcedureClause(IdmsParser.BindProcedureClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindTaskClause}.
	 * @param ctx the parse tree
	 */
	void enterBindTaskClause(IdmsParser.BindTaskClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindTaskClause}.
	 * @param ctx the parse tree
	 */
	void exitBindTaskClause(IdmsParser.BindTaskClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindTaskStatementNodenameClause}.
	 * @param ctx the parse tree
	 */
	void enterBindTaskStatementNodenameClause(IdmsParser.BindTaskStatementNodenameClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindTaskStatementNodenameClause}.
	 * @param ctx the parse tree
	 */
	void exitBindTaskStatementNodenameClause(IdmsParser.BindTaskStatementNodenameClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindTransactionClause}.
	 * @param ctx the parse tree
	 */
	void enterBindTransactionClause(IdmsParser.BindTransactionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindTransactionClause}.
	 * @param ctx the parse tree
	 */
	void exitBindTransactionClause(IdmsParser.BindTransactionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindRunUnitClause}.
	 * @param ctx the parse tree
	 */
	void enterBindRunUnitClause(IdmsParser.BindRunUnitClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindRunUnitClause}.
	 * @param ctx the parse tree
	 */
	void exitBindRunUnitClause(IdmsParser.BindRunUnitClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindRecordClause}.
	 * @param ctx the parse tree
	 */
	void enterBindRecordClause(IdmsParser.BindRecordClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindRecordClause}.
	 * @param ctx the parse tree
	 */
	void exitBindRecordClause(IdmsParser.BindRecordClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#bindDbNodeName}.
	 * @param ctx the parse tree
	 */
	void enterBindDbNodeName(IdmsParser.BindDbNodeNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#bindDbNodeName}.
	 * @param ctx the parse tree
	 */
	void exitBindDbNodeName(IdmsParser.BindDbNodeNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#changePriorityStatement}.
	 * @param ctx the parse tree
	 */
	void enterChangePriorityStatement(IdmsParser.ChangePriorityStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#changePriorityStatement}.
	 * @param ctx the parse tree
	 */
	void exitChangePriorityStatement(IdmsParser.ChangePriorityStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#checkTerminalStatement}.
	 * @param ctx the parse tree
	 */
	void enterCheckTerminalStatement(IdmsParser.CheckTerminalStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#checkTerminalStatement}.
	 * @param ctx the parse tree
	 */
	void exitCheckTerminalStatement(IdmsParser.CheckTerminalStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#checkTerminalGetStorageClause}.
	 * @param ctx the parse tree
	 */
	void enterCheckTerminalGetStorageClause(IdmsParser.CheckTerminalGetStorageClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#checkTerminalGetStorageClause}.
	 * @param ctx the parse tree
	 */
	void exitCheckTerminalGetStorageClause(IdmsParser.CheckTerminalGetStorageClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#checkTerminalIntoClause}.
	 * @param ctx the parse tree
	 */
	void enterCheckTerminalIntoClause(IdmsParser.CheckTerminalIntoClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#checkTerminalIntoClause}.
	 * @param ctx the parse tree
	 */
	void exitCheckTerminalIntoClause(IdmsParser.CheckTerminalIntoClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#checkTerminalMaxLengthClause}.
	 * @param ctx the parse tree
	 */
	void enterCheckTerminalMaxLengthClause(IdmsParser.CheckTerminalMaxLengthClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#checkTerminalMaxLengthClause}.
	 * @param ctx the parse tree
	 */
	void exitCheckTerminalMaxLengthClause(IdmsParser.CheckTerminalMaxLengthClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#checkTerminalReturnLengthClause}.
	 * @param ctx the parse tree
	 */
	void enterCheckTerminalReturnLengthClause(IdmsParser.CheckTerminalReturnLengthClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#checkTerminalReturnLengthClause}.
	 * @param ctx the parse tree
	 */
	void exitCheckTerminalReturnLengthClause(IdmsParser.CheckTerminalReturnLengthClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#commitStatement}.
	 * @param ctx the parse tree
	 */
	void enterCommitStatement(IdmsParser.CommitStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#commitStatement}.
	 * @param ctx the parse tree
	 */
	void exitCommitStatement(IdmsParser.CommitStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#connectStatement}.
	 * @param ctx the parse tree
	 */
	void enterConnectStatement(IdmsParser.ConnectStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#connectStatement}.
	 * @param ctx the parse tree
	 */
	void exitConnectStatement(IdmsParser.ConnectStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcStatement}.
	 * @param ctx the parse tree
	 */
	void enterDcStatement(IdmsParser.DcStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcStatement}.
	 * @param ctx the parse tree
	 */
	void exitDcStatement(IdmsParser.DcStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcNextTaskCodeClause}.
	 * @param ctx the parse tree
	 */
	void enterDcNextTaskCodeClause(IdmsParser.DcNextTaskCodeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcNextTaskCodeClause}.
	 * @param ctx the parse tree
	 */
	void exitDcNextTaskCodeClause(IdmsParser.DcNextTaskCodeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcOptionClause}.
	 * @param ctx the parse tree
	 */
	void enterDcOptionClause(IdmsParser.DcOptionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcOptionClause}.
	 * @param ctx the parse tree
	 */
	void exitDcOptionClause(IdmsParser.DcOptionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcTimeoutClause}.
	 * @param ctx the parse tree
	 */
	void enterDcTimeoutClause(IdmsParser.DcTimeoutClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcTimeoutClause}.
	 * @param ctx the parse tree
	 */
	void exitDcTimeoutClause(IdmsParser.DcTimeoutClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcNextTaskIntervalClause}.
	 * @param ctx the parse tree
	 */
	void enterDcNextTaskIntervalClause(IdmsParser.DcNextTaskIntervalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcNextTaskIntervalClause}.
	 * @param ctx the parse tree
	 */
	void exitDcNextTaskIntervalClause(IdmsParser.DcNextTaskIntervalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcIntervalClause}.
	 * @param ctx the parse tree
	 */
	void enterDcIntervalClause(IdmsParser.DcIntervalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcIntervalClause}.
	 * @param ctx the parse tree
	 */
	void exitDcIntervalClause(IdmsParser.DcIntervalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcProgramClause}.
	 * @param ctx the parse tree
	 */
	void enterDcProgramClause(IdmsParser.DcProgramClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcProgramClause}.
	 * @param ctx the parse tree
	 */
	void exitDcProgramClause(IdmsParser.DcProgramClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dcEventClause}.
	 * @param ctx the parse tree
	 */
	void enterDcEventClause(IdmsParser.DcEventClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dcEventClause}.
	 * @param ctx the parse tree
	 */
	void exitDcEventClause(IdmsParser.DcEventClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dequeueStatement}.
	 * @param ctx the parse tree
	 */
	void enterDequeueStatement(IdmsParser.DequeueStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dequeueStatement}.
	 * @param ctx the parse tree
	 */
	void exitDequeueStatement(IdmsParser.DequeueStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dequeueNameStatement}.
	 * @param ctx the parse tree
	 */
	void enterDequeueNameStatement(IdmsParser.DequeueNameStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dequeueNameStatement}.
	 * @param ctx the parse tree
	 */
	void exitDequeueNameStatement(IdmsParser.DequeueNameStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#disconnectStatement}.
	 * @param ctx the parse tree
	 */
	void enterDisconnectStatement(IdmsParser.DisconnectStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#disconnectStatement}.
	 * @param ctx the parse tree
	 */
	void exitDisconnectStatement(IdmsParser.DisconnectStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endStatement}.
	 * @param ctx the parse tree
	 */
	void enterEndStatement(IdmsParser.EndStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endStatement}.
	 * @param ctx the parse tree
	 */
	void exitEndStatement(IdmsParser.EndStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endLineClause}.
	 * @param ctx the parse tree
	 */
	void enterEndLineClause(IdmsParser.EndLineClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endLineClause}.
	 * @param ctx the parse tree
	 */
	void exitEndLineClause(IdmsParser.EndLineClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endTransactionClause}.
	 * @param ctx the parse tree
	 */
	void enterEndTransactionClause(IdmsParser.EndTransactionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endTransactionClause}.
	 * @param ctx the parse tree
	 */
	void exitEndTransactionClause(IdmsParser.EndTransactionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endTransactionWriteClause}.
	 * @param ctx the parse tree
	 */
	void enterEndTransactionWriteClause(IdmsParser.EndTransactionWriteClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endTransactionWriteClause}.
	 * @param ctx the parse tree
	 */
	void exitEndTransactionWriteClause(IdmsParser.EndTransactionWriteClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endTransactionIntoClause}.
	 * @param ctx the parse tree
	 */
	void enterEndTransactionIntoClause(IdmsParser.EndTransactionIntoClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endTransactionIntoClause}.
	 * @param ctx the parse tree
	 */
	void exitEndTransactionIntoClause(IdmsParser.EndTransactionIntoClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endTransactionLengthClause}.
	 * @param ctx the parse tree
	 */
	void enterEndTransactionLengthClause(IdmsParser.EndTransactionLengthClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endTransactionLengthClause}.
	 * @param ctx the parse tree
	 */
	void exitEndTransactionLengthClause(IdmsParser.EndTransactionLengthClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endpageStatement}.
	 * @param ctx the parse tree
	 */
	void enterEndpageStatement(IdmsParser.EndpageStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endpageStatement}.
	 * @param ctx the parse tree
	 */
	void exitEndpageStatement(IdmsParser.EndpageStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#enqueueStatement}.
	 * @param ctx the parse tree
	 */
	void enterEnqueueStatement(IdmsParser.EnqueueStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#enqueueStatement}.
	 * @param ctx the parse tree
	 */
	void exitEnqueueStatement(IdmsParser.EnqueueStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#enqueueNameClause}.
	 * @param ctx the parse tree
	 */
	void enterEnqueueNameClause(IdmsParser.EnqueueNameClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#enqueueNameClause}.
	 * @param ctx the parse tree
	 */
	void exitEnqueueNameClause(IdmsParser.EnqueueNameClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#eraseStatement}.
	 * @param ctx the parse tree
	 */
	void enterEraseStatement(IdmsParser.EraseStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#eraseStatement}.
	 * @param ctx the parse tree
	 */
	void exitEraseStatement(IdmsParser.EraseStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#findStatement}.
	 * @param ctx the parse tree
	 */
	void enterFindStatement(IdmsParser.FindStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#findStatement}.
	 * @param ctx the parse tree
	 */
	void exitFindStatement(IdmsParser.FindStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#freeStatement}.
	 * @param ctx the parse tree
	 */
	void enterFreeStatement(IdmsParser.FreeStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#freeStatement}.
	 * @param ctx the parse tree
	 */
	void exitFreeStatement(IdmsParser.FreeStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#freeStgidClause}.
	 * @param ctx the parse tree
	 */
	void enterFreeStgidClause(IdmsParser.FreeStgidClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#freeStgidClause}.
	 * @param ctx the parse tree
	 */
	void exitFreeStgidClause(IdmsParser.FreeStgidClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#freeForClause}.
	 * @param ctx the parse tree
	 */
	void enterFreeForClause(IdmsParser.FreeForClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#freeForClause}.
	 * @param ctx the parse tree
	 */
	void exitFreeForClause(IdmsParser.FreeForClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepClause(IdmsParser.KeepClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepClause(IdmsParser.KeepClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#findObtainClause}.
	 * @param ctx the parse tree
	 */
	void enterFindObtainClause(IdmsParser.FindObtainClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#findObtainClause}.
	 * @param ctx the parse tree
	 */
	void exitFindObtainClause(IdmsParser.FindObtainClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#calcClause}.
	 * @param ctx the parse tree
	 */
	void enterCalcClause(IdmsParser.CalcClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#calcClause}.
	 * @param ctx the parse tree
	 */
	void exitCalcClause(IdmsParser.CalcClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#currentClause}.
	 * @param ctx the parse tree
	 */
	void enterCurrentClause(IdmsParser.CurrentClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#currentClause}.
	 * @param ctx the parse tree
	 */
	void exitCurrentClause(IdmsParser.CurrentClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#ownerClause}.
	 * @param ctx the parse tree
	 */
	void enterOwnerClause(IdmsParser.OwnerClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#ownerClause}.
	 * @param ctx the parse tree
	 */
	void exitOwnerClause(IdmsParser.OwnerClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#recnameClause}.
	 * @param ctx the parse tree
	 */
	void enterRecnameClause(IdmsParser.RecnameClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#recnameClause}.
	 * @param ctx the parse tree
	 */
	void exitRecnameClause(IdmsParser.RecnameClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dbkeyClause}.
	 * @param ctx the parse tree
	 */
	void enterDbkeyClause(IdmsParser.DbkeyClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dbkeyClause}.
	 * @param ctx the parse tree
	 */
	void exitDbkeyClause(IdmsParser.DbkeyClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#positionClause}.
	 * @param ctx the parse tree
	 */
	void enterPositionClause(IdmsParser.PositionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#positionClause}.
	 * @param ctx the parse tree
	 */
	void exitPositionClause(IdmsParser.PositionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#orderClause}.
	 * @param ctx the parse tree
	 */
	void enterOrderClause(IdmsParser.OrderClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#orderClause}.
	 * @param ctx the parse tree
	 */
	void exitOrderClause(IdmsParser.OrderClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#finishStatement}.
	 * @param ctx the parse tree
	 */
	void enterFinishStatement(IdmsParser.FinishStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#finishStatement}.
	 * @param ctx the parse tree
	 */
	void exitFinishStatement(IdmsParser.FinishStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getStatement}.
	 * @param ctx the parse tree
	 */
	void enterGetStatement(IdmsParser.GetStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getStatement}.
	 * @param ctx the parse tree
	 */
	void exitGetStatement(IdmsParser.GetStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getQueueClause}.
	 * @param ctx the parse tree
	 */
	void enterGetQueueClause(IdmsParser.GetQueueClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getQueueClause}.
	 * @param ctx the parse tree
	 */
	void exitGetQueueClause(IdmsParser.GetQueueClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getQueueTypeClause}.
	 * @param ctx the parse tree
	 */
	void enterGetQueueTypeClause(IdmsParser.GetQueueTypeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getQueueTypeClause}.
	 * @param ctx the parse tree
	 */
	void exitGetQueueTypeClause(IdmsParser.GetQueueTypeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getStatClause}.
	 * @param ctx the parse tree
	 */
	void enterGetStatClause(IdmsParser.GetStatClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getStatClause}.
	 * @param ctx the parse tree
	 */
	void exitGetStatClause(IdmsParser.GetStatClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getQueueLockClause}.
	 * @param ctx the parse tree
	 */
	void enterGetQueueLockClause(IdmsParser.GetQueueLockClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getQueueLockClause}.
	 * @param ctx the parse tree
	 */
	void exitGetQueueLockClause(IdmsParser.GetQueueLockClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getLengthClause}.
	 * @param ctx the parse tree
	 */
	void enterGetLengthClause(IdmsParser.GetLengthClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getLengthClause}.
	 * @param ctx the parse tree
	 */
	void exitGetLengthClause(IdmsParser.GetLengthClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getReturnClause}.
	 * @param ctx the parse tree
	 */
	void enterGetReturnClause(IdmsParser.GetReturnClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getReturnClause}.
	 * @param ctx the parse tree
	 */
	void exitGetReturnClause(IdmsParser.GetReturnClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getScratchClause}.
	 * @param ctx the parse tree
	 */
	void enterGetScratchClause(IdmsParser.GetScratchClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getScratchClause}.
	 * @param ctx the parse tree
	 */
	void exitGetScratchClause(IdmsParser.GetScratchClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getScratchAreaClause}.
	 * @param ctx the parse tree
	 */
	void enterGetScratchAreaClause(IdmsParser.GetScratchAreaClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getScratchAreaClause}.
	 * @param ctx the parse tree
	 */
	void exitGetScratchAreaClause(IdmsParser.GetScratchAreaClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getScratchNextClause}.
	 * @param ctx the parse tree
	 */
	void enterGetScratchNextClause(IdmsParser.GetScratchNextClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getScratchNextClause}.
	 * @param ctx the parse tree
	 */
	void exitGetScratchNextClause(IdmsParser.GetScratchNextClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getStorageClause}.
	 * @param ctx the parse tree
	 */
	void enterGetStorageClause(IdmsParser.GetStorageClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getStorageClause}.
	 * @param ctx the parse tree
	 */
	void exitGetStorageClause(IdmsParser.GetStorageClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getStorageValueClause}.
	 * @param ctx the parse tree
	 */
	void enterGetStorageValueClause(IdmsParser.GetStorageValueClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getStorageValueClause}.
	 * @param ctx the parse tree
	 */
	void exitGetStorageValueClause(IdmsParser.GetStorageValueClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getStorageLocClause}.
	 * @param ctx the parse tree
	 */
	void enterGetStorageLocClause(IdmsParser.GetStorageLocClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getStorageLocClause}.
	 * @param ctx the parse tree
	 */
	void exitGetStorageLocClause(IdmsParser.GetStorageLocClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getTimeClause}.
	 * @param ctx the parse tree
	 */
	void enterGetTimeClause(IdmsParser.GetTimeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getTimeClause}.
	 * @param ctx the parse tree
	 */
	void exitGetTimeClause(IdmsParser.GetTimeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#getTimeIntoClause}.
	 * @param ctx the parse tree
	 */
	void enterGetTimeIntoClause(IdmsParser.GetTimeIntoClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#getTimeIntoClause}.
	 * @param ctx the parse tree
	 */
	void exitGetTimeIntoClause(IdmsParser.GetTimeIntoClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inquireMapMoveStatement}.
	 * @param ctx the parse tree
	 */
	void enterInquireMapMoveStatement(IdmsParser.InquireMapMoveStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inquireMapMoveStatement}.
	 * @param ctx the parse tree
	 */
	void exitInquireMapMoveStatement(IdmsParser.InquireMapMoveStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inqMapMovePhrase}.
	 * @param ctx the parse tree
	 */
	void enterInqMapMovePhrase(IdmsParser.InqMapMovePhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inqMapMovePhrase}.
	 * @param ctx the parse tree
	 */
	void exitInqMapMovePhrase(IdmsParser.InqMapMovePhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inquireMapIfStatement}.
	 * @param ctx the parse tree
	 */
	void enterInquireMapIfStatement(IdmsParser.InquireMapIfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inquireMapIfStatement}.
	 * @param ctx the parse tree
	 */
	void exitInquireMapIfStatement(IdmsParser.InquireMapIfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inqMapIfPhrase}.
	 * @param ctx the parse tree
	 */
	void enterInqMapIfPhrase(IdmsParser.InqMapIfPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inqMapIfPhrase}.
	 * @param ctx the parse tree
	 */
	void exitInqMapIfPhrase(IdmsParser.InqMapIfPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inqMapWhichFields}.
	 * @param ctx the parse tree
	 */
	void enterInqMapWhichFields(IdmsParser.InqMapWhichFieldsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inqMapWhichFields}.
	 * @param ctx the parse tree
	 */
	void exitInqMapWhichFields(IdmsParser.InqMapWhichFieldsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inqMapWhichDflds}.
	 * @param ctx the parse tree
	 */
	void enterInqMapWhichDflds(IdmsParser.InqMapWhichDfldsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inqMapWhichDflds}.
	 * @param ctx the parse tree
	 */
	void exitInqMapWhichDflds(IdmsParser.InqMapWhichDfldsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inqMapFieldTestPhrase}.
	 * @param ctx the parse tree
	 */
	void enterInqMapFieldTestPhrase(IdmsParser.InqMapFieldTestPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inqMapFieldTestPhrase}.
	 * @param ctx the parse tree
	 */
	void exitInqMapFieldTestPhrase(IdmsParser.InqMapFieldTestPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapEditPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapEditPhrase(IdmsParser.MapEditPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapEditPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapEditPhrase(IdmsParser.MapEditPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepStatement}.
	 * @param ctx the parse tree
	 */
	void enterKeepStatement(IdmsParser.KeepStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepStatement}.
	 * @param ctx the parse tree
	 */
	void exitKeepStatement(IdmsParser.KeepStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepCurrentClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepCurrentClause(IdmsParser.KeepCurrentClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepCurrentClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepCurrentClause(IdmsParser.KeepCurrentClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepLongtermClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepLongtermClause(IdmsParser.KeepLongtermClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepLongtermClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepLongtermClause(IdmsParser.KeepLongtermClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepLongtermRestClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepLongtermRestClause(IdmsParser.KeepLongtermRestClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepLongtermRestClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepLongtermRestClause(IdmsParser.KeepLongtermRestClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepLongtermNotifyClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepLongtermNotifyClause(IdmsParser.KeepLongtermNotifyClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepLongtermNotifyClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepLongtermNotifyClause(IdmsParser.KeepLongtermNotifyClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepLongtermLockClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepLongtermLockClause(IdmsParser.KeepLongtermLockClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepLongtermLockClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepLongtermLockClause(IdmsParser.KeepLongtermLockClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#keepLongtermTestClause}.
	 * @param ctx the parse tree
	 */
	void enterKeepLongtermTestClause(IdmsParser.KeepLongtermTestClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#keepLongtermTestClause}.
	 * @param ctx the parse tree
	 */
	void exitKeepLongtermTestClause(IdmsParser.KeepLongtermTestClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#loadStatement}.
	 * @param ctx the parse tree
	 */
	void enterLoadStatement(IdmsParser.LoadStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#loadStatement}.
	 * @param ctx the parse tree
	 */
	void exitLoadStatement(IdmsParser.LoadStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#loadLocationClause}.
	 * @param ctx the parse tree
	 */
	void enterLoadLocationClause(IdmsParser.LoadLocationClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#loadLocationClause}.
	 * @param ctx the parse tree
	 */
	void exitLoadLocationClause(IdmsParser.LoadLocationClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#loadLoadlibClause}.
	 * @param ctx the parse tree
	 */
	void enterLoadLoadlibClause(IdmsParser.LoadLoadlibClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#loadLoadlibClause}.
	 * @param ctx the parse tree
	 */
	void exitLoadLoadlibClause(IdmsParser.LoadLoadlibClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapStatement}.
	 * @param ctx the parse tree
	 */
	void enterMapStatement(IdmsParser.MapStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapStatement}.
	 * @param ctx the parse tree
	 */
	void exitMapStatement(IdmsParser.MapStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapInClause}.
	 * @param ctx the parse tree
	 */
	void enterMapInClause(IdmsParser.MapInClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapInClause}.
	 * @param ctx the parse tree
	 */
	void exitMapInClause(IdmsParser.MapInClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapIoInputPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapIoInputPhrase(IdmsParser.MapIoInputPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapIoInputPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapIoInputPhrase(IdmsParser.MapIoInputPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapInIoPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapInIoPhrase(IdmsParser.MapInIoPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapInIoPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapInIoPhrase(IdmsParser.MapInIoPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapInputPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapInputPhrase(IdmsParser.MapInputPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapInputPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapInputPhrase(IdmsParser.MapInputPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapDetailPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapDetailPhrase(IdmsParser.MapDetailPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapDetailPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapDetailPhrase(IdmsParser.MapDetailPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapDetailOptions}.
	 * @param ctx the parse tree
	 */
	void enterMapDetailOptions(IdmsParser.MapDetailOptionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapDetailOptions}.
	 * @param ctx the parse tree
	 */
	void exitMapDetailOptions(IdmsParser.MapDetailOptionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapOutClause}.
	 * @param ctx the parse tree
	 */
	void enterMapOutClause(IdmsParser.MapOutClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapOutClause}.
	 * @param ctx the parse tree
	 */
	void exitMapOutClause(IdmsParser.MapOutClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapOutIoPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapOutIoPhrase(IdmsParser.MapOutIoPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapOutIoPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapOutIoPhrase(IdmsParser.MapOutIoPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapOutIntoClause}.
	 * @param ctx the parse tree
	 */
	void enterMapOutIntoClause(IdmsParser.MapOutIntoClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapOutIntoClause}.
	 * @param ctx the parse tree
	 */
	void exitMapOutIntoClause(IdmsParser.MapOutIntoClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapOutputPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapOutputPhrase(IdmsParser.MapOutputPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapOutputPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapOutputPhrase(IdmsParser.MapOutputPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapMessagePhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapMessagePhrase(IdmsParser.MapMessagePhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapMessagePhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapMessagePhrase(IdmsParser.MapMessagePhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapOutDetailPhrase}.
	 * @param ctx the parse tree
	 */
	void enterMapOutDetailPhrase(IdmsParser.MapOutDetailPhraseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapOutDetailPhrase}.
	 * @param ctx the parse tree
	 */
	void exitMapOutDetailPhrase(IdmsParser.MapOutDetailPhraseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#mapOutInClause}.
	 * @param ctx the parse tree
	 */
	void enterMapOutInClause(IdmsParser.MapOutInClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#mapOutInClause}.
	 * @param ctx the parse tree
	 */
	void exitMapOutInClause(IdmsParser.MapOutInClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsDictnameClause}.
	 * @param ctx the parse tree
	 */
	void enterIdmsDictnameClause(IdmsParser.IdmsDictnameClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsDictnameClause}.
	 * @param ctx the parse tree
	 */
	void exitIdmsDictnameClause(IdmsParser.IdmsDictnameClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsDictnodeClause}.
	 * @param ctx the parse tree
	 */
	void enterIdmsDictnodeClause(IdmsParser.IdmsDictnodeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsDictnodeClause}.
	 * @param ctx the parse tree
	 */
	void exitIdmsDictnodeClause(IdmsParser.IdmsDictnodeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsDmlFromClause}.
	 * @param ctx the parse tree
	 */
	void enterIdmsDmlFromClause(IdmsParser.IdmsDmlFromClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsDmlFromClause}.
	 * @param ctx the parse tree
	 */
	void exitIdmsDmlFromClause(IdmsParser.IdmsDmlFromClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsDmlLengthClause}.
	 * @param ctx the parse tree
	 */
	void enterIdmsDmlLengthClause(IdmsParser.IdmsDmlLengthClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsDmlLengthClause}.
	 * @param ctx the parse tree
	 */
	void exitIdmsDmlLengthClause(IdmsParser.IdmsDmlLengthClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsWaitNowaitClause}.
	 * @param ctx the parse tree
	 */
	void enterIdmsWaitNowaitClause(IdmsParser.IdmsWaitNowaitClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsWaitNowaitClause}.
	 * @param ctx the parse tree
	 */
	void exitIdmsWaitNowaitClause(IdmsParser.IdmsWaitNowaitClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#modifyStatement}.
	 * @param ctx the parse tree
	 */
	void enterModifyStatement(IdmsParser.ModifyStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#modifyStatement}.
	 * @param ctx the parse tree
	 */
	void exitModifyStatement(IdmsParser.ModifyStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#modifyMapClause}.
	 * @param ctx the parse tree
	 */
	void enterModifyMapClause(IdmsParser.ModifyMapClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#modifyMapClause}.
	 * @param ctx the parse tree
	 */
	void exitModifyMapClause(IdmsParser.ModifyMapClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#modifyMapForClause}.
	 * @param ctx the parse tree
	 */
	void enterModifyMapForClause(IdmsParser.ModifyMapForClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#modifyMapForClause}.
	 * @param ctx the parse tree
	 */
	void exitModifyMapForClause(IdmsParser.ModifyMapForClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#modifyMapFieldOptionsClause}.
	 * @param ctx the parse tree
	 */
	void enterModifyMapFieldOptionsClause(IdmsParser.ModifyMapFieldOptionsClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#modifyMapFieldOptionsClause}.
	 * @param ctx the parse tree
	 */
	void exitModifyMapFieldOptionsClause(IdmsParser.ModifyMapFieldOptionsClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#attributeList}.
	 * @param ctx the parse tree
	 */
	void enterAttributeList(IdmsParser.AttributeListContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#attributeList}.
	 * @param ctx the parse tree
	 */
	void exitAttributeList(IdmsParser.AttributeListContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#obtainStatement}.
	 * @param ctx the parse tree
	 */
	void enterObtainStatement(IdmsParser.ObtainStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#obtainStatement}.
	 * @param ctx the parse tree
	 */
	void exitObtainStatement(IdmsParser.ObtainStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#postStatement}.
	 * @param ctx the parse tree
	 */
	void enterPostStatement(IdmsParser.PostStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#postStatement}.
	 * @param ctx the parse tree
	 */
	void exitPostStatement(IdmsParser.PostStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putStatement}.
	 * @param ctx the parse tree
	 */
	void enterPutStatement(IdmsParser.PutStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putStatement}.
	 * @param ctx the parse tree
	 */
	void exitPutStatement(IdmsParser.PutStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putQueueStatement}.
	 * @param ctx the parse tree
	 */
	void enterPutQueueStatement(IdmsParser.PutQueueStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putQueueStatement}.
	 * @param ctx the parse tree
	 */
	void exitPutQueueStatement(IdmsParser.PutQueueStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putReturnClause}.
	 * @param ctx the parse tree
	 */
	void enterPutReturnClause(IdmsParser.PutReturnClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putReturnClause}.
	 * @param ctx the parse tree
	 */
	void exitPutReturnClause(IdmsParser.PutReturnClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putRetentionClause}.
	 * @param ctx the parse tree
	 */
	void enterPutRetentionClause(IdmsParser.PutRetentionClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putRetentionClause}.
	 * @param ctx the parse tree
	 */
	void exitPutRetentionClause(IdmsParser.PutRetentionClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putScratchClause}.
	 * @param ctx the parse tree
	 */
	void enterPutScratchClause(IdmsParser.PutScratchClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putScratchClause}.
	 * @param ctx the parse tree
	 */
	void exitPutScratchClause(IdmsParser.PutScratchClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putAreaIdClause}.
	 * @param ctx the parse tree
	 */
	void enterPutAreaIdClause(IdmsParser.PutAreaIdClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putAreaIdClause}.
	 * @param ctx the parse tree
	 */
	void exitPutAreaIdClause(IdmsParser.PutAreaIdClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#putRecordClause}.
	 * @param ctx the parse tree
	 */
	void enterPutRecordClause(IdmsParser.PutRecordClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#putRecordClause}.
	 * @param ctx the parse tree
	 */
	void exitPutRecordClause(IdmsParser.PutRecordClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#readyStatement}.
	 * @param ctx the parse tree
	 */
	void enterReadyStatement(IdmsParser.ReadyStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#readyStatement}.
	 * @param ctx the parse tree
	 */
	void exitReadyStatement(IdmsParser.ReadyStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#rollbackStatement}.
	 * @param ctx the parse tree
	 */
	void enterRollbackStatement(IdmsParser.RollbackStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#rollbackStatement}.
	 * @param ctx the parse tree
	 */
	void exitRollbackStatement(IdmsParser.RollbackStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#snapStatement}.
	 * @param ctx the parse tree
	 */
	void enterSnapStatement(IdmsParser.SnapStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#snapStatement}.
	 * @param ctx the parse tree
	 */
	void exitSnapStatement(IdmsParser.SnapStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#startpageStatement}.
	 * @param ctx the parse tree
	 */
	void enterStartpageStatement(IdmsParser.StartpageStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#startpageStatement}.
	 * @param ctx the parse tree
	 */
	void exitStartpageStatement(IdmsParser.StartpageStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#storeStatement}.
	 * @param ctx the parse tree
	 */
	void enterStoreStatement(IdmsParser.StoreStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#storeStatement}.
	 * @param ctx the parse tree
	 */
	void exitStoreStatement(IdmsParser.StoreStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#transferStatement}.
	 * @param ctx the parse tree
	 */
	void enterTransferStatement(IdmsParser.TransferStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#transferStatement}.
	 * @param ctx the parse tree
	 */
	void exitTransferStatement(IdmsParser.TransferStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#waitStatement}.
	 * @param ctx the parse tree
	 */
	void enterWaitStatement(IdmsParser.WaitStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#waitStatement}.
	 * @param ctx the parse tree
	 */
	void exitWaitStatement(IdmsParser.WaitStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#waitEventTypeClause}.
	 * @param ctx the parse tree
	 */
	void enterWaitEventTypeClause(IdmsParser.WaitEventTypeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#waitEventTypeClause}.
	 * @param ctx the parse tree
	 */
	void exitWaitEventTypeClause(IdmsParser.WaitEventTypeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#waitEventListClause}.
	 * @param ctx the parse tree
	 */
	void enterWaitEventListClause(IdmsParser.WaitEventListClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#waitEventListClause}.
	 * @param ctx the parse tree
	 */
	void exitWaitEventListClause(IdmsParser.WaitEventListClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeIdmsStatement}.
	 * @param ctx the parse tree
	 */
	void enterWriteIdmsStatement(IdmsParser.WriteIdmsStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeIdmsStatement}.
	 * @param ctx the parse tree
	 */
	void exitWriteIdmsStatement(IdmsParser.WriteIdmsStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeJournalClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteJournalClause(IdmsParser.WriteJournalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeJournalClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteJournalClause(IdmsParser.WriteJournalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeLineClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteLineClause(IdmsParser.WriteLineClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeLineClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteLineClause(IdmsParser.WriteLineClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeLogClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteLogClause(IdmsParser.WriteLogClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeLogClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteLogClause(IdmsParser.WriteLogClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeLogParmsClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteLogParmsClause(IdmsParser.WriteLogParmsClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeLogParmsClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteLogParmsClause(IdmsParser.WriteLogParmsClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeLogReplyClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteLogReplyClause(IdmsParser.WriteLogReplyClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeLogReplyClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteLogReplyClause(IdmsParser.WriteLogReplyClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeLogMessagePrefixClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteLogMessagePrefixClause(IdmsParser.WriteLogMessagePrefixClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeLogMessagePrefixClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteLogMessagePrefixClause(IdmsParser.WriteLogMessagePrefixClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeLogTextClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteLogTextClause(IdmsParser.WriteLogTextClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeLogTextClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteLogTextClause(IdmsParser.WriteLogTextClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writePrinterClause}.
	 * @param ctx the parse tree
	 */
	void enterWritePrinterClause(IdmsParser.WritePrinterClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writePrinterClause}.
	 * @param ctx the parse tree
	 */
	void exitWritePrinterClause(IdmsParser.WritePrinterClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writePrinterNativeClause}.
	 * @param ctx the parse tree
	 */
	void enterWritePrinterNativeClause(IdmsParser.WritePrinterNativeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writePrinterNativeClause}.
	 * @param ctx the parse tree
	 */
	void exitWritePrinterNativeClause(IdmsParser.WritePrinterNativeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writePrinterTypeClause}.
	 * @param ctx the parse tree
	 */
	void enterWritePrinterTypeClause(IdmsParser.WritePrinterTypeClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writePrinterTypeClause}.
	 * @param ctx the parse tree
	 */
	void exitWritePrinterTypeClause(IdmsParser.WritePrinterTypeClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeTerminalClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteTerminalClause(IdmsParser.WriteTerminalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeTerminalClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteTerminalClause(IdmsParser.WriteTerminalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeTerminalEraseClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteTerminalEraseClause(IdmsParser.WriteTerminalEraseClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeTerminalEraseClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteTerminalEraseClause(IdmsParser.WriteTerminalEraseClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#writeThenReadClause}.
	 * @param ctx the parse tree
	 */
	void enterWriteThenReadClause(IdmsParser.WriteThenReadClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#writeThenReadClause}.
	 * @param ctx the parse tree
	 */
	void exitWriteThenReadClause(IdmsParser.WriteThenReadClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#readStatement}.
	 * @param ctx the parse tree
	 */
	void enterReadStatement(IdmsParser.ReadStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#readStatement}.
	 * @param ctx the parse tree
	 */
	void exitReadStatement(IdmsParser.ReadStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#readTerminalClause}.
	 * @param ctx the parse tree
	 */
	void enterReadTerminalClause(IdmsParser.ReadTerminalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#readTerminalClause}.
	 * @param ctx the parse tree
	 */
	void exitReadTerminalClause(IdmsParser.ReadTerminalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#readLineFromTerminalClause}.
	 * @param ctx the parse tree
	 */
	void enterReadLineFromTerminalClause(IdmsParser.ReadLineFromTerminalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#readLineFromTerminalClause}.
	 * @param ctx the parse tree
	 */
	void exitReadLineFromTerminalClause(IdmsParser.ReadLineFromTerminalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptStatement}.
	 * @param ctx the parse tree
	 */
	void enterAcceptStatement(IdmsParser.AcceptStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptStatement}.
	 * @param ctx the parse tree
	 */
	void exitAcceptStatement(IdmsParser.AcceptStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptIdmsDcClause}.
	 * @param ctx the parse tree
	 */
	void enterAcceptIdmsDcClause(IdmsParser.AcceptIdmsDcClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptIdmsDcClause}.
	 * @param ctx the parse tree
	 */
	void exitAcceptIdmsDcClause(IdmsParser.AcceptIdmsDcClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsClause}.
	 * @param ctx the parse tree
	 */
	void enterAcceptTransactionStatisticsClause(IdmsParser.AcceptTransactionStatisticsClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsClause}.
	 * @param ctx the parse tree
	 */
	void exitAcceptTransactionStatisticsClause(IdmsParser.AcceptTransactionStatisticsClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsWriteClause}.
	 * @param ctx the parse tree
	 */
	void enterAcceptTransactionStatisticsWriteClause(IdmsParser.AcceptTransactionStatisticsWriteClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsWriteClause}.
	 * @param ctx the parse tree
	 */
	void exitAcceptTransactionStatisticsWriteClause(IdmsParser.AcceptTransactionStatisticsWriteClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsIntoClause}.
	 * @param ctx the parse tree
	 */
	void enterAcceptTransactionStatisticsIntoClause(IdmsParser.AcceptTransactionStatisticsIntoClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsIntoClause}.
	 * @param ctx the parse tree
	 */
	void exitAcceptTransactionStatisticsIntoClause(IdmsParser.AcceptTransactionStatisticsIntoClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsLengthClause}.
	 * @param ctx the parse tree
	 */
	void enterAcceptTransactionStatisticsLengthClause(IdmsParser.AcceptTransactionStatisticsLengthClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsLengthClause}.
	 * @param ctx the parse tree
	 */
	void exitAcceptTransactionStatisticsLengthClause(IdmsParser.AcceptTransactionStatisticsLengthClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptIdmsDbClause}.
	 * @param ctx the parse tree
	 */
	void enterAcceptIdmsDbClause(IdmsParser.AcceptIdmsDbClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptIdmsDbClause}.
	 * @param ctx the parse tree
	 */
	void exitAcceptIdmsDbClause(IdmsParser.AcceptIdmsDbClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptIdmsDbOptions}.
	 * @param ctx the parse tree
	 */
	void enterAcceptIdmsDbOptions(IdmsParser.AcceptIdmsDbOptionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptIdmsDbOptions}.
	 * @param ctx the parse tree
	 */
	void exitAcceptIdmsDbOptions(IdmsParser.AcceptIdmsDbOptionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#acceptIdmsTypes}.
	 * @param ctx the parse tree
	 */
	void enterAcceptIdmsTypes(IdmsParser.AcceptIdmsTypesContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#acceptIdmsTypes}.
	 * @param ctx the parse tree
	 */
	void exitAcceptIdmsTypes(IdmsParser.AcceptIdmsTypesContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#currencyPageInfo}.
	 * @param ctx the parse tree
	 */
	void enterCurrencyPageInfo(IdmsParser.CurrencyPageInfoContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#currencyPageInfo}.
	 * @param ctx the parse tree
	 */
	void exitCurrencyPageInfo(IdmsParser.CurrencyPageInfoContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteStatement}.
	 * @param ctx the parse tree
	 */
	void enterDeleteStatement(IdmsParser.DeleteStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteStatement}.
	 * @param ctx the parse tree
	 */
	void exitDeleteStatement(IdmsParser.DeleteStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteIdmsDCStatement}.
	 * @param ctx the parse tree
	 */
	void enterDeleteIdmsDCStatement(IdmsParser.DeleteIdmsDCStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteIdmsDCStatement}.
	 * @param ctx the parse tree
	 */
	void exitDeleteIdmsDCStatement(IdmsParser.DeleteIdmsDCStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteQueueClause}.
	 * @param ctx the parse tree
	 */
	void enterDeleteQueueClause(IdmsParser.DeleteQueueClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteQueueClause}.
	 * @param ctx the parse tree
	 */
	void exitDeleteQueueClause(IdmsParser.DeleteQueueClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteQueueIdClause}.
	 * @param ctx the parse tree
	 */
	void enterDeleteQueueIdClause(IdmsParser.DeleteQueueIdClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteQueueIdClause}.
	 * @param ctx the parse tree
	 */
	void exitDeleteQueueIdClause(IdmsParser.DeleteQueueIdClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteScratchClause}.
	 * @param ctx the parse tree
	 */
	void enterDeleteScratchClause(IdmsParser.DeleteScratchClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteScratchClause}.
	 * @param ctx the parse tree
	 */
	void exitDeleteScratchClause(IdmsParser.DeleteScratchClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteScratchIdClause}.
	 * @param ctx the parse tree
	 */
	void enterDeleteScratchIdClause(IdmsParser.DeleteScratchIdClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteScratchIdClause}.
	 * @param ctx the parse tree
	 */
	void exitDeleteScratchIdClause(IdmsParser.DeleteScratchIdClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#deleteTableClause}.
	 * @param ctx the parse tree
	 */
	void enterDeleteTableClause(IdmsParser.DeleteTableClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#deleteTableClause}.
	 * @param ctx the parse tree
	 */
	void exitDeleteTableClause(IdmsParser.DeleteTableClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(IdmsParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(IdmsParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idmsReturn}.
	 * @param ctx the parse tree
	 */
	void enterIdmsReturn(IdmsParser.IdmsReturnContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idmsReturn}.
	 * @param ctx the parse tree
	 */
	void exitIdmsReturn(IdmsParser.IdmsReturnContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#sendStatement}.
	 * @param ctx the parse tree
	 */
	void enterSendStatement(IdmsParser.SendStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#sendStatement}.
	 * @param ctx the parse tree
	 */
	void exitSendStatement(IdmsParser.SendStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#sendIdmsClause}.
	 * @param ctx the parse tree
	 */
	void enterSendIdmsClause(IdmsParser.SendIdmsClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#sendIdmsClause}.
	 * @param ctx the parse tree
	 */
	void exitSendIdmsClause(IdmsParser.SendIdmsClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#sendIdmsToClause}.
	 * @param ctx the parse tree
	 */
	void enterSendIdmsToClause(IdmsParser.SendIdmsToClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#sendIdmsToClause}.
	 * @param ctx the parse tree
	 */
	void exitSendIdmsToClause(IdmsParser.SendIdmsToClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setStatement}.
	 * @param ctx the parse tree
	 */
	void enterSetStatement(IdmsParser.SetStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setStatement}.
	 * @param ctx the parse tree
	 */
	void exitSetStatement(IdmsParser.SetStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setIdmsDcStatement}.
	 * @param ctx the parse tree
	 */
	void enterSetIdmsDcStatement(IdmsParser.SetIdmsDcStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setIdmsDcStatement}.
	 * @param ctx the parse tree
	 */
	void exitSetIdmsDcStatement(IdmsParser.SetIdmsDcStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setAbendExitStatement}.
	 * @param ctx the parse tree
	 */
	void enterSetAbendExitStatement(IdmsParser.SetAbendExitStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setAbendExitStatement}.
	 * @param ctx the parse tree
	 */
	void exitSetAbendExitStatement(IdmsParser.SetAbendExitStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerStatement}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerStatement(IdmsParser.SetTimerStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerStatement}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerStatement(IdmsParser.SetTimerStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerWaitClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerWaitClause(IdmsParser.SetTimerWaitClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerWaitClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerWaitClause(IdmsParser.SetTimerWaitClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerPostClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerPostClause(IdmsParser.SetTimerPostClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerPostClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerPostClause(IdmsParser.SetTimerPostClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerStartClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerStartClause(IdmsParser.SetTimerStartClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerStartClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerStartClause(IdmsParser.SetTimerStartClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerIntervalClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerIntervalClause(IdmsParser.SetTimerIntervalClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerIntervalClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerIntervalClause(IdmsParser.SetTimerIntervalClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerEventClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerEventClause(IdmsParser.SetTimerEventClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerEventClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerEventClause(IdmsParser.SetTimerEventClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerIdClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerIdClause(IdmsParser.SetTimerIdClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerIdClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerIdClause(IdmsParser.SetTimerIdClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#setTimerDataClause}.
	 * @param ctx the parse tree
	 */
	void enterSetTimerDataClause(IdmsParser.SetTimerDataClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#setTimerDataClause}.
	 * @param ctx the parse tree
	 */
	void exitSetTimerDataClause(IdmsParser.SetTimerDataClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_map_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_map_name(IdmsParser.Idms_map_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_map_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_map_name(IdmsParser.Idms_map_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_db_entity_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_db_entity_name(IdmsParser.Idms_db_entity_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_db_entity_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_db_entity_name(IdmsParser.Idms_db_entity_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_map_name_definition}.
	 * @param ctx the parse tree
	 */
	void enterIdms_map_name_definition(IdmsParser.Idms_map_name_definitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_map_name_definition}.
	 * @param ctx the parse tree
	 */
	void exitIdms_map_name_definition(IdmsParser.Idms_map_name_definitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_schema_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_schema_name(IdmsParser.Idms_schema_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_schema_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_schema_name(IdmsParser.Idms_schema_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_subschema_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_subschema_name(IdmsParser.Idms_subschema_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_subschema_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_subschema_name(IdmsParser.Idms_subschema_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_dictionary_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_dictionary_name(IdmsParser.Idms_dictionary_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_dictionary_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_dictionary_name(IdmsParser.Idms_dictionary_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_node_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_node_name(IdmsParser.Idms_node_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_node_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_node_name(IdmsParser.Idms_node_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_procedure_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_procedure_name(IdmsParser.Idms_procedure_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_procedure_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_procedure_name(IdmsParser.Idms_procedure_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_table_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_table_name(IdmsParser.Idms_table_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_table_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_table_name(IdmsParser.Idms_table_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#generalIdentifier}.
	 * @param ctx the parse tree
	 */
	void enterGeneralIdentifier(IdmsParser.GeneralIdentifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#generalIdentifier}.
	 * @param ctx the parse tree
	 */
	void exitGeneralIdentifier(IdmsParser.GeneralIdentifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(IdmsParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(IdmsParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#referenceModifier}.
	 * @param ctx the parse tree
	 */
	void enterReferenceModifier(IdmsParser.ReferenceModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#referenceModifier}.
	 * @param ctx the parse tree
	 */
	void exitReferenceModifier(IdmsParser.ReferenceModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#characterPosition}.
	 * @param ctx the parse tree
	 */
	void enterCharacterPosition(IdmsParser.CharacterPositionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#characterPosition}.
	 * @param ctx the parse tree
	 */
	void exitCharacterPosition(IdmsParser.CharacterPositionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#length}.
	 * @param ctx the parse tree
	 */
	void enterLength(IdmsParser.LengthContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#length}.
	 * @param ctx the parse tree
	 */
	void exitLength(IdmsParser.LengthContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#idms_program_name}.
	 * @param ctx the parse tree
	 */
	void enterIdms_program_name(IdmsParser.Idms_program_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#idms_program_name}.
	 * @param ctx the parse tree
	 */
	void exitIdms_program_name(IdmsParser.Idms_program_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#argument}.
	 * @param ctx the parse tree
	 */
	void enterArgument(IdmsParser.ArgumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#argument}.
	 * @param ctx the parse tree
	 */
	void exitArgument(IdmsParser.ArgumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#qualifiedDataName}.
	 * @param ctx the parse tree
	 */
	void enterQualifiedDataName(IdmsParser.QualifiedDataNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#qualifiedDataName}.
	 * @param ctx the parse tree
	 */
	void exitQualifiedDataName(IdmsParser.QualifiedDataNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#tableCall}.
	 * @param ctx the parse tree
	 */
	void enterTableCall(IdmsParser.TableCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#tableCall}.
	 * @param ctx the parse tree
	 */
	void exitTableCall(IdmsParser.TableCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#specialRegister}.
	 * @param ctx the parse tree
	 */
	void enterSpecialRegister(IdmsParser.SpecialRegisterContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#specialRegister}.
	 * @param ctx the parse tree
	 */
	void exitSpecialRegister(IdmsParser.SpecialRegisterContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#inData}.
	 * @param ctx the parse tree
	 */
	void enterInData(IdmsParser.InDataContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#inData}.
	 * @param ctx the parse tree
	 */
	void exitInData(IdmsParser.InDataContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#dataName}.
	 * @param ctx the parse tree
	 */
	void enterDataName(IdmsParser.DataNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#dataName}.
	 * @param ctx the parse tree
	 */
	void exitDataName(IdmsParser.DataNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#variableUsageName}.
	 * @param ctx the parse tree
	 */
	void enterVariableUsageName(IdmsParser.VariableUsageNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#variableUsageName}.
	 * @param ctx the parse tree
	 */
	void exitVariableUsageName(IdmsParser.VariableUsageNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(IdmsParser.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(IdmsParser.FunctionNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#integerLiteral}.
	 * @param ctx the parse tree
	 */
	void enterIntegerLiteral(IdmsParser.IntegerLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#integerLiteral}.
	 * @param ctx the parse tree
	 */
	void exitIntegerLiteral(IdmsParser.IntegerLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(IdmsParser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(IdmsParser.LiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#figurativeConstant}.
	 * @param ctx the parse tree
	 */
	void enterFigurativeConstant(IdmsParser.FigurativeConstantContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#figurativeConstant}.
	 * @param ctx the parse tree
	 */
	void exitFigurativeConstant(IdmsParser.FigurativeConstantContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#booleanLiteral}.
	 * @param ctx the parse tree
	 */
	void enterBooleanLiteral(IdmsParser.BooleanLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#booleanLiteral}.
	 * @param ctx the parse tree
	 */
	void exitBooleanLiteral(IdmsParser.BooleanLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#numericLiteral}.
	 * @param ctx the parse tree
	 */
	void enterNumericLiteral(IdmsParser.NumericLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#numericLiteral}.
	 * @param ctx the parse tree
	 */
	void exitNumericLiteral(IdmsParser.NumericLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#charString}.
	 * @param ctx the parse tree
	 */
	void enterCharString(IdmsParser.CharStringContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#charString}.
	 * @param ctx the parse tree
	 */
	void exitCharString(IdmsParser.CharStringContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#arithmeticExpression}.
	 * @param ctx the parse tree
	 */
	void enterArithmeticExpression(IdmsParser.ArithmeticExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#arithmeticExpression}.
	 * @param ctx the parse tree
	 */
	void exitArithmeticExpression(IdmsParser.ArithmeticExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#plusMinus}.
	 * @param ctx the parse tree
	 */
	void enterPlusMinus(IdmsParser.PlusMinusContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#plusMinus}.
	 * @param ctx the parse tree
	 */
	void exitPlusMinus(IdmsParser.PlusMinusContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#multDivs}.
	 * @param ctx the parse tree
	 */
	void enterMultDivs(IdmsParser.MultDivsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#multDivs}.
	 * @param ctx the parse tree
	 */
	void exitMultDivs(IdmsParser.MultDivsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#multDiv}.
	 * @param ctx the parse tree
	 */
	void enterMultDiv(IdmsParser.MultDivContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#multDiv}.
	 * @param ctx the parse tree
	 */
	void exitMultDiv(IdmsParser.MultDivContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#powers}.
	 * @param ctx the parse tree
	 */
	void enterPowers(IdmsParser.PowersContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#powers}.
	 * @param ctx the parse tree
	 */
	void exitPowers(IdmsParser.PowersContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#power}.
	 * @param ctx the parse tree
	 */
	void enterPower(IdmsParser.PowerContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#power}.
	 * @param ctx the parse tree
	 */
	void exitPower(IdmsParser.PowerContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#basis}.
	 * @param ctx the parse tree
	 */
	void enterBasis(IdmsParser.BasisContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#basis}.
	 * @param ctx the parse tree
	 */
	void exitBasis(IdmsParser.BasisContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#cobolWord}.
	 * @param ctx the parse tree
	 */
	void enterCobolWord(IdmsParser.CobolWordContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#cobolWord}.
	 * @param ctx the parse tree
	 */
	void exitCobolWord(IdmsParser.CobolWordContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#cobolKeywords}.
	 * @param ctx the parse tree
	 */
	void enterCobolKeywords(IdmsParser.CobolKeywordsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#cobolKeywords}.
	 * @param ctx the parse tree
	 */
	void exitCobolKeywords(IdmsParser.CobolKeywordsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#cobolCompilerDirectivesKeywords}.
	 * @param ctx the parse tree
	 */
	void enterCobolCompilerDirectivesKeywords(IdmsParser.CobolCompilerDirectivesKeywordsContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#cobolCompilerDirectivesKeywords}.
	 * @param ctx the parse tree
	 */
	void exitCobolCompilerDirectivesKeywords(IdmsParser.CobolCompilerDirectivesKeywordsContext ctx);
	/**
	 * Enter a parse tree produced by {@link IdmsParser#endClause}.
	 * @param ctx the parse tree
	 */
	void enterEndClause(IdmsParser.EndClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link IdmsParser#endClause}.
	 * @param ctx the parse tree
	 */
	void exitEndClause(IdmsParser.EndClauseContext ctx);
}