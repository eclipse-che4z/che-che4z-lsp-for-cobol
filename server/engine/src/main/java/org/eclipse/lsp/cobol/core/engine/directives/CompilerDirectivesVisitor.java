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
import lombok.NonNull;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.CompilerDirectivesLexer;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaCallableDataWorkingSectionNode;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaShareableOffWithoutOnNode;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaShareableOffWorkingSectionNode;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaShareableOnWorkingSectionNode;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.AntlrRangeUtils.constructRange;


/**
 * Visitor
 */
public class CompilerDirectivesVisitor extends CompilerDirectivesParserBaseVisitor<List<Node>> {
  private final AnalysisContext analysisContext;
  private final MessageService messageService;
  private final Position startPosition;
  private final String section;
  private final String directiveLineText;
  private final boolean isJavaShareableOn;

  public CompilerDirectivesVisitor(AnalysisContext ctx, MessageService messageService, Position startPosition,
                                   String section, String directiveLineText, boolean isJavaShareableOn) {
    this.analysisContext = ctx;
    this.messageService = messageService;
    this.startPosition = startPosition;
    this.section = section;
    this.directiveLineText = directiveLineText;
    this.isJavaShareableOn = isJavaShareableOn;
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
  public List<Node> visitCompilerDirectives(CompilerDirectivesParser.CompilerDirectivesContext ctx) {
    analysisContext.getConfig().getCompilerOptions().add(ctx.getText().trim());
    return super.visitCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitCobolJavaInteroperability(
          CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {

    int tokenType = ctx.getStart().getType();

    switch (tokenType) {
      case CompilerDirectivesLexer.JAVA_CALLABLE:
        return processJavaCallable(ctx);
      case CompilerDirectivesLexer.JAVA_SHAREABLE_ON:
        return processJavaShareableOn(ctx);
      case CompilerDirectivesLexer.JAVA_SHAREABLE_OFF:
        return processJavaShareableOff(ctx);
      default:
        return super.visitCobolJavaInteroperability(ctx);
    }
  }

  private List<Node> processJavaCallable(CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    Matcher directiveLine = Pattern.compile("(?i).*>>\\s?JAVA-CALLABLE\\s*(?<extraText>.*)").matcher(this.directiveLineText);
    validateDirective(ctx, directiveLine);
    Locality statementLocality = createStatementLocality(ctx);
    return addTreeNode(ctx, (location) -> new JavaCallableDataWorkingSectionNode(statementLocality, ctx.getText(), section));
  }

  private List<Node> processJavaShareableOn(CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    Matcher directiveLine = Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+ON\\s*(?<extraText>.*)").matcher(this.directiveLineText);
    validateDirective(ctx, directiveLine);
    return addTreeNode(ctx, (location) -> new JavaShareableOnWorkingSectionNode(createStatementLocality(ctx), ctx.getText(), section));
  }

  private List<Node> processJavaShareableOff(CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    Matcher directiveLine = Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+OFF\\s*(?<extraText>.*)").matcher(this.directiveLineText);
    boolean isValid =  validateDirective(ctx, directiveLine);
    List<Node> nodes = new ArrayList<>(addTreeNode(ctx, (location) ->
            new JavaShareableOffWorkingSectionNode(createStatementLocality(ctx), ctx.getText(), section)));
    if (isValid) {
      nodes.addAll(addTreeNode(ctx, (location) ->
              new JavaShareableOffWithoutOnNode(createStatementLocality(ctx), ctx.getText(), isJavaShareableOn)));
    }
    return nodes;
  }

  private boolean validateDirective(CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx, Matcher directiveLine) {
    if (!directiveLine.matches()) {
      VisitorHelper.retrieveRangeLocality(ctx).ifPresent(r -> {
        Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
        Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
        throwException(ctx.getText(), locationToLocality(location),
                messageService.getMessage("compilerDirective.invalid"));
      });
      return false;
    }

    if (directiveLine.matches() && isTextAfterDirective(directiveLine)) {
      Position start = new Position(startPosition.getLine(), directiveLine.start("extraText"));
      Position end = new Position(startPosition.getLine(), directiveLine.end("extraText"));
      Location location = new Location(analysisContext.getExtendedDocument().getUri(), new Range(start, end));
      throwException(
              directiveLine.group("extraText").trim(),
              locationToLocality(location),
              messageService.getMessage("compilerDirective.invalid"));
    return false;
    }
    return true;
  }

  private Locality createStatementLocality(CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    return getLocality(this.analysisContext.getExtendedDocument().mapLocation(constructRange(ctx))).toBuilder()
            .range(new Range(new Position(startPosition.getLine(), startPosition.getCharacter()),
                    new Position(startPosition.getLine(), startPosition.getCharacter() + ctx.start.getStopIndex() + 1)))
            .build();
  }

  private static boolean isTextAfterDirective(Matcher directiveLine) {
    return directiveLine.matches() && !directiveLine.group("extraText").trim().isEmpty();
  }

  @Override
  protected List<Node> defaultResult() {
    return new ArrayList<>();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    return Stream.concat(aggregate.stream(), nextResult.stream()).collect(toList());
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(getOriginalLocality(ctx));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality getOriginalLocality(ParserRuleContext ctx) {
    Location location = analysisContext.getExtendedDocument().mapLocation(constructRange(ctx));
    return Locality.builder().uri(location.getUri()).range(location.getRange()).build();
  }

  private Locality getLocality(Location location) {
    Locality.LocalityBuilder builder =
            Locality.builder().uri(location.getUri()).range(location.getRange());
    return builder.build();
  }

  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .location(locality.toOriginalLocation())
                    .suggestion(String.format("%s %s", message, wrongToken))
                    .severity(ErrorSeverity.ERROR)
                    .build();

    if (!errors.contains(error) && !wrongToken.contains(CobolDialect.FILLER)) {
      errors.add(error);
    }
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
            .range(location.getRange())
            .uri(location.getUri())
            .build();
  }
}
