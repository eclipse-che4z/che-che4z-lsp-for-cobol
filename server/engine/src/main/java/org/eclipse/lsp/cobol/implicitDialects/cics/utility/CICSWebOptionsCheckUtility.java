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
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_web;

public class CICSWebOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_web;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<String, ErrorSeverity>() {
                {
                    put("ALLOCATE", ErrorSeverity.ERROR);
                    put("SYSID", ErrorSeverity.ERROR);
                    put("PROFILE", ErrorSeverity.ERROR);
                    put("STATE", ErrorSeverity.ERROR);
                    put("SESSION", ErrorSeverity.ERROR);
                    put("PARTNER", ErrorSeverity.ERROR);
                    put("ASIS", ErrorSeverity.WARNING);
                    put("BUFFER", ErrorSeverity.WARNING);
                    put("LEAVEKB", ErrorSeverity.WARNING);
                    put("NOTRUNCATE", ErrorSeverity.WARNING);
                    put("NOQUEUE", ErrorSeverity.WARNING);
                    put("NOTRUNCATE", ErrorSeverity.WARNING);
                }
            };

    public CICSWebOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS WEB rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getClass() == CICSParser.Cics_web_closeContext.class) {
            checkClose((CICSParser.Cics_web_closeContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_converseContext.class) {
            checkConverse((CICSParser.Cics_web_converseContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_endbrowseContext.class) {
            checkEndbrowse((CICSParser.Cics_web_endbrowseContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_extractContext.class) {
            checkExtract((CICSParser.Cics_web_extractContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_openContext.class) {
            checkOpen((CICSParser.Cics_web_openContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_parseContext.class) {
            checkParse((CICSParser.Cics_web_parseContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_readContext.class) {
            checkRead((CICSParser.Cics_web_readContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_readnextContext.class) {
            checkReadnext((CICSParser.Cics_web_readnextContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_receiveContext.class) {
            checkReceive((CICSParser.Cics_web_receiveContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_retrieveContext.class) {
            checkRetrieve((CICSParser.Cics_web_retrieveContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_sendContext.class) {
            checkSend((CICSParser.Cics_web_sendContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_startbrowseContext.class) {
            checkStartbrowse((CICSParser.Cics_web_startbrowseContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_web_writeContext.class) {
            checkWrite((CICSParser.Cics_web_writeContext) ctx);
        }
    }

    private void checkClose(CICSParser.Cics_web_closeContext ctx) {
        List<TerminalNode> ruleList = new ArrayList<>();
        ruleList.add(ctx.SESSTOKEN()); // SESSTOKEN in CLOSE does not utilize the repeat notation.
        checkHasMandatoryOptions(ruleList, ctx, "SESSTOKEN");
    }

    private void checkConverse(CICSParser.Cics_web_converseContext ctx) {
        checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");

        List<RuleContextData> contexts = new ArrayList<>();
        contexts.add(new RuleContextData(ctx.cics_web_path_urimap(), "PATH PATHLENGTH or URIMAP"));

        checkDuplicates(contexts);
    }

    private void checkEndbrowse(CICSParser.Cics_web_endbrowseContext ctx) {

    }

    private void checkExtract(CICSParser.Cics_web_extractContext ctx) {

    }

    private void checkOpen(CICSParser.Cics_web_openContext ctx) {

    }

    private void checkParse(CICSParser.Cics_web_parseContext ctx) {

    }

    private void checkRead(CICSParser.Cics_web_readContext ctx) {

    }

    private void checkReadnext(CICSParser.Cics_web_readnextContext ctx) {

    }

    private void checkReceive(CICSParser.Cics_web_receiveContext ctx) {

    }

    private void checkRetrieve(CICSParser.Cics_web_retrieveContext ctx) {

    }

    private void checkSend(CICSParser.Cics_web_sendContext ctx) {

    }

    private void checkStartbrowse(CICSParser.Cics_web_startbrowseContext ctx) {

    }

    private void checkWrite(CICSParser.Cics_web_writeContext ctx) {

    }
}
