/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

        import org.antlr.v4.runtime.ParserRuleContext;

        import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
        import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
        import org.eclipse.lsp.cobol.common.error.SyntaxError;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_csd;

/** Checks CICS CSD System Command rules for required and invalid options */
public class CICSCsdSpOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_csd;
    private static final String CVDA_OPTS = "RESTYPE or ATOMSERVICE or BUNDLE or CONNECTION or CORBASERVER or DB2CONN or DB2ENTRY or "
            + "DB2TRAN or DJAR or DOCTEMPLATE or DUMPCODE or ENQMODEL or FILE or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL or "
            + "MAPSET or MQCONN or MQMONITOR or PARTITIONSET or PARTNER or PIPELINE or PROCESSTYPE or PROFILE or PROGRAM or REQUESTMODEL or SESSIONS or "
            + "TCPIPSERVICE or TDQUEUE or TERMINAL or TRANCLASS or TRANSACTION or TSMODEL or TYPETERM or URIMAP or WEBSERVICE";
    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ADD, ErrorSeverity.WARNING);
                    put(CICSLexer.GROUP, ErrorSeverity.ERROR);
                    put(CICSLexer.LIST, ErrorSeverity.ERROR);
                    put(CICSLexer.BEFORE, ErrorSeverity.ERROR);
                    put(CICSLexer.AFTER, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTER, ErrorSeverity.WARNING);
                    put(CICSLexer.ATTRLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.NOCOMPAT, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPATMODE, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPAT, ErrorSeverity.ERROR);
                    put(CICSLexer.RESTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RESID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
                    put(CICSLexer.CORBASERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2CONN, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2TRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.DJAR, ErrorSeverity.ERROR);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.FILE, ErrorSeverity.ERROR);
                    put(CICSLexer.IPCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRARY, ErrorSeverity.ERROR);
                    put(CICSLexer.LSRPOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPSET, ErrorSeverity.ERROR);
                    put(CICSLexer.MQCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTITIONSET, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTNER, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.REQUESTMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.SESSIONS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPETERM, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.APPEND, ErrorSeverity.WARNING);
                    put(CICSLexer.TO, ErrorSeverity.ERROR);
                    put(CICSLexer.AS, ErrorSeverity.ERROR);
                    put(CICSLexer.COPY, ErrorSeverity.WARNING);
                    put(CICSLexer.DUPERROR, ErrorSeverity.ERROR);
                    put(CICSLexer.DUPACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DUPNOREPLACE, ErrorSeverity.ERROR);
                    put(CICSLexer.DUPREPLACE, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFINE, ErrorSeverity.WARNING);
                    put(CICSLexer.LISTACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.REMOVE, ErrorSeverity.ERROR);
                    put(CICSLexer.DISCONNECT, ErrorSeverity.WARNING);
                    put(CICSLexer.ENDBRGROUP, ErrorSeverity.WARNING);
                    put(CICSLexer.ENDBRLIST, ErrorSeverity.WARNING);
                    put(CICSLexer.GETNEXTGROUP, ErrorSeverity.WARNING);
                    put(CICSLexer.GETNEXTLIST, ErrorSeverity.WARNING);
                    put(CICSLexer.GETNEXTRSRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.ENDBRRSRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.ATTRIBUTES, ErrorSeverity.ERROR);
                    put(CICSLexer.SET, ErrorSeverity.ERROR);
                    put(CICSLexer.INQUIREGROUP, ErrorSeverity.WARNING);
                    put(CICSLexer.INQUIRELIST, ErrorSeverity.WARNING);
                    put(CICSLexer.INQUIRERSRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.INSTALL, ErrorSeverity.WARNING);
                    put(CICSLexer.LOCK, ErrorSeverity.WARNING);
                    put(CICSLexer.RENAME, ErrorSeverity.WARNING);
                    put(CICSLexer.STARTBRGROUP, ErrorSeverity.WARNING);
                    put(CICSLexer.STARTBRLIST, ErrorSeverity.WARNING);
                    put(CICSLexer.STARTBRRSRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.UNLOCK, ErrorSeverity.WARNING);
                    put(CICSLexer.USERDEFINE, ErrorSeverity.WARNING);
                }
            };

    public CICSCsdSpOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS CSD System Command rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {

        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_csd_add:
                checkAdd((CICSParser.Cics_csd_addContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_alter:
                checkAlter((CICSParser.Cics_csd_alterContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_append:
                checkAppend((CICSParser.Cics_csd_appendContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_copy:
                checkCopy((CICSParser.Cics_csd_copyContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_define:
                checkDefine((CICSParser.Cics_csd_defineContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_delete:
                checkDelete((CICSParser.Cics_csd_deleteContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }
    private void checkAdd(CICSParser.Cics_csd_addContext ctx) {
        checkHasMandatoryOptions(ctx.ADD(), ctx, "ADD");
        checkHasMandatoryOptions(ctx.LIST(), ctx, "LIST");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMutuallyExclusiveOptions("BEFORE or AFTER", ctx.BEFORE(), ctx.AFTER());
    }
    private void checkAlter(CICSParser.Cics_csd_alterContext ctx) {
        checkHasMandatoryOptions(ctx.ALTER(), ctx, "ALTER");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
        checkHasMutuallyExclusiveOptions("NOCOMPAT or COMPATMODE or COMPAT", ctx.NOCOMPAT(), ctx.COMPATMODE(), ctx.COMPAT());
        if (!ctx.cics_csd_cvda().isEmpty()) checkCvda(ctx.cics_csd_cvda().get(0));
        else checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
    }
    private void checkCvda(CICSParser.Cics_csd_cvdaContext ctx) {
            checkHasExactlyOneOption(CVDA_OPTS, ctx, ctx.RESTYPE(), ctx.ATOMSERVICE(), ctx.BUNDLE(),
                    ctx.CONNECTION(), ctx.CORBASERVER(), ctx.DB2CONN(), ctx.DB2ENTRY(), ctx.DB2TRAN(), ctx.DJAR(), ctx.DOCTEMPLATE(), ctx.DUMPCODE(), ctx.ENQMODEL(), ctx.FILE(),
                    ctx.IPCONN(), ctx.JOURNALMODEL(), ctx.JVMSERVER(), ctx.LIBRARY(), ctx.LSRPOOL(), ctx.MAPSET(), ctx.MQCONN(), ctx.MQMONITOR(), ctx.PARTITIONSET(), ctx.PARTNER(),
                    ctx.PIPELINE(), ctx.PROCESSTYPE(), ctx.PROFILE(), ctx.PROGRAM(), ctx.REQUESTMODEL(), ctx.SESSIONS(), ctx.TCPIPSERVICE(), ctx.TDQUEUE(), ctx.TERMINAL(), ctx.TRANCLASS(),
                    ctx.TRANSACTION(), ctx.TSMODEL(), ctx.TYPETERM(), ctx.URIMAP(), ctx.WEBSERVICE());
    }
    private void checkAppend(CICSParser.Cics_csd_appendContext ctx) {
        checkHasMandatoryOptions(ctx.APPEND(), ctx, "APPEND");
        checkHasMandatoryOptions(ctx.LIST(), ctx, "LIST");
        checkHasMandatoryOptions(ctx.TO(), ctx, "TO");
    }
    private void checkCopy(CICSParser.Cics_csd_copyContext ctx) {
        checkHasMandatoryOptions(ctx.COPY(), ctx, "COPY");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMutuallyExclusiveOptions("DUPERROR or DUPACTION or DUPNOREPLACE or DUPREPLACE", ctx.DUPERROR(), ctx.DUPACTION(), ctx.DUPNOREPLACE(), ctx.DUPREPLACE());
        if (!ctx.cics_csd_cvda().isEmpty()) {
            checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
            checkHasExactlyOneOption("AS or TO", ctx, ctx.AS(), ctx.TO());
            checkCvda(ctx.cics_csd_cvda().get(0));
        } else if (!ctx.AS().isEmpty()) {
            checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
        }
    }
    private void checkDefine(CICSParser.Cics_csd_defineContext ctx) {
        checkHasMandatoryOptions(ctx.DEFINE(), ctx, "DEFINE");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
        checkHasMutuallyExclusiveOptions("NOCOMPAT or COMPATMODE or COMPAT", ctx.NOCOMPAT(), ctx.COMPATMODE(), ctx.COMPAT());
        if (!ctx.cics_csd_cvda().isEmpty()) checkCvda(ctx.cics_csd_cvda().get(0));
        else checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
    }
    private void checkDelete(CICSParser.Cics_csd_deleteContext ctx) {
        checkHasMandatoryOptions(ctx.DELETE(), ctx, "DELETE");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMutuallyExclusiveOptions("LISTACTION or REMOVE", ctx.LISTACTION(), ctx.REMOVE());
        if (!ctx.cics_csd_cvda().isEmpty()) {
            checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
            checkCvda(ctx.cics_csd_cvda().get(0));
        } else if (!ctx.RESID().isEmpty()){
            checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
        }
    }
}
