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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_discard;

/** Checks CICS Discard rules for duplicates */
public class CICSDiscardOptionsUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_discard;


    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTINSTMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2CONN, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2TRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.FILE, ErrorSeverity.ERROR);
                    put(CICSLexer.IPCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRARY, ErrorSeverity.ERROR);
                    put(CICSLexer.MQCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTNER, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
                }
            };

    public CICSDiscardOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Discard rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        checkDuplicates(ctx);
    }

}
