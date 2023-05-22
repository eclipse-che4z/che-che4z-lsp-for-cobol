package org.broadcom.cobol.dialects.cobolExample;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.broadcom.cobol.dialects.cobolExample.nodes.Level100Node;
import org.broadcom.cobol.dialects.cobolExample.nodes.RpcNode;
import org.broadcom.cobol.dialects.cobolExample.nodes.UnsetNode;
import org.broadcom.cobol.dialects.cobolExample.utility.VisitorUtility;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/**
 * Visitor for ExampleParser.g4
 *
 * <p>IMPORTANT:
 * AbstractParseTreeVisitor#defaultResult() returns the default result for every node
 * in the parse tree you visit. By default, it returns null.
 *
 * AbstractParseTreeVisitor#aggregateResult(T,T) aggregates the last node's visited
 * result with the total result so far.
 *
 * Advised to implement these methods.
 */
public class ExampleVisitor extends ExampleParserBaseVisitor<List<Node>> {
  private final DialectProcessingContext context;
  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  public ExampleVisitor(DialectProcessingContext context) {
    this.context = context;
  }

  // The default result for every node in the parse tree you visit. By default, it returns null.
  // Always implement this.
  @Override
  protected List<Node> defaultResult() {
    return new ArrayList<>();
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitShiftStatement(ExampleParser.ShiftStatementContext ctx) {
    // replace the dialect specific keywords by FILLER (empty space). So, COBOL LS engine doesn't see these.
    VisitorUtility.addReplacementContext(ctx.SHIFT(), context);
    VisitorUtility.addReplacementContext(ctx.TO(), context);
    VisitorUtility.addReplacementContext(ctx.EXAMPLE(), context);
    ofNullable(ctx.DOT_FS()).ifPresent(ctx1 -> VisitorUtility.addReplacementContext(ctx1, context));
    return visitChildren(ctx);
  }

  // This aggregates the last node's visited result with the total result so far.
  // Always implement this.
  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    return Stream.concat(aggregate.stream(), nextResult.stream()).collect(toList());
  }

  @Override
  public List<Node> visitDataDescriptionEntry100(ExampleParser.DataDescriptionEntry100Context ctx) {
    // replace the dialect specific keywords by FILLER (empty space). So, COBOL LS engine doesn't see these.
    VisitorUtility.addReplacementContext(ctx, context);
    ofNullable(ctx.DOT_FS()).ifPresent(ctx1 -> VisitorUtility.addReplacementContext(ctx1, context));

    // Adds a custom node Level100Node.
    // Later we will enrich this node at POST_DEFINITION phase of analysis by adding a processor.
    // Check ExampleDialect#getProcessors and Level100Transformer
    return addTreeNode(
        ctx,
        locality ->
            new Level100Node(
                locality, NodeType.CUSTOM, ExampleDialect.DIALECT_NAME, ctx.dataName().getText()));
  }

  @Override
  public List<Node> visitBitwiseShiftstatement(ExampleParser.BitwiseShiftstatementContext ctx) {
    // replace the dialect specific keywords by FILLER (empty space). So, COBOL LS engine doesn't see these.
    // No need for custom nodes as the variableNodes are provided by COBOL LS engine out-of-box.
    VisitorUtility.addReplacementContext(ctx.EXAMPLE(), context);
    VisitorUtility.addReplacementContext(ctx.BITWISE(), context);
    VisitorUtility.addReplacementContext(ctx.SHIFT(), context);
    VisitorUtility.addReplacementContext(ctx.RIGHT(), context);
    ofNullable(ctx.DOT_FS()).ifPresent(ctx1 -> VisitorUtility.addReplacementContext(ctx1, context));
    VisitorUtility.addReplacementContext(ctx.numericLiteral(), context);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitUntieStatement(ExampleParser.UntieStatementContext ctx) {
    VisitorUtility.addReplacementContext(ctx.EXAMPLE(), context);
    VisitorUtility.addReplacementContext(ctx.UNTIE(), context);
    ofNullable(ctx.DOT_FS()).ifPresent(ctx1 -> VisitorUtility.addReplacementContext(ctx1, context));
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitUnsetStatement(ExampleParser.UnsetStatementContext ctx) {
    // replace the dialect specific keywords by FILLER (empty space). So, COBOL LS engine doesn't see these.
    VisitorUtility.addReplacementContext(ctx.EXAMPLE(), context);
    VisitorUtility.addReplacementContext(ctx.UNSET(), context);
    ofNullable(ctx.DOT_FS()).ifPresent(ctx1 -> VisitorUtility.addReplacementContext(ctx1, context));
    VariableNameAndLocality iden1 =
            new VariableNameAndLocality(
                    ctx.qualifiedVariableDataName().getText(),
                    VisitorUtility.constructLocality(ctx.qualifiedVariableDataName(), context));

    // Custom node is needed as we want to add a semantic check on this statement.
    // Unset could be applied only level 88 variable.
    // So, add a custom Node and corresponding processor to handle the semantic analysis.
    // check ExampleDialect#getProcessors and ProcessUnsetNode
    return addTreeNode(ctx, locality -> new UnsetNode(locality, iden1));
  }

  @Override
  public List<Node> visitRpcParseStatement(ExampleParser.RpcParseStatementContext ctx) {
    // replace the dialect specific keywords by FILLER (empty space). So, COBOL LS engine doesn't see these.
    VisitorUtility.addReplacementContext(ctx.EXAMPLE(), context);
    VisitorUtility.addReplacementContext(ctx.RPC_MSG(), context);
    ofNullable(ctx.DOT_FS()).ifPresent(ctx1 -> VisitorUtility.addReplacementContext(ctx1, context));
    VisitorUtility.addReplacementContext(ctx.PARSE(), context);
    VisitorUtility.addReplacementContext(ctx.INTO(), context);
    ofNullable(ctx.WITH()).ifPresent(ctx1 -> ctx1.forEach(ctx2 -> VisitorUtility.addReplacementContext(ctx2, context)));
    ofNullable(ctx.DETAILS()).ifPresent(ctx1 -> ctx1.forEach(ctx2 -> VisitorUtility.addReplacementContext(ctx2, context)));

    VariableNameAndLocality iden1 =
        new VariableNameAndLocality(
            ctx.identifier1().getText(), VisitorUtility.constructLocality(ctx.identifier1(), context));
    VariableNameAndLocality iden2 =
        new VariableNameAndLocality(
            ctx.identifier2().getText(), VisitorUtility.constructLocality(ctx.identifier2(), context));

    VariableNameAndLocality iden3 = getVariableNameAndLocality(ctx.identifier3());
    if ( Objects.nonNull(iden3)) {
      VisitorUtility.addReplacementContext(ctx.XID(), context);
    }

    VariableNameAndLocality iden4 = getVariableNameAndLocality(ctx.identifier4());
    if ( Objects.nonNull(iden4)) {
      VisitorUtility.addReplacementContext(ctx.MSG_TYPE(), context);
    }

    VariableNameAndLocality iden5 = getVariableNameAndLocality(ctx.identifier5());
    if ( Objects.nonNull(iden5)) {
      VisitorUtility.addReplacementContext(ctx.CALL(), context);
    }

    VariableNameAndLocality iden6 = getVariableNameAndLocality(ctx.identifier6());
    if ( Objects.nonNull(iden6)) {
      VisitorUtility.addReplacementContext(ctx.REPLY(), context);
    }

    // Custom node is needed as we want to add a semantic check on this statement.
    // check ExampleDialect#getProcessors and ProcessRpcNode
    return addTreeNode(
        ctx,
        locality ->
            new RpcNode(
                locality,
                NodeType.CUSTOM,
                ExampleDialect.DIALECT_NAME,
                iden1,
                iden2,
                iden3,
                iden4,
                iden5,
                iden6));
  }

  private VariableNameAndLocality getVariableNameAndLocality(ParserRuleContext ctx) {
    return ofNullable(ctx)
        .map(iden -> new VariableNameAndLocality(iden.getText(), VisitorUtility.constructLocality(iden, context)))
        .orElse(null);
  }

  @Override
  public List<Node> visitQualifiedVariableDataName(
          ExampleParser.QualifiedVariableDataNameContext ctx) {
    VisitorUtility.addReplacementContext(ctx, context);
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariable(ExampleParser.VariableContext ctx) {
    return addTreeNode(ctx, locality -> new VariableUsageNode(getName(ctx), locality));
  }

  private String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(VisitorUtility.constructLocality(ctx, context));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }
}
