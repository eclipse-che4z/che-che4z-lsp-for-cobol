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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_run;

public class CICSRunOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_run;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<>() {
                {
                    put(CICSLexer.RUN, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQPROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.SYNCHRONOUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ASYNCHRONOUS, ErrorSeverity.ERROR);
                    put(CICSLexer.FACILITYTOKN, ErrorSeverity.ERROR);
                    put(CICSLexer.INPUTEVENT, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.CHILD, ErrorSeverity.ERROR);
                }
            };

    public CICSRunOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    @Override
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_run_default:
                checkDefaultRun((CICSParser.Cics_run_defaultContext) ctx);
                break;
            case CICSParser.RULE_cics_run_transid:
                checkTransidRun((CICSParser.Cics_run_transidContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }

    private void checkDefaultRun(CICSParser.Cics_run_defaultContext ctx) {
        checkHasExactlyOneOption("ACTIVITY or ACQACTIVITY or ACQPROCESS", ctx, ctx.ACTIVITY(), ctx.ACQACTIVITY(), ctx.ACQPROCESS());
        checkHasExactlyOneOption("SYNCHRONOUS or ASYNCHRONOUS", ctx, ctx.SYNCHRONOUS(), ctx.ASYNCHRONOUS());

        if (ctx.ASYNCHRONOUS().isEmpty()) checkHasIllegalOptions(ctx.FACILITYTOKN(), "FACILITYTOKN");
    }

    private void checkTransidRun(CICSParser.Cics_run_transidContext ctx) {
        checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");
        checkHasMandatoryOptions(ctx.CHILD(), ctx, "CHILD");
    }
}
