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
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaShareableWorkingSectionNode;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;
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
  public List<Node> visitCobolJavaInteroperabilityCompilerDirectives(CompilerDirectivesParser.CobolJavaInteroperabilityCompilerDirectivesContext ctx) {
    if (Pattern.compile("(?i).*JAVA-CALLABLE*").matcher(ctx.getStart().getText()).matches()) {
      String text = analysisContext.getExtendedDocument().getCurrentText().toString();
      String line = Pattern.compile("\n\r?").split(text)[startPosition.getLine()];
      if (!Pattern.compile("(?i).*>>\\s?JAVA-CALLABLE*").matcher(line).matches()) {
        VisitorHelper.retrieveRangeLocality(ctx).ifPresent(r -> {
          r.getStart().setLine(startPosition.getLine());
          r.getEnd().setLine(startPosition.getLine());
          Location location = new Location(analysisContext.getExtendedDocument().getUri(), r);
          analysisContext.getAccumulatedErrors().add(SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .location(new OriginalLocation(location, null))
                  .suggestion(String.format("%s %s", messageService.getMessage("compilerDirective.invalid"), ctx.getStart().getText()))
                  .severity(ErrorSeverity.ERROR)
                  .build());
        });
      }
    }
    return super.visitCobolJavaInteroperabilityCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitJavaCallable(CompilerDirectivesParser.JavaCallableContext ctx) {
    String text = analysisContext.getExtendedDocument().getCurrentText().toString();
    String startLine = Pattern.compile("\n\r?").split(text)[ctx.getStart().getLine() - 1];
    if (!Pattern.compile("(?i).*>>\\s?JAVA-CALLABLE*").matcher(startLine).matches()) {
      throwException(
              ctx.getStop().getText(),
              locationToLocality(getLocation(ctx.getStart())),
              messageService.getMessage("compilerDirective.invalid"));
    }
    return super.visitJavaCallable(ctx);
  }

  @Override
  public List<Node> visitJavaShareableOnOff(CompilerDirectivesParser.JavaShareableOnOffContext ctx) {
    String text = analysisContext.getExtendedDocument().getCurrentText().toString();
    if (ctx.stop.getType() != CompilerDirectivesLexer.JAVA_SHAREABLE_OFF) {
      SyntaxError error = SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .location(getTokenEndLocality(ctx.start).toOriginalLocation())
              .suggestion(messageService.getMessage("compilerDirective.missingJavaShareableOff"))
              .severity(ErrorSeverity.ERROR)
              .build();
      errors.add(error);
    }

    String startLine = Pattern.compile("\n\r?").split(text)[ctx.getStart().getLine() - 1];
    if (!startLine.trim().isEmpty() && !Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+ON.*").matcher(startLine).matches()) {
      throwException(
              ctx.getStop().getText(),
              locationToLocality(getLocation(ctx.getStart())),
              messageService.getMessage("compilerDirective.invalid"));
    }

    String endLine = Pattern.compile("\n\r?").split(text)[ctx.getStop().getLine() - 1];
    if (!endLine.trim().isEmpty() && Pattern.compile("(?i).*JAVA-SHAREABLE\\s+OFF.*").matcher(ctx.getStop().getText()).matches()
            && !Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+OFF.*").matcher(endLine).matches()) {
      throwException(
              ctx.getStop().getText(),
              locationToLocality(getLocation(ctx.getStop())),
              messageService.getMessage("compilerDirective.invalid"));
    }
    Locality statementLocality = getLocality(this.analysisContext.getExtendedDocument().mapLocation(constructRange(ctx)));
    Locality startLocality = getLocality(getLocation(ctx.getStart()));
    Locality stopLocality = getLocality(getLocation(ctx.getStop()));
    JavaShareableWorkingSectionNode semanticsNode = new JavaShareableWorkingSectionNode(statementLocality, startLocality, stopLocality);
    return addTreeNode(ctx, (location) -> semanticsNode);
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
