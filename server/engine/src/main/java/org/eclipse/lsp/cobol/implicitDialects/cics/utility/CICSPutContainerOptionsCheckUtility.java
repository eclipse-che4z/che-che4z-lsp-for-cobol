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

import java.util.*;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_put_container;

/** Checks CICS PUT CONTAINER rules for required and invalid options */
public class CICSPutContainerOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_put_container;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
        new HashMap<Integer, ErrorSeverity>() {
            {
                put(CICSLexer.PUT, ErrorSeverity.ERROR);
                put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
                put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
                put(CICSLexer.ACQACTIVITY, ErrorSeverity.ERROR);
                put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
                put(CICSLexer.ACQPROCESS, ErrorSeverity.ERROR);
                put(CICSLexer.FROM, ErrorSeverity.ERROR);
                put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
            }
        };

    public CICSPutContainerOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS PUT CONTAINER rules for required and invalid options
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_put_container_bts:
                checkBTS((CICSParser.Cics_put_container_btsContext) ctx);
                break;
            case CICSParser.RULE_cics_put_container_channel:
                checkChannel((CICSParser.Cics_put_container_channelContext) ctx);
                break;
            default:
                break;
        }

        checkDuplicates(ctx);
    }

    private void checkBTS(CICSParser.Cics_put_container_btsContext ctx) {
        checkMutuallyExclusiveOptions("ACTIVITY, ACQACTIVITY, PROCESS or ACQPROCESS", ctx.ACTIVITY(), ctx.ACQACTIVITY(), ctx.PROCESS(), ctx.ACQPROCESS());
    }

    private void checkChannel(CICSParser.Cics_put_container_channelContext ctx) {
        checkMutuallyExclusiveOptions("BIT, DATATYPE or CHAR", ctx.BIT(), ctx.DATATYPE(), ctx.CHAR());

        checkMutuallyExclusiveOptions("FROMCCSID or FROMCODEPAGE", ctx.FROMCCSID(), ctx.FROMCODEPAGE());
    }

}
