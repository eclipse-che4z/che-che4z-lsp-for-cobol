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

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_assign;

/** Checks CICS Assign rules for required and invalid options */
public class TestCICSAssignOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_assign;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ABCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.ABDUMP, ErrorSeverity.ERROR);
                    put(CICSLexer.ABOFFSET, ErrorSeverity.ERROR);
                    put(CICSLexer.ABPROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTSCRNHT, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTSCRNWD, ErrorSeverity.ERROR);
                    put(CICSLexer.APLKYBD, ErrorSeverity.ERROR);
                    put(CICSLexer.APLTEXT, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLICATION, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLID, ErrorSeverity.ERROR);
                    put(CICSLexer.ASRAINTRPT, ErrorSeverity.ERROR);
                    put(CICSLexer.ASRAKEY, ErrorSeverity.ERROR);
                    put(CICSLexer.ASRAPSW, ErrorSeverity.ERROR);
                    put(CICSLexer.ASRAPSW16, ErrorSeverity.ERROR);
                    put(CICSLexer.ASRAREGS, ErrorSeverity.ERROR);
                    put(CICSLexer.ASRAREGS64, ErrorSeverity.ERROR);
                    put(CICSLexer.BRIDGE, ErrorSeverity.ERROR);
                    put(CICSLexer.BTRANS, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.CMDSEC, ErrorSeverity.ERROR);
                    put(CICSLexer.COLOR, ErrorSeverity.ERROR);
                    put(CICSLexer.CWALENG, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFSCRNHT, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFSCRNWD, ErrorSeverity.ERROR);
                    put(CICSLexer.DESTCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.DESTID, ErrorSeverity.ERROR);
                    put(CICSLexer.DESTIDLENG, ErrorSeverity.ERROR);
                    put(CICSLexer.ERRORMSG, ErrorSeverity.ERROR);
                    put(CICSLexer.ERRORMSGLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.EWASUPP, ErrorSeverity.ERROR);
                    put(CICSLexer.FCI, ErrorSeverity.ERROR);
                    put(CICSLexer.GMMI, ErrorSeverity.ERROR);
                    put(CICSLexer.GMEXITOPT, ErrorSeverity.ERROR);
                    put(CICSLexer.HILIGHT, ErrorSeverity.ERROR);
                    put(CICSLexer.INITPARM, ErrorSeverity.ERROR);
                    put(CICSLexer.INITPARMLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.INPARTN, ErrorSeverity.ERROR);
                    put(CICSLexer.INPUTMSGLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.INVOKINGPROG, ErrorSeverity.ERROR);
                    put(CICSLexer.KATAKANA, ErrorSeverity.ERROR);
                    put(CICSLexer.LANGINUSE, ErrorSeverity.ERROR);
                    put(CICSLexer.LDCMNEM, ErrorSeverity.ERROR);
                    put(CICSLexer.LDCNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.LINKLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.LOCALCCSID, ErrorSeverity.ERROR);
                    put(CICSLexer.MAJORVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPCOLUMN, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPHEIGHT, ErrorSeverity.ERROR);
                    //cics_assign_parameter2
                    put(CICSLexer.MAPLINE, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPWIDTH, ErrorSeverity.ERROR);
                    put(CICSLexer.MICROVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.MINORVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.MSRCONTROL, ErrorSeverity.ERROR);
                    put(CICSLexer.NATLANGINUSE, ErrorSeverity.ERROR);
                    put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMTAB, ErrorSeverity.ERROR);
                    put(CICSLexer.OPCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.OPERKEYS, ErrorSeverity.ERROR);
                    put(CICSLexer.OPID, ErrorSeverity.ERROR);
                    put(CICSLexer.OPSECURITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ORGABCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.OUTLINE, ErrorSeverity.ERROR);
                    put(CICSLexer.PAGENUM, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTNPAGE, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTNS, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTNSET, ErrorSeverity.ERROR);
                    put(CICSLexer.PLATFORM, ErrorSeverity.ERROR);
                    put(CICSLexer.PRINSYSID, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.PS, ErrorSeverity.ERROR);
                    put(CICSLexer.QNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.RESSEC, ErrorSeverity.ERROR);
                    put(CICSLexer.RESTART, ErrorSeverity.ERROR);
                    put(CICSLexer.RETURNPROG, ErrorSeverity.ERROR);
                    put(CICSLexer.SCRNHT, ErrorSeverity.ERROR);
                    put(CICSLexer.SCRNWD, ErrorSeverity.ERROR);
                    put(CICSLexer.SIGDATA, ErrorSeverity.ERROR);
                    put(CICSLexer.SOSI, ErrorSeverity.ERROR);
                    put(CICSLexer.STARTCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.STATIONID, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSID, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TCTUALENG, ErrorSeverity.ERROR);
                    put(CICSLexer.TELLERID, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TEXTKYBD, ErrorSeverity.ERROR);
                    put(CICSLexer.TEXTPRINT, ErrorSeverity.ERROR);
                    put(CICSLexer.TNADDR, ErrorSeverity.ERROR);
                    put(CICSLexer.TNIPFAMILY, ErrorSeverity.ERROR);
                    put(CICSLexer.TNPORT, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TWALENG, ErrorSeverity.ERROR);
                    put(CICSLexer.UNATTEND, ErrorSeverity.ERROR);
                    put(CICSLexer.USERID, ErrorSeverity.ERROR);
                    put(CICSLexer.USERNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.USERPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.VALIDATION, ErrorSeverity.ERROR);
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
