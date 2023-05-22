package org.broadcom.cobol.dialects.cobolExample.utility;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

@UtilityClass
public class VisitorUtility {
    public Locality constructLocality(ParserRuleContext ctx, DialectProcessingContext context) {
        Location location =
                context.getExtendedDocument().mapLocation(constructRange(ctx));
        return Locality.builder()
                .uri(context.getExtendedDocument().getUri())
                .range(location.getRange())
                .build();
    }

    public void addReplacementContext(ParserRuleContext ctx, DialectProcessingContext context) {
        String newText =
                context
                        .getExtendedDocument()
                        .toString()
                        .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
                        .replaceAll("[^ \n]", CobolDialect.FILLER);
        Range range = constructRange(ctx);
        context.getExtendedDocument().replace(range, newText);
    }

    public void addReplacementContext(TerminalNode token, DialectProcessingContext context) {
        String newText =
                context
                        .getExtendedDocument()
                        .toString()
                        .substring(token.getSymbol().getStartIndex(), token.getSymbol().getStopIndex() + 1)
                        .replaceAll("[^ \n]", " ");
        Range range = constructRange(token);
        context.getExtendedDocument().replace(range, newText);
    }

    public Range constructRange(ParserRuleContext ctx) {
        return new Range(
                new Position(ctx.start.getLine() - 1, ctx.start.getCharPositionInLine()),
                new Position(
                        ctx.stop.getLine() - 1,
                        ctx.stop.getCharPositionInLine()
                                + ctx.stop.getStopIndex()
                                - ctx.stop.getStartIndex()
                                + 1));
    }

    public Range constructRange(TerminalNode token) {
        int line = token.getSymbol().getLine();
        int inLine = token.getSymbol().getCharPositionInLine();
        return new Range(
                new Position(line - 1, inLine),
                new Position(
                        line - 1,
                        inLine + token.getSymbol().getStopIndex() - token.getSymbol().getStartIndex() + 1));
    }
}
