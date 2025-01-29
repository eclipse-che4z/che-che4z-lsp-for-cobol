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

        import org.antlr.v4.runtime.tree.TerminalNode;
        import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
        import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
        import org.eclipse.lsp.cobol.common.error.SyntaxError;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

        import java.util.*;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

/** Checks CICS Create System Command rules for required and invalid options */
public class CICSPerformSPOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_perform;
    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.DELETSHIPPED, ErrorSeverity.WARNING);
                    put(CICSLexer.DUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPID, ErrorSeverity.ERROR);
                    put(CICSLexer.TITLE, ErrorSeverity.ERROR);
                    put(CICSLexer.TITLELENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.CALLER, ErrorSeverity.ERROR);
                    put(CICSLexer.CALLERLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDAFFINITY, ErrorSeverity.WARNING);
                    put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.NETID, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.JVM, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.ALL, ErrorSeverity.WARNING);
                    put(CICSLexer.JAVACORE, ErrorSeverity.ERROR);
                    put(CICSLexer.HEAP, ErrorSeverity.ERROR);
                    put(CICSLexer.SNAPTRACE, ErrorSeverity.ERROR);
                    put(CICSLexer.GATHER, ErrorSeverity.ERROR);
                    put(CICSLexer.STACKTRACE, ErrorSeverity.ERROR);
                    put(CICSLexer.GATHERTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.DIAGNOSTICS, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKID, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBERTY, ErrorSeverity.ERROR);
                    put(CICSLexer.REFRESH, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGI, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRTYACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.RESOURCETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.APPID, ErrorSeverity.ERROR);
                    put(CICSLexer.APPIDLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.CONFIG, ErrorSeverity.ERROR);
                    put(CICSLexer.SERVERDUMP, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGIACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.REFRESHPKGS, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.SCAN, ErrorSeverity.ERROR);
                    put(CICSLexer.RESETTIME, ErrorSeverity.WARNING);
                    put(CICSLexer.SECDISCOVERY, ErrorSeverity.WARNING);
                    put(CICSLexer.WRITE, ErrorSeverity.ERROR);
                    put(CICSLexer.SECURITY, ErrorSeverity.WARNING);
                    put(CICSLexer.REBUILD, ErrorSeverity.WARNING);
                    put(CICSLexer.ESMRESP, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTDOWN, ErrorSeverity.WARNING);
                    put(CICSLexer.PLT, ErrorSeverity.ERROR);
                    put(CICSLexer.PLTNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.SDTRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.NOSDTRAN, ErrorSeverity.WARNING);
                    put(CICSLexer.NORESTART, ErrorSeverity.WARNING);
                    put(CICSLexer.TAKEOVER, ErrorSeverity.WARNING);
                    put(CICSLexer.RESTART, ErrorSeverity.WARNING);
                    put(CICSLexer.SSL, ErrorSeverity.WARNING);
                    put(CICSLexer.GSKRESP, ErrorSeverity.ERROR);
                    put(CICSLexer.STATISTICS, ErrorSeverity.WARNING);
                    put(CICSLexer.RECORD, ErrorSeverity.WARNING);
                    put(CICSLexer.RESETNOW, ErrorSeverity.WARNING);
                    put(CICSLexer.ASYNCSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOINSTALL, ErrorSeverity.WARNING);
                    put(CICSLexer.BUNDLE, ErrorSeverity.WARNING);
                    put(CICSLexer.CAPTURESPEC, ErrorSeverity.WARNING);
                    put(CICSLexer.CIPHER, ErrorSeverity.WARNING);
                    put(CICSLexer.CONNECTION, ErrorSeverity.WARNING);
                    put(CICSLexer.DB2, ErrorSeverity.WARNING);
                    put(CICSLexer.DISPATCHER, ErrorSeverity.WARNING);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.WARNING);
                    put(CICSLexer.ENQUEUE, ErrorSeverity.WARNING);
                    put(CICSLexer.EPADAPTER, ErrorSeverity.WARNING);
                    put(CICSLexer.EVENTBINDING, ErrorSeverity.WARNING);
                    put(CICSLexer.EVENTPROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.FEPI, ErrorSeverity.WARNING);
                    put(CICSLexer.FILE, ErrorSeverity.WARNING);
                    put(CICSLexer.IPCONN, ErrorSeverity.WARNING);
                    put(CICSLexer.JOURNALNAME, ErrorSeverity.WARNING);
                    put(CICSLexer.JOURNALNUM, ErrorSeverity.WARNING);
                    put(CICSLexer.JVMPROGRAM, ErrorSeverity.WARNING);
                    put(CICSLexer.LIBRARY, ErrorSeverity.WARNING);
                    put(CICSLexer.LSRPOOL, ErrorSeverity.WARNING);
                    put(CICSLexer.MONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.MQCONN, ErrorSeverity.WARNING);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.NODEJSAPP, ErrorSeverity.WARNING);
                    put(CICSLexer.POLICY, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGAUTO, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGRAM, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGRAMDEF, ErrorSeverity.WARNING);
                    put(CICSLexer.RECOVERY, ErrorSeverity.WARNING);
                    put(CICSLexer.STATS, ErrorSeverity.WARNING);
                    put(CICSLexer.STORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.STREAMNAME, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.TABLEMGR, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIP, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.WARNING);
                    put(CICSLexer.TERMINAL, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.WARNING);
                    put(CICSLexer.TCLASS, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.WARNING);
                    put(CICSLexer.TSQUEUE, ErrorSeverity.WARNING);
                    put(CICSLexer.URIMAP, ErrorSeverity.WARNING);
                    put(CICSLexer.USER, ErrorSeverity.WARNING);
                    put(CICSLexer.VTAM, ErrorSeverity.WARNING);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.XMLTRANSFORM, ErrorSeverity.WARNING);
                }
            };
    public CICSPerformSPOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Perform System Command rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case RULE_cics_perform_dump:
                checkDump((CICSParser.Cics_perform_dumpContext) ctx);
                break;
            case RULE_cics_perform_endaffinity:
                checkEndAffinity((CICSParser.Cics_perform_endaffinityContext) ctx);
                break;
            case RULE_cics_perform_jvmserver:
                checkJvmServer((CICSParser.Cics_perform_jvmserverContext) ctx);
                break;
            case RULE_cics_perform_pipeline:
                checkPipeline((CICSParser.Cics_perform_pipelineContext) ctx);
                break;
            case RULE_cics_perform_secdiscovery:
                checkSecdiscovery((CICSParser.Cics_perform_secdiscoveryContext) ctx);
                break;
            case RULE_cics_perform_security:
                checkSecurity((CICSParser.Cics_perform_securityContext) ctx);
                break;
            case RULE_cics_perform_shutdown:
                checkShutdown((CICSParser.Cics_perform_shutdownContext) ctx);
                break;
            case RULE_cics_perform_ssl:
                checkSsl((CICSParser.Cics_perform_sslContext) ctx);
                break;
            case RULE_cics_perform_statistics:
                checkstatistics((CICSParser.Cics_perform_statisticsContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }
    private void checkDump(CICSParser.Cics_perform_dumpContext ctx) {
        checkHasMandatoryOptions(ctx.DUMP(), ctx, "DUMP");
        checkHasMandatoryOptions(ctx.DUMPCODE(), ctx, "DUMPCODE");
        checkAllOptionsArePresentOrAbsent("TITLE, TITLELENGTH", ctx, ctx.TITLE(), ctx.TITLELENGTH());
        checkAllOptionsArePresentOrAbsent("CALLER, CALLERLENGTH", ctx, ctx.CALLER(), ctx.CALLERLENGTH());
        checkDumpDuplicates(ctx.DUMP(), ErrorSeverity.WARNING);
    }
    private void checkEndAffinity(CICSParser.Cics_perform_endaffinityContext ctx) {
        checkHasMandatoryOptions(ctx.ENDAFFINITY(), ctx, "ENDAFFINITY");
        checkHasMandatoryOptions(ctx.NETNAME(), ctx, "NETNAME");
    }
    private void checkJvmServer(CICSParser.Cics_perform_jvmserverContext ctx) {
        checkHasMandatoryOptions(ctx.JVMSERVER(), ctx, "JVMSERVER");
        checkHasExactlyOneOption("JVMTYPE or JVM or LIBERTY or OSGI", ctx, ctx.JVMTYPE(), ctx.JVM(), ctx.LIBERTY(), ctx.OSGI());
        if (!ctx.JVM().isEmpty()) {
            checkOptsLibertyPresent(ctx);
            checkOptsOsgiPresent(ctx);
            checkHasExactlyOneOption("JVMACTION or DUMP or GATHER or STACKTRACE", ctx, ctx.JVMACTION(), ctx.DUMP(), ctx.GATHER(), ctx.STACKTRACE());
            final List<TerminalNode> dumps = ctx.DUMP();
            if (!dumps.isEmpty()) {
                checkDumpDuplicates(dumps, ErrorSeverity.ERROR);
                checkHasExactlyOneOption("DUMPTYPE or ALL or JAVACORE or HEAP or SNAPTRACE", ctx, ctx.DUMPTYPE(), ctx.ALL(), ctx.JAVACORE(), ctx.HEAP(), ctx.SNAPTRACE());
            } else if (!ctx.GATHER().isEmpty()) {
                checkHasExactlyOneOption("GATHERTYPE or DIAGNOSTICS", ctx, ctx.GATHERTYPE(), ctx.DIAGNOSTICS());
            } else if (!ctx.STACKTRACE().isEmpty()) {
                checkHasMandatoryOptions(ctx.TASKID(), ctx, "TASKID");
            }
        } else if (!ctx.LIBERTY().isEmpty()) {
            checkOptsOsgiPresent(ctx);
            checkOptsJvmPresent(ctx);
            checkHasExactlyOneOption("LIBRTYACTION or REFRESH or SERVERDUMP", ctx, ctx.LIBRTYACTION(), ctx.REFRESH(), ctx.SERVERDUMP());
            if (!ctx.REFRESH().isEmpty()) {
                checkPrerequisiteIsMet(ctx.APPLICATION(), ctx.APPID(), ctx, "APPID without APPLICATION");
                checkPrerequisiteIsMet(ctx.APPID(), ctx.APPIDLEN(), ctx, "APPIDLEN without APPID");
                checkHasExactlyOneOption("RESOURCETYPE or APPLICATION or CONFIG", ctx, ctx.RESOURCETYPE(), ctx.APPLICATION(), ctx.CONFIG());
            }
        } else if (!ctx.OSGI().isEmpty()) {
            checkOptsJvmPresent(ctx);
            checkOptsLibertyPresent(ctx);
            checkHasExactlyOneOption("OSGIACTION or REFRESHPKGS", ctx, ctx.OSGIACTION(), ctx.REFRESHPKGS());
            }
    }
    private void checkOptsLibertyPresent(CICSParser.Cics_perform_jvmserverContext ctx) {
        checkHasIllegalOptions(ctx.LIBRTYACTION(), "LIBRTYACTION");
        checkHasIllegalOptions(ctx.REFRESH(), "REFRESH");
        checkHasIllegalOptions(ctx.APPLICATION(), "APPLICATION");
        checkHasIllegalOptions(ctx.APPID(), "APPID");
        checkHasIllegalOptions(ctx.APPIDLEN(), "APPIDLEN");
        checkHasIllegalOptions(ctx.CONFIG(), "CONFIG");
        checkHasIllegalOptions(ctx.SERVERDUMP(), "SERVERDUMP");
    }
    private void checkOptsOsgiPresent(CICSParser.Cics_perform_jvmserverContext ctx) {
        checkHasIllegalOptions(ctx.OSGIACTION(), "OSGIACTION");
        checkHasIllegalOptions(ctx.REFRESHPKGS(), "REFRESHPKGS");
    }
    private void checkOptsJvmPresent(CICSParser.Cics_perform_jvmserverContext ctx) {
        checkHasIllegalOptions(ctx.JVMACTION(), "JVMACTION");
        checkHasIllegalOptions(ctx.DUMP(), "DUMP");
        checkHasIllegalOptions(ctx.DUMPTYPE(), "DUMPTYPE");
        checkHasIllegalOptions(ctx.ALL(), "ALL");
        checkHasIllegalOptions(ctx.JAVACORE(), "JAVACORE");
        checkHasIllegalOptions(ctx.HEAP(), "HEAP");
        checkHasIllegalOptions(ctx.SNAPTRACE(), "SNAPTRACE");
        checkHasIllegalOptions(ctx.GATHER(), "GATHER");
        checkHasIllegalOptions(ctx.GATHERTYPE(), "GATHERTYPE");
        checkHasIllegalOptions(ctx.DIAGNOSTICS(), "DIAGNOSTICS");
        checkHasIllegalOptions(ctx.STACKTRACE(), "STACKTRACE");
        checkHasIllegalOptions(ctx.TASKID(), "TASKID");
    }
    private void checkPipeline(CICSParser.Cics_perform_pipelineContext ctx) {
        checkHasMandatoryOptions(ctx.PIPELINE(), ctx, "PIPELINE");
        checkHasMutuallyExclusiveOptions("ACTION or SCAN", ctx.ACTION(), ctx.SCAN());
    }
    private void checkSecdiscovery(CICSParser.Cics_perform_secdiscoveryContext ctx) {
        checkHasMandatoryOptions(ctx.SECDISCOVERY(), ctx, "SECDISCOVERY");
        checkHasExactlyOneOption("ACTION or WRITE", ctx, ctx.ACTION(), ctx.WRITE());
    }
    private void checkSecurity(CICSParser.Cics_perform_securityContext ctx) {
        checkHasMandatoryOptions(ctx.SECURITY(), ctx, "SECURITY");
        checkHasMandatoryOptions(ctx.REBUILD(), ctx, "REBUILD");
    }
    private void checkShutdown(CICSParser.Cics_perform_shutdownContext ctx) {
        checkHasMandatoryOptions(ctx.SHUTDOWN(), ctx, "SHUTDOWN");
        checkHasMutuallyExclusiveOptions("SDTRAN or NOSDTRAN", ctx.SDTRAN(), ctx.NOSDTRAN());
        checkHasMutuallyExclusiveOptions("IMMEDIATE or TAKEOVER", ctx.IMMEDIATE(), ctx.TAKEOVER());
        checkDumpDuplicates(ctx.DUMP(), ErrorSeverity.WARNING);
        if (!ctx.IMMEDIATE().isEmpty()) {
            checkHasIllegalOptions(ctx.RESTART(), "RESTART");
            checkHasIllegalOptions(ctx.XLT(), "XLT");
            checkHasIllegalOptions(ctx.PLT(), "PLT");
            checkHasIllegalOptions(ctx.PLTNAME(), "PLTNAME");
        } else if (!ctx.TAKEOVER().isEmpty()) {
            checkHasIllegalOptions(ctx.NORESTART(), "NORESTART");
            checkHasIllegalOptions(ctx.RESTART(), "RESTART");
            checkHasIllegalOptions(ctx.XLT(), "XLT");
            checkHasIllegalOptions(ctx.PLT(), "PLT");
            checkHasIllegalOptions(ctx.PLTNAME(), "PLTNAME");
        } else {
            checkHasMutuallyExclusiveOptions("PLT or PLTNAME", ctx.PLT(), ctx.PLTNAME());
            checkHasIllegalOptions(ctx.NORESTART(), "NORESTART");
        }
    }
    private void checkSsl(CICSParser.Cics_perform_sslContext ctx) {
        checkHasMandatoryOptions(ctx.SSL(), ctx, "SSL");
        checkHasMandatoryOptions(ctx.REBUILD(), ctx, "REBUILD");
    }
    private void checkstatistics(CICSParser.Cics_perform_statisticsContext ctx) {
        checkHasMandatoryOptions(ctx.STATISTICS(), ctx, "STATISTICS");
        checkHasMandatoryOptions(ctx.RECORD(), ctx, "RECORD");
        checkPrerequisiteIsMet(ctx.ALL(), ctx.RESETNOW(), ctx, "RESETNOW without ALL");
        checkHasMutuallyExclusiveOptions("JOURNALNAME or JOURNALNUM", ctx.JOURNALNAME(), ctx.JOURNALNUM());
        checkHasMutuallyExclusiveOptions("TRANCLASS or TCLASS", ctx.TRANCLASS(), ctx.TCLASS());
    }
    private void checkDumpDuplicates(List<TerminalNode> rules, ErrorSeverity severity) {
        if (rules.size() <= 1) return;
        rules.subList(1, rules.size()).forEach(
                 child -> {
                        throwException(severity,
                                getLocality(child),
                                "Excessive options provided for: ",
                                "DUMP");
                });
    }
}

