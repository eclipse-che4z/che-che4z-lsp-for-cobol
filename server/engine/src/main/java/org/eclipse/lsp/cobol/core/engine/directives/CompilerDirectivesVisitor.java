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
import org.antlr.v4.runtime.Token;
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
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaCallablePrecedureSectionNode;
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
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.buildTokenRange;


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
  public List<Node> visitCompilerDirectives(CompilerDirectivesParser.CompilerDirectivesContext ctx) {
    analysisContext.getConfig().getCompilerOptions().add(ctx.getText().trim());
    return super.visitCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitCobolJavaInteroperabilityCompilerDirectives(
          CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx) {

    int tokenType = ctx.getStart().getType();

    switch (tokenType) {
      case CompilerDirectivesLexer.JAVA_CALLABLE:
        return processJavaCallable(ctx);
      case CompilerDirectivesLexer.JAVA_SHAREABLE_ON:
        return processJavaShareableOn(ctx);
      case CompilerDirectivesLexer.JAVA_SHAREABLE_OFF:
        return processJavaShareableOff(ctx);
      default:
        return super.visitCobolJavaInteroperabilityCompilerDirectives(ctx);
    }
  }

  private List<Node> processJavaCallable(CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx) {
    String[] lines = getCurrentDocumentLines();
    String currentLine = lines[startPosition.getLine()];
    Matcher directiveLine = Pattern.compile("(?i).*>>\\s?JAVA-CALLABLE\\s*(?<extraText>.*)").matcher(currentLine);

    validateDirective(ctx, directiveLine);

    Locality statementLocality = createStatementLocality(ctx);
    statementLocality.getRange().getStart().setLine(startPosition.getLine());
    statementLocality.getRange().getEnd().setLine(startPosition.getLine());

    return addTreeNode(ctx, (location) ->
            new JavaCallablePrecedureSectionNode(statementLocality, isProcedureDivisionNextLine(lines)));
  }

  private List<Node> processJavaShareableOn(CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx) {
    String[] lines = getCurrentDocumentLines();
    String currentLine = lines[startPosition.getLine()];
    Matcher directiveLine = Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+ON\\s*(?<extraText>.*)").matcher(currentLine);

    validateDirective(ctx, directiveLine);

    Locality statementLocality = createStatementLocality(ctx);
    Locality startLocality = getLocality(getLocation(ctx.getStart()));
    Locality stopLocality = getLocality(getLocation(ctx.getStop()));

    return addTreeNode(ctx, (location) ->
            new JavaShareableOnWorkingSectionNode(statementLocality, startLocality, stopLocality));
  }

  private List<Node> processJavaShareableOff(CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx) {
    String[] lines = getCurrentDocumentLines();
    String currentLine = lines[startPosition.getLine()];
    Matcher directiveLine = Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+OFF\\s*(?<extraText>.*)").matcher(currentLine);

    validateDirective(ctx, directiveLine);

    Locality statementLocality = createStatementLocality(ctx);
    statementLocality.getRange().getStart().setLine(startPosition.getLine());
    statementLocality.getRange().getEnd().setLine(startPosition.getLine());
    Locality startLocality = getLocality(getLocation(ctx.getStart()));
    Locality stopLocality = getLocality(getLocation(ctx.getStop()));

    return addTreeNode(ctx, (location) ->
            new JavaShareableOffWorkingSectionNode(statementLocality, startLocality, stopLocality));
  }

  private String[] getCurrentDocumentLines() {
    String text = analysisContext.getExtendedDocument().getCurrentText().toString();
    return Pattern.compile("\n\r?").split(text);
  }

  private void validateDirective(CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx, Matcher directiveLine) {
    if (!directiveLine.matches()) {
      VisitorHelper.retrieveRangeLocality(ctx).ifPresent(r -> {
        Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
        Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
        throwException(ctx.getText(), locationToLocality(location),
                messageService.getMessage("compilerDirective.invalid"));
      });
    }

    if (directiveLine.matches() && isTextAfterDirective(directiveLine)) {
      Position start = new Position(startPosition.getLine(), directiveLine.start("extraText"));
      Position end = new Position(startPosition.getLine(), directiveLine.end("extraText"));
      Location location = new Location(analysisContext.getExtendedDocument().getUri(), new Range(start, end));
      throwException(
              directiveLine.group("extraText").trim(),
              locationToLocality(location),
              messageService.getMessage("compilerDirective.invalid"));
    }
  }

  private Locality createStatementLocality(CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx) {
    return getLocality(this.analysisContext.getExtendedDocument().mapLocation(constructRange(ctx)));
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

  private boolean isProcedureDivisionNextLine(String[] lines) {
    return Pattern.compile("(?i).*PROCEDURE\\s+DIVISION.*").matcher(lines[startPosition.getLine() + 1]).matches();
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

  private Location getLocation(Token childToken) {
    return analysisContext.getExtendedDocument().mapLocation(buildTokenRange(childToken));
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
            .range(location.getRange())
            .uri(location.getUri())
            .build();
  }
}
