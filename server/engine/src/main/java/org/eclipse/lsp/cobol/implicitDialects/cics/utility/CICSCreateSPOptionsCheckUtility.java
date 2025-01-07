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

        import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
        import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
        import org.eclipse.lsp.cobol.common.error.SyntaxError;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_create;

/** Checks CICS Create System Command rules for required and invalid options */
public class CICSCreateSPOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_create;
    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2CONN, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2TRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.FILE, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
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
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPETERM, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.SESSIONS, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTRIBUTES, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTRLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.DISCARD, ErrorSeverity.WARNING);
                    put(CICSLexer.COMPLETE, ErrorSeverity.WARNING);
                    put(CICSLexer.LOG, ErrorSeverity.WARNING);
                    put(CICSLexer.NOLOG, ErrorSeverity.WARNING);
                    put(CICSLexer.LOGMESSAGE, ErrorSeverity.ERROR);
                }
            };
    public CICSCreateSPOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Create System Command rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == CICSParser.RULE_cics_create_opts)
            checkOpts((CICSParser.Cics_create_optsContext) ctx);

        checkDuplicates(ctx);
    }
    private void checkOpts(CICSParser.Cics_create_optsContext ctx) {
        checkHasMutuallyExclusiveOptions(ctx.ATOMSERVICE(), ctx.BUNDLE(), ctx.DB2CONN(), ctx.DB2ENTRY(), ctx.DB2TRAN(), ctx.DOCTEMPLATE(), ctx.DUMPCODE(),
                ctx.ENQMODEL(), ctx.FILE(), ctx.PIPELINE(), ctx.IPCONN(), ctx.JOURNALMODEL(), ctx.JVMSERVER(), ctx.LIBRARY(),
                ctx.LSRPOOL(), ctx.MAPSET(), ctx.MQCONN(), ctx.MQMONITOR(), ctx.PARTITIONSET(), ctx.PARTNER(),
                ctx.PROCESSTYPE(), ctx.PROFILE(), ctx.PROGRAM(), ctx.TCPIPSERVICE(), ctx.TDQUEUE(), ctx.TRANCLASS(),
                ctx.TRANSACTION(), ctx.TSMODEL(), ctx.TYPETERM(), ctx.URIMAP(), ctx.WEBSERVICE(), ctx.SESSIONS(),
                ctx.TERMINAL(), ctx.CONNECTION());

                if (!ctx.CONNECTION().isEmpty()  || !ctx.TERMINAL().isEmpty()) {
            checkHasExactlyOneOption("ATTRIBUTES or COMPLETE or DISCARD", ctx, ctx.ATTRIBUTES(), ctx.COMPLETE(), ctx.DISCARD());
            if (!ctx.DISCARD().isEmpty() || !ctx.COMPLETE().isEmpty()) {
                checkHasIllegalOptions(ctx.ATTRLEN(), "ATTRLEN");
                checkHasIllegalOptions(ctx.LOG(), "LOG");
                checkHasIllegalOptions(ctx.NOLOG(), "NOLOG");
                checkHasIllegalOptions(ctx.LOGMESSAGE(), "LOGMESSAGE");
            }
        } else {
            checkHasIllegalOptions(ctx.DISCARD(), "DISCARD");
            checkHasIllegalOptions(ctx.COMPLETE(), "COMPLETE");
            checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
        }
        checkHasMutuallyExclusiveOptions("LOG or NOLOG or LOGMESSAGE", ctx.LOG(), ctx.NOLOG(), ctx.LOGMESSAGE());
    }
}

