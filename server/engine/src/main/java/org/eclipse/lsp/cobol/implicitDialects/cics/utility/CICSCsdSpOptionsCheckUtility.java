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

    private static final String MISSING_ATTRBUTES_OR_SET = "Missing required option for ATTRLEN: ATTRIBUTES or SET";
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
                    put(CICSLexer.DELETE, ErrorSeverity.WARNING);
                }
            };

    private static final Map<Integer, String> DUPLICATE_RULE_OPTIONS =
            new HashMap<Integer, String>() {
                {
                    put(CICSParser.RULE_cics_csd_cvda, "RESTYPE , ATOMSERVICE , BUNDLE , CONNECTION , CORBASERVER , DB2CONN , DB2ENTRY , DB2TRAN , DJAR , DOCTEMPLATE , DUMPCODE ,"
                            + "ENQMODEL , FILE , IPCONN , JOURNALMODEL , JVMSERVER , LIBRARY , LSRPOOL , MAPSET , MQCONN , MQMONITOR , PARTITIONSET , PARTNER , PIPELINE ,"
                            + "PROCESSTYPE , PROFILE , PROGRAM , REQUESTMODEL , SESSIONS , TCPIPSERVICE , TDQUEUE , TERMINAL , TRANCLASS , TRANSACTION , TSMODEL , TYPETERM , URIMAP , WEBSERVICE");
                }
            };

    public CICSCsdSpOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS, DUPLICATE_RULE_OPTIONS);
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
            case CICSParser.RULE_cics_csd_getnextgroup:
                checkGetNextGroup((CICSParser.Cics_csd_getnextgroupContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_getnextlist:
                checkGetNextList((CICSParser.Cics_csd_getnextlistContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_getnextrsrce:
                checkGetNextRsrce((CICSParser.Cics_csd_getnextrsrceContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_inquiregroup:
                checkInquireGroup((CICSParser.Cics_csd_inquiregroupContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_inquirelist:
                checkInquireList((CICSParser.Cics_csd_inquirelistContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_inquirersrce:
                checkInquireRsrce((CICSParser.Cics_csd_inquirersrceContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_install:
                checkInstall((CICSParser.Cics_csd_installContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_lock:
                checkLock((CICSParser.Cics_csd_lockContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_remove:
                checkRemove((CICSParser.Cics_csd_removeContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_rename:
                checkRename((CICSParser.Cics_csd_renameContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_startbrrsrce:
                checkStartbrRsrce((CICSParser.Cics_csd_startbrrsrceContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_unlock:
                checkUnlock((CICSParser.Cics_csd_unlockContext) ctx);
                break;
            case CICSParser.RULE_cics_csd_userdefine:
                checkUserDefine((CICSParser.Cics_csd_userdefineContext) ctx);
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
        checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
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
        checkHasExactlyOneOption("AS or TO", ctx, ctx.AS(), ctx.TO());
        if (!ctx.cics_csd_cvda().isEmpty()) {
            checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        } else if (!ctx.AS().isEmpty() || !ctx.RESID().isEmpty()) {
            checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
        }
    }
    private void checkDefine(CICSParser.Cics_csd_defineContext ctx) {
        checkHasMandatoryOptions(ctx.DEFINE(), ctx, "DEFINE");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
        checkHasMutuallyExclusiveOptions("NOCOMPAT or COMPATMODE or COMPAT", ctx.NOCOMPAT(), ctx.COMPATMODE(), ctx.COMPAT());
         checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
    }
    private void checkDelete(CICSParser.Cics_csd_deleteContext ctx) {
        checkHasMandatoryOptions(ctx.DELETE(), ctx, "DELETE");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMutuallyExclusiveOptions("LISTACTION or REMOVE", ctx.LISTACTION(), ctx.REMOVE());
        checkAllOptionsArePresentOrAbsent("RESID and any of " + CVDA_OPTS, ctx, ctx.RESID(), ctx.cics_csd_cvda());
    }
    private void checkGetNextGroup(CICSParser.Cics_csd_getnextgroupContext ctx) {
        checkHasMandatoryOptions(ctx.GETNEXTGROUP(), ctx, "GETNEXTGROUP");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
    }
    private void checkGetNextList(CICSParser.Cics_csd_getnextlistContext ctx) {
        checkHasMandatoryOptions(ctx.GETNEXTLIST(), ctx, "GETNEXTLIST");
        checkHasMandatoryOptions(ctx.LIST(), ctx, "LIST");
    }
    private void checkGetNextRsrce(CICSParser.Cics_csd_getnextrsrceContext ctx) {
        checkHasMandatoryOptions(ctx.GETNEXTRSRCE(), ctx, "GETNEXTRSRCE");
        checkHasMandatoryOptions(ctx.RESTYPE(), ctx, "RESTYPE");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMutuallyExclusiveOptions("ATTRIBUTES or SET", ctx.ATTRIBUTES(), ctx.ATTRIBUTES(), ctx.SET());
        if (!ctx.ATTRLEN().isEmpty() && (ctx.ATTRIBUTES().isEmpty() && ctx.SET().isEmpty())) {
            throwException(
                    ErrorSeverity.ERROR, getLocality(ctx), MISSING_ATTRBUTES_OR_SET, "");
        }
    }
    private void checkInquireGroup(CICSParser.Cics_csd_inquiregroupContext ctx) {
        checkHasMandatoryOptions(ctx.INQUIREGROUP(), ctx, "INQUIREGROUP");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
    }
    private void checkInquireList(CICSParser.Cics_csd_inquirelistContext ctx) {
        checkHasMandatoryOptions(ctx.INQUIRELIST(), ctx, "INQUIRELIST");
        checkHasMandatoryOptions(ctx.LIST(), ctx, "LIST");
    }
    private void checkInquireRsrce(CICSParser.Cics_csd_inquirersrceContext ctx) {
        checkHasMandatoryOptions(ctx.INQUIRERSRCE(), ctx, "INQUIRERSRCE");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
        checkHasExactlyOneOption("ATTRIBUTES or SET", ctx, ctx.ATTRIBUTES(), ctx.SET());
        if (!ctx.ATTRLEN().isEmpty() && (ctx.ATTRIBUTES().isEmpty() && ctx.SET().isEmpty())) {
            throwException(
                    ErrorSeverity.ERROR, getLocality(ctx), MISSING_ATTRBUTES_OR_SET, "");
        }
    }
    private void  checkInstall(CICSParser.Cics_csd_installContext ctx) {
        checkHasMandatoryOptions(ctx.INSTALL(), ctx, "INSTALL");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkAllOptionsArePresentOrAbsent("RESID and any of " + CVDA_OPTS, ctx, ctx.RESID(), ctx.cics_csd_cvda());
    }
    private void checkLock(CICSParser.Cics_csd_lockContext ctx) {
        checkHasMandatoryOptions(ctx.LOCK(), ctx, "LOCK");
        checkHasExactlyOneOption("LIST or GROUP", ctx, ctx.LIST(), ctx.GROUP());
    }
    private void checkRemove(CICSParser.Cics_csd_removeContext ctx) {
        checkHasMandatoryOptions(ctx.REMOVE(), ctx, "REMOVE");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.LIST(), ctx, "LIST");
    }
    private void checkRename(CICSParser.Cics_csd_renameContext ctx) {
        checkHasMandatoryOptions(ctx.RENAME(), ctx, "RENAME");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.AS(), ctx, "AS");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);

    }
    private void checkStartbrRsrce(CICSParser.Cics_csd_startbrrsrceContext ctx) {
        checkHasMandatoryOptions(ctx.STARTBRRSRCE(), ctx, "STARTBRRSRCE");
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
    }
    private void checkUnlock(CICSParser.Cics_csd_unlockContext ctx) {
        checkHasMandatoryOptions(ctx.UNLOCK(), ctx, "UNLOCK");
        checkHasExactlyOneOption("LIST or GROUP", ctx, ctx.LIST(), ctx.GROUP());
    }
    private void checkUserDefine(CICSParser.Cics_csd_userdefineContext ctx) {
        checkHasMandatoryOptions(ctx.GROUP(), ctx, "GROUP");
        checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
        checkHasMutuallyExclusiveOptions("NOCOMPAT or COMPATMODE or COMPAT", ctx.NOCOMPAT(), ctx.COMPATMODE(), ctx.COMPAT());
        checkPrerequisiteIsMet(ctx.ATTRIBUTES(), ctx.ATTRLEN(), ctx, "ATTRLEN without ATTRIBUTES");
         checkHasMandatoryOptions(ctx.cics_csd_cvda(), ctx, CVDA_OPTS);
    }
}
