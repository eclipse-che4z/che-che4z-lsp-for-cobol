/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.directives;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.RuleNode;
import org.eclipse.lsp.cobol.AntlrRangeUtils;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CompilerDirectivesLexer;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaShareableOnOffNode;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;


/**
 * Visitor
 */
public class CompilerDirectivesVisitor extends CompilerDirectivesParserBaseVisitor<List<Node>> {
  private final AnalysisContext analysisContext;
  private final MessageService messageService;
  private final Position startPosition;

  public CompilerDirectivesVisitor(AnalysisContext ctx, MessageService messageService, Position startPosition) {
    this.analysisContext = ctx;
    this.messageService = messageService;
    this.startPosition = startPosition;
  }

  @Getter
  private final List<SyntaxError> errors = new LinkedList<>();

  @Override
  public List<Node> visitCompilerOption(CompilerDirectivesParser.CompilerOptionContext ctx) {
    analysisContext.getConfig().getCompilerOptions().add(ctx.getText().trim());
    return super.visitCompilerOption(ctx);
  }

  @Override
  public List<Node> visitUnSupportedDeprecatedCompilerDirectives(CompilerDirectivesParser.UnSupportedDeprecatedCompilerDirectivesContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx).ifPresent(r -> {
      Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
      Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
      analysisContext.getAccumulatedErrors().add(SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .errorCode(() -> "IGYOS4003-E")
              .location(new OriginalLocation(location, null))
              .suggestion(messageService.getMessage("compilerDirective.deprecatedDirectiveUse", ctx.getText()))
              .severity(ErrorSeverity.ERROR)
              .build());
    });
    return super.visitUnSupportedDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitOptionalDeprecatedCompilerDirectives(CompilerDirectivesParser.OptionalDeprecatedCompilerDirectivesContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx).ifPresent(r -> {
      Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
      Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
      analysisContext.getAccumulatedErrors().add(SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .errorCode(() -> "IGYOS4013-I")
              .location(new OriginalLocation(location, null))
              .suggestion(messageService.getMessage("compilerDirective.info.deprecatedDirectiveUse", ctx.getText()))
              .severity(ErrorSeverity.INFO)
              .build());
    });
    return super.visitOptionalDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitCompilableSupportedDeprecatedCompilerDirectives(CompilerDirectivesParser.CompilableSupportedDeprecatedCompilerDirectivesContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx).ifPresent(r -> {
      Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
      Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
      analysisContext.getAccumulatedErrors().add(SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .errorCode(() -> "IGYOS4008-W")
              .location(new OriginalLocation(location, null))
              .suggestion(messageService.getMessage("compilerDirective.warning.deprecatedDirectiveUse", ctx.getText()))
              .severity(ErrorSeverity.WARNING)
              .build());
    });
    return super.visitCompilableSupportedDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitJavaShareableOnOff(CompilerDirectivesParser.JavaShareableOnOffContext ctx) {
//    areaBWarning(ctx);
//    changeContextToDialectStatement(ctx);
    if (ctx.stop.getType() != CompilerDirectivesLexer.JAVA_SHAREABLE_OFF) {
      SyntaxError error = SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .location(getTokenEndLocality(ctx.stop).toOriginalLocation())
              .suggestion(messageService.getMessage("compilerDirective.missingJavaShareableOff"))
              .severity(ErrorSeverity.ERROR)
              .build();
      errors.add(error);
    }
//    Locality statementLocality = getLocality(this.analysisContext.getExtendedDocument().mapLocation(constructRange(ctx)));
//
//    JavaShareableWorkingSectionNode semanticsNode = new JavaShareableWorkingSectionNode(statementLocality);
//    return addTreeNode(ctx, (location) -> semanticsNode);
    return addTreeNode(ctx, JavaShareableOnOffNode::new);
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  public List<Node> visitChildren(RuleNode node) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    return super.visitChildren(node);
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(getOriginalLocality(ctx));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality getOriginalLocality(ParserRuleContext ctx) {
    Location location = analysisContext.getExtendedDocument().mapLocation(AntlrRangeUtils.constructRange(ctx));
    return Locality.builder().uri(location.getUri()).range(location.getRange()).build();
  }

  private Locality getLocality(Location location) {
    Locality.LocalityBuilder builder =
            Locality.builder().uri(location.getUri()).range(location.getRange());
    return builder.build();
  }

  private Locality getTokenEndLocality(Token token) {
    return Locality.builder()
            .uri(analysisContext.getDocumentUri())
            .range(buildTokenEndRange(token))
            .build();
  }

  private Range buildTokenEndRange(Token token) {
    Position p = new Position(token.getLine() - 1, token.getCharPositionInLine() + token.getStopIndex() - token.getStartIndex() + 1);
    return new Range(p, p);
  }
}
