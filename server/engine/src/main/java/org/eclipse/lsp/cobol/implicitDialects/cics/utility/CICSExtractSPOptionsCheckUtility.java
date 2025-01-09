/*
 * Copyright (c) 2024 Broadcom.
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
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/** Checks CICS Extract System Command rules for required and invalid options */
public class CICSExtractSPOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = CICSParser.RULE_cics_extract_system_programming;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.EXIT, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.ENTRYNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.GALENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.GASET, ErrorSeverity.ERROR);
                    put(CICSLexer.STATISTICS, ErrorSeverity.WARNING);
                    put(CICSLexer.RESTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RESID, ErrorSeverity.ERROR);
                    put(CICSLexer.RESIDLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.SET, ErrorSeverity.ERROR);
                    put(CICSLexer.SUBRESTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.SUBRESID, ErrorSeverity.ERROR);
                    put(CICSLexer.SUBRESIDLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLICATION, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLMAJORVER, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLMINORVER, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLMICROVER, ErrorSeverity.ERROR);
                    put(CICSLexer.PLATFORM, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTRESET, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTRESETABS, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTRESETHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTRESETMIN, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTRESETSEC, ErrorSeverity.ERROR);
                    //RESTYPE options//
                    put(CICSLexer.ASYNCSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.BUNDLE, ErrorSeverity.WARNING);
                    put(CICSLexer.DB2CONN, ErrorSeverity.WARNING);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.WARNING);
                    put(CICSLexer.DISPATCHER, ErrorSeverity.WARNING);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.WARNING);
                    put(CICSLexer.EPADAPTER, ErrorSeverity.WARNING);
                    put(CICSLexer.ENQUEUE, ErrorSeverity.WARNING);
                    put(CICSLexer.EVENTBINDING, ErrorSeverity.WARNING);
                    put(CICSLexer.EVENTPROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.FILE, ErrorSeverity.WARNING);
                    put(CICSLexer.IPCONN, ErrorSeverity.WARNING);
                    put(CICSLexer.JOURNALNAME, ErrorSeverity.WARNING);
                    put(CICSLexer.JVMPROGRAM, ErrorSeverity.WARNING);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.WARNING);
                    put(CICSLexer.LIBRARY, ErrorSeverity.WARNING);
                    put(CICSLexer.LSRPOOL, ErrorSeverity.WARNING);
                    put(CICSLexer.MONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.MQCONN, ErrorSeverity.WARNING);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.MVSTCB, ErrorSeverity.WARNING);
                    put(CICSLexer.NODEJSAPP, ErrorSeverity.WARNING);
                    put(CICSLexer.PIPELINE, ErrorSeverity.WARNING);
                    put(CICSLexer.POLICY, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGAUTO, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGRAMDEF, ErrorSeverity.WARNING);
                    put(CICSLexer.RECOVERY, ErrorSeverity.WARNING);
                    put(CICSLexer.SECURITY, ErrorSeverity.WARNING);
                    put(CICSLexer.STATS, ErrorSeverity.WARNING);
                    put(CICSLexer.STORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.STREAMNAME, ErrorSeverity.WARNING);
                    put(CICSLexer.SUBPOOL, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSDUMPCODE, ErrorSeverity.WARNING);
                    put(CICSLexer.TASKSUBPOOL, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIP, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANDUMPCODE, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.WARNING);
                    put(CICSLexer.TSQUEUE, ErrorSeverity.WARNING);
                    put(CICSLexer.URIMAP, ErrorSeverity.WARNING);
                    put(CICSLexer.USER, ErrorSeverity.WARNING);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.XMLTRANSFORM, ErrorSeverity.WARNING);
                }
            };

    public CICSExtractSPOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Extract System Command rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_extract_exit:
                checkExtractExit((CICSParser.Cics_extract_exitContext) ctx);
                break;
            case CICSParser.RULE_cics_extract_statistics:
                checkExtractStatistics((CICSParser.Cics_extract_statisticsContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }

    private void checkExtractExit(CICSParser.Cics_extract_exitContext ctx) {
        checkHasMandatoryOptions(ctx.EXIT(), ctx, "EXIT");
        checkHasMandatoryOptions(ctx.GALENGTH(), ctx, "GALENGTH");
        checkHasMandatoryOptions(ctx.GASET(), ctx, "GASET");
        checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
    }

    private void checkExtractStatistics(CICSParser.Cics_extract_statisticsContext ctx) {
        checkHasMandatoryOptions(ctx.STATISTICS(), ctx, "STATISTICS");
        checkRestypeOptions(ctx);
        checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
        if (ctx.RESID().isEmpty()) {
            checkForResidRequiredOptions(ctx);
        } else {
            checkAllOptionsArePresentOrAbsent("APPLICATION, APPLMAJORVER, APPLMINORVER, APPLMICROVER, PLATFORM", ctx, ctx.APPLICATION(), ctx.APPLMAJORVER(), ctx.APPLMINORVER(), ctx.APPLMICROVER(), ctx.PLATFORM());
        }
        checkSubResidOptions(ctx);
        checkLastTimeOptions(ctx);
    }

    /**
     * Helper function to enforce mututally exclusive RESTYPE options
     * @param ctx
     */
    private void checkRestypeOptions(CICSParser.Cics_extract_statisticsContext ctx) {
        List<CICSParser.Cics_restypeContext> restypes = ctx.cics_restype();
        checkHasMandatoryOptions(restypes, ctx, "RESTYPE");
        long distinctOptions = restypes.stream()
                .map(node -> (TerminalNode) node.getChild(0))
                .map(TerminalNode::getSymbol)
                .map(Token::getType)
                .distinct().count();

        if (distinctOptions > 1) {
            restypes.forEach(
                    node -> throwException(ErrorSeverity.ERROR, getLocality(node), "Multiple RESTYPE options are not allowed", "")
            );
        }
    }

    private void checkForResidRequiredOptions(CICSParser.Cics_extract_statisticsContext ctx) {
        checkHasIllegalOptions(ctx.RESIDLEN(), "RESIDLEN without RESID");
        checkHasIllegalOptions(ctx.APPLICATION(), "APPLICATION without RESID");
        checkHasIllegalOptions(ctx.APPLMAJORVER(), "APPLMAJORVER without RESID");
        checkHasIllegalOptions(ctx.APPLMINORVER(), "APPLMINORVER without RESID");
        checkHasIllegalOptions(ctx.APPLMICROVER(), "APPLMICROVER without RESID");
        checkHasIllegalOptions(ctx.PLATFORM(), "PLATFORM without RESID");
    }

    private void checkSubResidOptions(CICSParser.Cics_extract_statisticsContext ctx) {
        List<CICSParser.Cics_subrestypeContext> subrestypes = ctx.cics_subrestype();
        if (ctx.SUBRESID().isEmpty()) {
            checkHasIllegalOptions(ctx.SUBRESIDLEN(), "SUBRESIDLEN without SUBRESID");
            checkHasIllegalOptions(subrestypes, "SUBRESTYPE without SUBRESID");
        }
        List<TerminalNode> subrestype = subrestypes.stream().map(CICSParser.Cics_subrestypeContext::SUBRESTYPE).collect(Collectors.toList());
        List<TerminalNode> capturespec = subrestypes.stream().map(CICSParser.Cics_subrestypeContext::CAPTURESPEC).collect(Collectors.toList());
        List<TerminalNode> policyrule = subrestypes.stream().map(CICSParser.Cics_subrestypeContext::POLICYRULE).collect(Collectors.toList());

        checkHasMutuallyExclusiveOptions("SUBRESTYPE or CAPTURESPEC or POLICYRULE", subrestype, capturespec, policyrule);

        if (subrestypes.isEmpty()) {
            checkHasIllegalOptions(ctx.SUBRESID(), "SUBRESID without SUBRESTYPE");
            checkHasIllegalOptions(ctx.SUBRESIDLEN(), "SUBRESIDLEN without SUBRESTYPE");
        }
    }

    private void checkLastTimeOptions(CICSParser.Cics_extract_statisticsContext ctx) {
        if (!ctx.LASTRESET().isEmpty()) {
            checkHasIllegalOptions(ctx.LASTRESETABS(), "LASTRESETABS with LASTRESET");
            checkHasIllegalOptions(ctx.LASTRESETHRS(), "LASTRESETHRS with LASTRESET");
            checkHasIllegalOptions(ctx.LASTRESETMIN(), "LASTRESETMIN with LASTRESET");
            checkHasIllegalOptions(ctx.LASTRESETSEC(), "LASTRESETSEC with LASTRESET");
        }
        if (!ctx.LASTRESETABS().isEmpty()) {
            checkHasIllegalOptions(ctx.LASTRESET(), "LASTRESET with LASTRESETABS");
            checkHasIllegalOptions(ctx.LASTRESETHRS(), "LASTRESETHRS with LASTRESETABS");
            checkHasIllegalOptions(ctx.LASTRESETMIN(), "LASTRESETMIN with LASTRESETABS");
            checkHasIllegalOptions(ctx.LASTRESETSEC(), "LASTRESETSEC with LASTRESETABS");
        }
        checkAllOptionsArePresentOrAbsent("LASTRESETHRS, LASTRESETMIN, LASTRESETSEC", ctx, ctx.LASTRESETHRS(), ctx.LASTRESETMIN(), ctx.LASTRESETSEC());
    }

}
