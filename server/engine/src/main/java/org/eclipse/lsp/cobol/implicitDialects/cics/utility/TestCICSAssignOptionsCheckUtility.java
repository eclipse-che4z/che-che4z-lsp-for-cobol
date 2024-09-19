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

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_assign;

/** Checks CICS Assign rules for required and invalid options */
public class TestCICSAssignOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_assign;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<String, ErrorSeverity>() {
                {
                    put("ABCODE", ErrorSeverity.ERROR);
                    put("ABDUMP", ErrorSeverity.ERROR);
                    put("ABOFFSET", ErrorSeverity.ERROR);
                    put("ABPROGRAM", ErrorSeverity.ERROR);
                    put("ACTIVITY", ErrorSeverity.ERROR);
                    put("ACTIVITYID", ErrorSeverity.ERROR);
                    put("ALTSCRNHT", ErrorSeverity.ERROR);
                    put("ALTSCRNWD", ErrorSeverity.ERROR);
                    put("APLKYBD", ErrorSeverity.ERROR);
                    put("APLTEXT", ErrorSeverity.ERROR);
                    put("APPLICATION", ErrorSeverity.ERROR);
                    put("APPLID", ErrorSeverity.ERROR);
                    put("ASRAINTRPT", ErrorSeverity.ERROR);
                    put("ASRAKEY", ErrorSeverity.ERROR);
                    put("ASRAPSW", ErrorSeverity.ERROR);
                    put("ASRAPSW16", ErrorSeverity.ERROR);
                    put("ASRAREGS", ErrorSeverity.ERROR);
                    put("ASRAREGS64", ErrorSeverity.ERROR);
                    put("BRIDGE", ErrorSeverity.ERROR);
                    put("BTRANS", ErrorSeverity.ERROR);
                    put("CHANNEL", ErrorSeverity.ERROR);
                    put("CMDSEC", ErrorSeverity.ERROR);
                    put("COLOR", ErrorSeverity.ERROR);
                    put("CWALENG", ErrorSeverity.ERROR);
                    put("DEFSCRNHT", ErrorSeverity.ERROR);
                    put("DEFSCRNWD", ErrorSeverity.ERROR);
                    put("DESTCOUNT", ErrorSeverity.ERROR);
                    put("DESTID", ErrorSeverity.ERROR);
                    put("DESTIDLENG", ErrorSeverity.ERROR);
                    put("ERRORMSG", ErrorSeverity.ERROR);
                    put("ERRORMSGLEN", ErrorSeverity.ERROR);
                    put("EWASUPP", ErrorSeverity.ERROR);
                    put("FCI", ErrorSeverity.ERROR);
                    put("GMMI", ErrorSeverity.ERROR);
                    put("GMEXITOPT", ErrorSeverity.ERROR);
                    put("HILIGHT", ErrorSeverity.ERROR);
                    put("INITPARM", ErrorSeverity.ERROR);
                    put("INITPARMLEN", ErrorSeverity.ERROR);
                    put("INPARTN", ErrorSeverity.ERROR);
                    put("INPUTMSGLEN", ErrorSeverity.ERROR);
                    put("INVOKINGPROG", ErrorSeverity.ERROR);
                    put("KATAKANA", ErrorSeverity.ERROR);
                    put("LANGINUSE", ErrorSeverity.ERROR);
                    put("LDCMNEM", ErrorSeverity.ERROR);
                    put("LDCNUM", ErrorSeverity.ERROR);
                    put("LINKLEVEL", ErrorSeverity.ERROR);
                    put("LOCALCCSID", ErrorSeverity.ERROR);
                    put("MAJORVERSION", ErrorSeverity.ERROR);
                    put("MAPCOLUMN", ErrorSeverity.ERROR);
                    put("MAPHEIGHT", ErrorSeverity.ERROR);
                    //cics_assign_parameter2
                    put("MAPLINE", ErrorSeverity.ERROR);
                    put("MAPWIDTH", ErrorSeverity.ERROR);
                    put("MICROVERSION", ErrorSeverity.ERROR);
                    put("MINORVERSION", ErrorSeverity.ERROR);
                    put("MSRCONTROL", ErrorSeverity.ERROR);
                    put("NATLANGINUSE", ErrorSeverity.ERROR);
                    put("NETNAME", ErrorSeverity.ERROR);
                    put("NEXTTRANSID", ErrorSeverity.ERROR);
                    put("NUMTAB", ErrorSeverity.ERROR);
                    put("OPCLASS", ErrorSeverity.ERROR);
                    put("OPERKEYS", ErrorSeverity.ERROR);
                    put("OPID", ErrorSeverity.ERROR);
                    put("OPSECURITY", ErrorSeverity.ERROR);
                    put("ORGABCODE", ErrorSeverity.ERROR);
                    put("OUTLINE", ErrorSeverity.ERROR);
                    put("PAGENUM", ErrorSeverity.ERROR);
                    put("PARTNPAGE", ErrorSeverity.ERROR);
                    put("PARTNS", ErrorSeverity.ERROR);
                    put("PARTNSET", ErrorSeverity.ERROR);
                    put("PLATFORM", ErrorSeverity.ERROR);
                    put("PRINSYSID", ErrorSeverity.ERROR);
                    put("PROCESS", ErrorSeverity.ERROR);
                    put("PROCESSTYPE", ErrorSeverity.ERROR);
                    put("PROGRAM", ErrorSeverity.ERROR);
                    put("PS", ErrorSeverity.ERROR);
                    put("QNAME", ErrorSeverity.ERROR);
                    put("RESSEC", ErrorSeverity.ERROR);
                    put("RESTART", ErrorSeverity.ERROR);
                    put("RETURNPROG", ErrorSeverity.ERROR);
                    put("SCRNHT", ErrorSeverity.ERROR);
                    put("SCRNWD", ErrorSeverity.ERROR);
                    put("SIGDATA", ErrorSeverity.ERROR);
                    put("SOSI", ErrorSeverity.ERROR);
                    put("STARTCODE", ErrorSeverity.ERROR);
                    put("STATIONID", ErrorSeverity.ERROR);
                    put("SYSID", ErrorSeverity.ERROR);
                    put("TASKPRIORITY", ErrorSeverity.ERROR);
                    put("TCTUALENG", ErrorSeverity.ERROR);
                    put("TELLERID", ErrorSeverity.ERROR);
                    put("TERMCODE", ErrorSeverity.ERROR);
                    put("TERMPRIORITY", ErrorSeverity.ERROR);
                    put("TEXTKYBD", ErrorSeverity.ERROR);
                    put("TEXTPRINT", ErrorSeverity.ERROR);
                    put("TNADDR", ErrorSeverity.ERROR);
                    put("TNIPFAMILY", ErrorSeverity.ERROR);
                    put("TNPORT", ErrorSeverity.ERROR);
                    put("TRANPRIORITY", ErrorSeverity.ERROR);
                    put("TWALENG", ErrorSeverity.ERROR);
                    put("UNATTEND", ErrorSeverity.ERROR);
                    put("USERID", ErrorSeverity.ERROR);
                    put("USERNAME", ErrorSeverity.ERROR);
                    put("USERPRIORITY", ErrorSeverity.ERROR);
                    put("VALIDATION", ErrorSeverity.ERROR);
                }
            };

    public TestCICSAssignOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Assign rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        checkDuplicates(ctx);
    }
}
