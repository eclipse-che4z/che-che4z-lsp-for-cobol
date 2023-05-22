package org.broadcom.cobol.dialects.cobolExample;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.ParserRuleContext;
import org.broadcom.cobol.dialects.cobolExample.utility.VisitorUtility;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

public class InjectRuleVisitor extends ExampleParserBaseVisitor<List<CopyNode>> {
  private final DialectProcessingContext context;

  public InjectRuleVisitor(DialectProcessingContext context) {
    this.context = context;
  }

  @Override
  public List<CopyNode> visitInjectStatement(ExampleParser.InjectStatementContext ctx) {
    Location nameLocation =
        new Location(
            context.getProgramDocumentUri(), VisitorUtility.constructRange(ctx.copyLibrary()));
    return addTreeNode(
        ctx,
        loc ->
            new CopyNode(
                loc,
                nameLocation,
                ctx.copyLibrary().getText(),
                ExampleDialect.DIALECT_NAME,
                context.getProgramDocumentUri()));
  }

  @Override
  protected List<CopyNode> aggregateResult(List<CopyNode> aggregate, List<CopyNode> nextResult) {
    return Stream.concat(aggregate.stream(), nextResult.stream()).collect(toList());
  }

  @Override
  protected List<CopyNode> defaultResult() {
    return new ArrayList<>();
  }

  private List<CopyNode> addTreeNode(ParserRuleContext ctx, Function<Locality, CopyNode> nodeConstructor) {
    CopyNode node = nodeConstructor.apply(VisitorUtility.constructLocality(ctx, context));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }
}
