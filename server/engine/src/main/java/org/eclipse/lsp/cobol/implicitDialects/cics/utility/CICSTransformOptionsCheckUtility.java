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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_transform;

/**
 * Checks CICS Transform rules for required and invalid options
 */
public class CICSTransformOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_transform;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.INCONTAINER, ErrorSeverity.ERROR);
                    put(CICSLexer.OUTCONTAINER, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSFORMER, ErrorSeverity.ERROR);

                    put(CICSLexer.DATCONTAINER, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMNAMELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMNS, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMNSLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPENAMELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPENS, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPENSLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.XMLCONTAINER, ErrorSeverity.ERROR);
                    put(CICSLexer.XMLTRANSFORM, ErrorSeverity.ERROR);
                    put(CICSLexer.NSCONTAINER, ErrorSeverity.ERROR);
                }
            };


    public CICSTransformOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }


    /**
     * Entrypoint to check CICS TRANSFORM rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_transform_json:
                checkJSON((CICSParser.Cics_transform_jsonContext) ctx);
                break;
            case CICSParser.RULE_cics_transform_xml:
                checkXML((CICSParser.Cics_transform_xmlContext) ctx);
                break;
            default:
                break;
        }

        checkDuplicates(ctx);
    }


    private void checkJSON(CICSParser.Cics_transform_jsonContext ctx) {
        checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
        checkHasMandatoryOptions(ctx.INCONTAINER(), ctx, "INCONTAINER");
        checkHasMandatoryOptions(ctx.TRANSFORMER(), ctx, "TRANSFORMER");
    }

    private void checkXML(CICSParser.Cics_transform_xmlContext ctx) {
        if (ctx.DATATOXML() != null) {
            checkHasIllegalOptions(ctx.NSCONTAINER(), "NSCONTAINER");
            checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
            checkHasMandatoryOptions(ctx.DATCONTAINER(), ctx, "DATCONTAINER");
            checkHasMandatoryOptions(ctx.XMLTRANSFORM(), ctx, "XMLTRANSFORM");

            if (ctx.TYPENAMELEN() != null || ctx.TYPENS() != null || ctx.TYPENSLEN() != null) {
                checkHasMandatoryOptions(ctx.TYPENAME(), ctx, "TYPENAME");
            }
        } else if (ctx.XMLTODATA() != null) {
            checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
            checkHasMandatoryOptions(ctx.XMLTRANSFORM(), ctx, "XMLTRANSFORM");
        }

        if (ctx.ELEMNAME() == null)
            checkHasIllegalOptions(ctx.ELEMNAMELEN(), "ELEMNAMELEN without ELEMNAME");
        if (ctx.ELEMNS() == null)
            checkHasIllegalOptions(ctx.ELEMNSLEN(), "ELEMNSLEN without ELEMNS");
        if (ctx.TYPENAME() == null)
            checkHasIllegalOptions(ctx.TYPENAMELEN(), "TYPENAMELEN without TYPENAME");
        if (ctx.TYPENS() == null)
            checkHasIllegalOptions(ctx.TYPENSLEN(), "TYPENSLEN without TYPENS");
    }
}
