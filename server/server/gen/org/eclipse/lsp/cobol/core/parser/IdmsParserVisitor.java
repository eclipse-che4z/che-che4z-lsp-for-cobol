// Generated from /Users/leonid/Documents/GitHub/che-che4z-lsp-for-cobol/server/src/main/antlr4/org/eclipse/lsp/cobol/core/parser/IdmsParser.g4 by ANTLR 4.9.2
package org.eclipse.lsp.cobol.core.parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link IdmsParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface IdmsParserVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link IdmsParser#startRule}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStartRule(IdmsParser.StartRuleContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsRules}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsRules(IdmsParser.IdmsRulesContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsSections}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsSections(IdmsParser.IdmsSectionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#copyIdmsStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyIdmsStatement(IdmsParser.CopyIdmsStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#copyIdmsOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyIdmsOptions(IdmsParser.CopyIdmsOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#copyIdmsSource}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyIdmsSource(IdmsParser.CopyIdmsSourceContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#copySource}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopySource(IdmsParser.CopySourceContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#copyLibrary}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyLibrary(IdmsParser.CopyLibraryContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#schemaSection}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSchemaSection(IdmsParser.SchemaSectionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#schemaDBEntry}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSchemaDBEntry(IdmsParser.SchemaDBEntryContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapSection}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapSection(IdmsParser.MapSectionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#maxFieldListClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMaxFieldListClause(IdmsParser.MaxFieldListClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapClause(IdmsParser.MapClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#versionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVersionClause(IdmsParser.VersionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsControlSection}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsControlSection(IdmsParser.IdmsControlSectionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsControlSectionParagraph}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsControlSectionParagraph(IdmsParser.IdmsControlSectionParagraphContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#protocolParagraphs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProtocolParagraphs(IdmsParser.ProtocolParagraphsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#protocolParagraph}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProtocolParagraph(IdmsParser.ProtocolParagraphContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#protocolEntry}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProtocolEntry(IdmsParser.ProtocolEntryContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#modeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModeClause(IdmsParser.ModeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#ssNamesLengthParagraph}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSsNamesLengthParagraph(IdmsParser.SsNamesLengthParagraphContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsRecordLocationParagraph}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsRecordLocationParagraph(IdmsParser.IdmsRecordLocationParagraphContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#withinClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWithinClause(IdmsParser.WithinClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#withinEntry}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWithinEntry(IdmsParser.WithinEntryContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#levelsClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLevelsClause(IdmsParser.LevelsClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#ss_names_length}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSs_names_length(IdmsParser.Ss_names_lengthContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#ifStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStatement(IdmsParser.IfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsIfCondition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsIfCondition(IdmsParser.IdmsIfConditionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsIfEmpty}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsIfEmpty(IdmsParser.IdmsIfEmptyContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsIfMember}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsIfMember(IdmsParser.IdmsIfMemberContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsIfStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsIfStatement(IdmsParser.IdmsIfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsStatements}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsStatements(IdmsParser.IdmsStatementsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsStmtsOptTermOn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsStmtsOptTermOn(IdmsParser.IdmsStmtsOptTermOnContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsStmtsMandTermOn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsStmtsMandTermOn(IdmsParser.IdmsStmtsMandTermOnContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsOnClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsOnClause(IdmsParser.IdmsOnClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#abendCodeStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAbendCodeStatement(IdmsParser.AbendCodeStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#abendCodeDumpClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAbendCodeDumpClause(IdmsParser.AbendCodeDumpClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#abendCodeExitClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAbendCodeExitClause(IdmsParser.AbendCodeExitClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#attachTaskCodeStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAttachTaskCodeStatement(IdmsParser.AttachTaskCodeStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#attachTaskCodePriorityClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAttachTaskCodePriorityClause(IdmsParser.AttachTaskCodePriorityClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindStatement(IdmsParser.BindStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindMapClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindMapClause(IdmsParser.BindMapClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindProcedureClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindProcedureClause(IdmsParser.BindProcedureClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindTaskClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindTaskClause(IdmsParser.BindTaskClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindTaskStatementNodenameClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindTaskStatementNodenameClause(IdmsParser.BindTaskStatementNodenameClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindTransactionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindTransactionClause(IdmsParser.BindTransactionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindRunUnitClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindRunUnitClause(IdmsParser.BindRunUnitClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindRecordClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindRecordClause(IdmsParser.BindRecordClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#bindDbNodeName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindDbNodeName(IdmsParser.BindDbNodeNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#changePriorityStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitChangePriorityStatement(IdmsParser.ChangePriorityStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#checkTerminalStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCheckTerminalStatement(IdmsParser.CheckTerminalStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#checkTerminalGetStorageClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCheckTerminalGetStorageClause(IdmsParser.CheckTerminalGetStorageClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#checkTerminalIntoClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCheckTerminalIntoClause(IdmsParser.CheckTerminalIntoClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#checkTerminalMaxLengthClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCheckTerminalMaxLengthClause(IdmsParser.CheckTerminalMaxLengthClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#checkTerminalReturnLengthClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCheckTerminalReturnLengthClause(IdmsParser.CheckTerminalReturnLengthClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#commitStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCommitStatement(IdmsParser.CommitStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#connectStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConnectStatement(IdmsParser.ConnectStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcStatement(IdmsParser.DcStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcNextTaskCodeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcNextTaskCodeClause(IdmsParser.DcNextTaskCodeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcOptionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcOptionClause(IdmsParser.DcOptionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcTimeoutClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcTimeoutClause(IdmsParser.DcTimeoutClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcNextTaskIntervalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcNextTaskIntervalClause(IdmsParser.DcNextTaskIntervalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcIntervalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcIntervalClause(IdmsParser.DcIntervalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcProgramClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcProgramClause(IdmsParser.DcProgramClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dcEventClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDcEventClause(IdmsParser.DcEventClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dequeueStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDequeueStatement(IdmsParser.DequeueStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dequeueNameStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDequeueNameStatement(IdmsParser.DequeueNameStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#disconnectStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisconnectStatement(IdmsParser.DisconnectStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndStatement(IdmsParser.EndStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endLineClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndLineClause(IdmsParser.EndLineClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endTransactionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndTransactionClause(IdmsParser.EndTransactionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endTransactionWriteClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndTransactionWriteClause(IdmsParser.EndTransactionWriteClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endTransactionIntoClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndTransactionIntoClause(IdmsParser.EndTransactionIntoClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endTransactionLengthClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndTransactionLengthClause(IdmsParser.EndTransactionLengthClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endpageStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndpageStatement(IdmsParser.EndpageStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#enqueueStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnqueueStatement(IdmsParser.EnqueueStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#enqueueNameClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnqueueNameClause(IdmsParser.EnqueueNameClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#eraseStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEraseStatement(IdmsParser.EraseStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#findStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFindStatement(IdmsParser.FindStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#freeStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFreeStatement(IdmsParser.FreeStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#freeStgidClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFreeStgidClause(IdmsParser.FreeStgidClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#freeForClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFreeForClause(IdmsParser.FreeForClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepClause(IdmsParser.KeepClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#findObtainClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFindObtainClause(IdmsParser.FindObtainClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#calcClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCalcClause(IdmsParser.CalcClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#currentClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCurrentClause(IdmsParser.CurrentClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#ownerClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOwnerClause(IdmsParser.OwnerClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#recnameClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRecnameClause(IdmsParser.RecnameClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dbkeyClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDbkeyClause(IdmsParser.DbkeyClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#positionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPositionClause(IdmsParser.PositionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#orderClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOrderClause(IdmsParser.OrderClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#finishStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFinishStatement(IdmsParser.FinishStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetStatement(IdmsParser.GetStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getQueueClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetQueueClause(IdmsParser.GetQueueClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getQueueTypeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetQueueTypeClause(IdmsParser.GetQueueTypeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getStatClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetStatClause(IdmsParser.GetStatClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getQueueLockClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetQueueLockClause(IdmsParser.GetQueueLockClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getLengthClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetLengthClause(IdmsParser.GetLengthClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getReturnClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetReturnClause(IdmsParser.GetReturnClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getScratchClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetScratchClause(IdmsParser.GetScratchClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getScratchAreaClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetScratchAreaClause(IdmsParser.GetScratchAreaClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getScratchNextClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetScratchNextClause(IdmsParser.GetScratchNextClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getStorageClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetStorageClause(IdmsParser.GetStorageClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getStorageValueClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetStorageValueClause(IdmsParser.GetStorageValueClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getStorageLocClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetStorageLocClause(IdmsParser.GetStorageLocClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getTimeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetTimeClause(IdmsParser.GetTimeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#getTimeIntoClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetTimeIntoClause(IdmsParser.GetTimeIntoClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inquireMapMoveStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInquireMapMoveStatement(IdmsParser.InquireMapMoveStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inqMapMovePhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInqMapMovePhrase(IdmsParser.InqMapMovePhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inquireMapIfStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInquireMapIfStatement(IdmsParser.InquireMapIfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inqMapIfPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInqMapIfPhrase(IdmsParser.InqMapIfPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inqMapWhichFields}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInqMapWhichFields(IdmsParser.InqMapWhichFieldsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inqMapWhichDflds}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInqMapWhichDflds(IdmsParser.InqMapWhichDfldsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inqMapFieldTestPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInqMapFieldTestPhrase(IdmsParser.InqMapFieldTestPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapEditPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapEditPhrase(IdmsParser.MapEditPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepStatement(IdmsParser.KeepStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepCurrentClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepCurrentClause(IdmsParser.KeepCurrentClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepLongtermClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepLongtermClause(IdmsParser.KeepLongtermClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepLongtermRestClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepLongtermRestClause(IdmsParser.KeepLongtermRestClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepLongtermNotifyClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepLongtermNotifyClause(IdmsParser.KeepLongtermNotifyClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepLongtermLockClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepLongtermLockClause(IdmsParser.KeepLongtermLockClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#keepLongtermTestClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepLongtermTestClause(IdmsParser.KeepLongtermTestClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#loadStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLoadStatement(IdmsParser.LoadStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#loadLocationClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLoadLocationClause(IdmsParser.LoadLocationClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#loadLoadlibClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLoadLoadlibClause(IdmsParser.LoadLoadlibClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapStatement(IdmsParser.MapStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapInClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapInClause(IdmsParser.MapInClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapIoInputPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapIoInputPhrase(IdmsParser.MapIoInputPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapInIoPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapInIoPhrase(IdmsParser.MapInIoPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapInputPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapInputPhrase(IdmsParser.MapInputPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapDetailPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapDetailPhrase(IdmsParser.MapDetailPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapDetailOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapDetailOptions(IdmsParser.MapDetailOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapOutClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapOutClause(IdmsParser.MapOutClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapOutIoPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapOutIoPhrase(IdmsParser.MapOutIoPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapOutIntoClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapOutIntoClause(IdmsParser.MapOutIntoClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapOutputPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapOutputPhrase(IdmsParser.MapOutputPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapMessagePhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapMessagePhrase(IdmsParser.MapMessagePhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapOutDetailPhrase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapOutDetailPhrase(IdmsParser.MapOutDetailPhraseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#mapOutInClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMapOutInClause(IdmsParser.MapOutInClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsDictnameClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsDictnameClause(IdmsParser.IdmsDictnameClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsDictnodeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsDictnodeClause(IdmsParser.IdmsDictnodeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsDmlFromClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsDmlFromClause(IdmsParser.IdmsDmlFromClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsDmlLengthClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsDmlLengthClause(IdmsParser.IdmsDmlLengthClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsWaitNowaitClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsWaitNowaitClause(IdmsParser.IdmsWaitNowaitClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#modifyStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModifyStatement(IdmsParser.ModifyStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#modifyMapClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModifyMapClause(IdmsParser.ModifyMapClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#modifyMapForClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModifyMapForClause(IdmsParser.ModifyMapForClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#modifyMapFieldOptionsClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModifyMapFieldOptionsClause(IdmsParser.ModifyMapFieldOptionsClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#attributeList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAttributeList(IdmsParser.AttributeListContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#obtainStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitObtainStatement(IdmsParser.ObtainStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#postStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPostStatement(IdmsParser.PostStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutStatement(IdmsParser.PutStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putQueueStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutQueueStatement(IdmsParser.PutQueueStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putReturnClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutReturnClause(IdmsParser.PutReturnClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putRetentionClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutRetentionClause(IdmsParser.PutRetentionClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putScratchClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutScratchClause(IdmsParser.PutScratchClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putAreaIdClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutAreaIdClause(IdmsParser.PutAreaIdClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#putRecordClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPutRecordClause(IdmsParser.PutRecordClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#readyStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReadyStatement(IdmsParser.ReadyStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#rollbackStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRollbackStatement(IdmsParser.RollbackStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#snapStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSnapStatement(IdmsParser.SnapStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#startpageStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStartpageStatement(IdmsParser.StartpageStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#storeStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStoreStatement(IdmsParser.StoreStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#transferStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTransferStatement(IdmsParser.TransferStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#waitStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWaitStatement(IdmsParser.WaitStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#waitEventTypeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWaitEventTypeClause(IdmsParser.WaitEventTypeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#waitEventListClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWaitEventListClause(IdmsParser.WaitEventListClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeIdmsStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteIdmsStatement(IdmsParser.WriteIdmsStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeJournalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteJournalClause(IdmsParser.WriteJournalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeLineClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteLineClause(IdmsParser.WriteLineClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeLogClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteLogClause(IdmsParser.WriteLogClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeLogParmsClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteLogParmsClause(IdmsParser.WriteLogParmsClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeLogReplyClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteLogReplyClause(IdmsParser.WriteLogReplyClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeLogMessagePrefixClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteLogMessagePrefixClause(IdmsParser.WriteLogMessagePrefixClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeLogTextClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteLogTextClause(IdmsParser.WriteLogTextClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writePrinterClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWritePrinterClause(IdmsParser.WritePrinterClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writePrinterNativeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWritePrinterNativeClause(IdmsParser.WritePrinterNativeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writePrinterTypeClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWritePrinterTypeClause(IdmsParser.WritePrinterTypeClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeTerminalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteTerminalClause(IdmsParser.WriteTerminalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeTerminalEraseClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteTerminalEraseClause(IdmsParser.WriteTerminalEraseClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#writeThenReadClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteThenReadClause(IdmsParser.WriteThenReadClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#readStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReadStatement(IdmsParser.ReadStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#readTerminalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReadTerminalClause(IdmsParser.ReadTerminalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#readLineFromTerminalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReadLineFromTerminalClause(IdmsParser.ReadLineFromTerminalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptStatement(IdmsParser.AcceptStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptIdmsDcClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptIdmsDcClause(IdmsParser.AcceptIdmsDcClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptTransactionStatisticsClause(IdmsParser.AcceptTransactionStatisticsClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsWriteClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptTransactionStatisticsWriteClause(IdmsParser.AcceptTransactionStatisticsWriteClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsIntoClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptTransactionStatisticsIntoClause(IdmsParser.AcceptTransactionStatisticsIntoClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptTransactionStatisticsLengthClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptTransactionStatisticsLengthClause(IdmsParser.AcceptTransactionStatisticsLengthClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptIdmsDbClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptIdmsDbClause(IdmsParser.AcceptIdmsDbClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptIdmsDbOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptIdmsDbOptions(IdmsParser.AcceptIdmsDbOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#acceptIdmsTypes}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcceptIdmsTypes(IdmsParser.AcceptIdmsTypesContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#currencyPageInfo}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCurrencyPageInfo(IdmsParser.CurrencyPageInfoContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteStatement(IdmsParser.DeleteStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteIdmsDCStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteIdmsDCStatement(IdmsParser.DeleteIdmsDCStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteQueueClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteQueueClause(IdmsParser.DeleteQueueClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteQueueIdClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteQueueIdClause(IdmsParser.DeleteQueueIdClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteScratchClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteScratchClause(IdmsParser.DeleteScratchClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteScratchIdClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteScratchIdClause(IdmsParser.DeleteScratchIdClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#deleteTableClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeleteTableClause(IdmsParser.DeleteTableClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#returnStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStatement(IdmsParser.ReturnStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idmsReturn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdmsReturn(IdmsParser.IdmsReturnContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#sendStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSendStatement(IdmsParser.SendStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#sendIdmsClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSendIdmsClause(IdmsParser.SendIdmsClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#sendIdmsToClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSendIdmsToClause(IdmsParser.SendIdmsToClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetStatement(IdmsParser.SetStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setIdmsDcStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetIdmsDcStatement(IdmsParser.SetIdmsDcStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setAbendExitStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetAbendExitStatement(IdmsParser.SetAbendExitStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerStatement(IdmsParser.SetTimerStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerWaitClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerWaitClause(IdmsParser.SetTimerWaitClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerPostClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerPostClause(IdmsParser.SetTimerPostClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerStartClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerStartClause(IdmsParser.SetTimerStartClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerIntervalClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerIntervalClause(IdmsParser.SetTimerIntervalClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerEventClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerEventClause(IdmsParser.SetTimerEventClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerIdClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerIdClause(IdmsParser.SetTimerIdClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#setTimerDataClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSetTimerDataClause(IdmsParser.SetTimerDataClauseContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_map_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_map_name(IdmsParser.Idms_map_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_db_entity_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_db_entity_name(IdmsParser.Idms_db_entity_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_map_name_definition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_map_name_definition(IdmsParser.Idms_map_name_definitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_schema_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_schema_name(IdmsParser.Idms_schema_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_subschema_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_subschema_name(IdmsParser.Idms_subschema_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_dictionary_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_dictionary_name(IdmsParser.Idms_dictionary_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_node_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_node_name(IdmsParser.Idms_node_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_procedure_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_procedure_name(IdmsParser.Idms_procedure_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_table_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_table_name(IdmsParser.Idms_table_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#generalIdentifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGeneralIdentifier(IdmsParser.GeneralIdentifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#functionCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCall(IdmsParser.FunctionCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#referenceModifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReferenceModifier(IdmsParser.ReferenceModifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#characterPosition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCharacterPosition(IdmsParser.CharacterPositionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#length}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLength(IdmsParser.LengthContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#idms_program_name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdms_program_name(IdmsParser.Idms_program_nameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#argument}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArgument(IdmsParser.ArgumentContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#qualifiedDataName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQualifiedDataName(IdmsParser.QualifiedDataNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#tableCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTableCall(IdmsParser.TableCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#specialRegister}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSpecialRegister(IdmsParser.SpecialRegisterContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#inData}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInData(IdmsParser.InDataContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#dataName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDataName(IdmsParser.DataNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#variableUsageName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableUsageName(IdmsParser.VariableUsageNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#functionName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionName(IdmsParser.FunctionNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#integerLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIntegerLiteral(IdmsParser.IntegerLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#literal}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiteral(IdmsParser.LiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#figurativeConstant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFigurativeConstant(IdmsParser.FigurativeConstantContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#booleanLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanLiteral(IdmsParser.BooleanLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#numericLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNumericLiteral(IdmsParser.NumericLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#charString}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCharString(IdmsParser.CharStringContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#arithmeticExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithmeticExpression(IdmsParser.ArithmeticExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#plusMinus}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlusMinus(IdmsParser.PlusMinusContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#multDivs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultDivs(IdmsParser.MultDivsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#multDiv}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultDiv(IdmsParser.MultDivContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#powers}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPowers(IdmsParser.PowersContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#power}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPower(IdmsParser.PowerContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#basis}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBasis(IdmsParser.BasisContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#cobolWord}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCobolWord(IdmsParser.CobolWordContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#cobolKeywords}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCobolKeywords(IdmsParser.CobolKeywordsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#cobolCompilerDirectivesKeywords}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCobolCompilerDirectivesKeywords(IdmsParser.CobolCompilerDirectivesKeywordsContext ctx);
	/**
	 * Visit a parse tree produced by {@link IdmsParser#endClause}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndClause(IdmsParser.EndClauseContext ctx);
}