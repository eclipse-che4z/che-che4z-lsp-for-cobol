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

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.AntlrRangeUtils.constructRange;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.core.CompilerDirectivesLexer;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Visitor */
public class CompilerDirectivesVisitor extends CompilerDirectivesParserBaseVisitor<List<Node>> {
  private final AnalysisContext analysisContext;
  private final MessageService messageService;
  private final Position startPosition;
  private final String section;
  private final String directiveLineText;
  private final boolean isJavaShareableOn;

  public CompilerDirectivesVisitor(
      AnalysisContext ctx,
      MessageService messageService,
      Position startPosition,
      String section,
      String directiveLineText,
      boolean isJavaShareableOn) {
    this.analysisContext = ctx;
    this.messageService = messageService;
    this.startPosition = startPosition;
    this.section = section;
    this.directiveLineText = directiveLineText;
    this.isJavaShareableOn = isJavaShareableOn;
  }

  public CompilerDirectivesVisitor(
      AnalysisContext ctx, MessageService messageService, Position startPosition) {
    this(ctx, messageService, startPosition, "", "", false);
  }

  @Override
  public List<Node> visitCompilerOption(CompilerDirectivesParser.CompilerOptionContext ctx) {
    analysisContext.getConfig().getCompilerOptions().add(ctx.getText().trim());
    return super.visitCompilerOption(ctx);
  }

  @Override
  public List<Node> visitUnSupportedDeprecatedCompilerDirectives(
      CompilerDirectivesParser.UnSupportedDeprecatedCompilerDirectivesContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx)
        .ifPresent(
            r -> {
              Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
              Location location =
                  new Location(analysisContext.getExtendedDocument().getUri(), range);
              analysisContext
                  .getAccumulatedErrors()
                  .add(
                      SyntaxError.syntaxError()
                          .errorSource(ErrorSource.PARSING)
                          .errorCode(() -> "IGYOS4003-E")
                          .location(new OriginalLocation(location, null))
                          .suggestion(
                              messageService.getMessage(
                                  "compilerDirective.deprecatedDirectiveUse", ctx.getText()))
                          .severity(ErrorSeverity.ERROR)
                          .build());
            });
    return super.visitUnSupportedDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitOptionalDeprecatedCompilerDirectives(
      CompilerDirectivesParser.OptionalDeprecatedCompilerDirectivesContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx)
        .ifPresent(
            r -> {
              Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
              Location location =
                  new Location(analysisContext.getExtendedDocument().getUri(), range);
              analysisContext
                  .getAccumulatedErrors()
                  .add(
                      SyntaxError.syntaxError()
                          .errorSource(ErrorSource.PARSING)
                          .errorCode(() -> "IGYOS4013-I")
                          .location(new OriginalLocation(location, null))
                          .suggestion(
                              messageService.getMessage(
                                  "compilerDirective.info.deprecatedDirectiveUse", ctx.getText()))
                          .severity(ErrorSeverity.INFO)
                          .build());
            });
    return super.visitOptionalDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitCompilableSupportedDeprecatedCompilerDirectives(
      CompilerDirectivesParser.CompilableSupportedDeprecatedCompilerDirectivesContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx)
        .ifPresent(
            r -> {
              Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
              Location location =
                  new Location(analysisContext.getExtendedDocument().getUri(), range);
              analysisContext
                  .getAccumulatedErrors()
                  .add(
                      SyntaxError.syntaxError()
                          .errorSource(ErrorSource.PARSING)
                          .errorCode(() -> "IGYOS4008-W")
                          .location(new OriginalLocation(location, null))
                          .suggestion(
                              messageService.getMessage(
                                  "compilerDirective.warning.deprecatedDirectiveUse",
                                  ctx.getText()))
                          .severity(ErrorSeverity.WARNING)
                          .build());
            });
    return super.visitCompilableSupportedDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitCobolJavaInteroperabilityOptions(
      CompilerDirectivesParser.CobolJavaInteroperabilityOptionsContext ctx) {
    return super.visitCobolJavaInteroperabilityOptions(ctx);
  }

  @Override
  public List<Node> visitExtraneousInput(CompilerDirectivesParser.ExtraneousInputContext ctx) {
    VisitorHelper.retrieveRangeLocality(ctx)
        .ifPresent(
            r -> {
              Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
              Location location = analysisContext.getExtendedDocument().mapLocation(range);
              throwException(
                  ctx.getText(),
                  locationToLocality(location),
                  messageService.getMessage("compilerOption.invalid"));
            });
    return super.visitExtraneousInput(ctx);
  }

  @Override
  public List<Node> visitCompilerDirectives(
      CompilerDirectivesParser.CompilerDirectivesContext ctx) {
    analysisContext.getConfig().getCompilerOptions().add(ctx.getText().trim());
    return super.visitCompilerDirectives(ctx);
  }

  @Override
  public List<Node> visitCobolJavaInteroperability(
      CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {

    int tokenType = ctx.getStart().getType();

    switch (tokenType) {
      case CompilerDirectivesLexer.JAVA_CALLABLE:
        processJavaCallable(ctx);
        break;
      case CompilerDirectivesLexer.JAVA_SHAREABLE_ON:
        processJavaShareableOn(ctx);
        break;
      case CompilerDirectivesLexer.JAVA_SHAREABLE_OFF:
        processJavaShareableOff(ctx);
        break;
      default:
    }
    return super.visitCobolJavaInteroperability(ctx);
  }

  private void processJavaCallable(CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    Matcher directiveLine =
        Pattern.compile("(?i).*>>\\s?JAVA-CALLABLE\\s*(?<extraText>.*)")
            .matcher(this.directiveLineText);
    validateDirective(ctx, directiveLine);
    Locality statementLocality = createStatementLocality(ctx);

    if (!(section.contains(SectionType.WORKING_STORAGE.getType())
        || section.contains(DivisionType.DATA_DIVISION.getDivName()))) {
      throwException(
          "",
          statementLocality,
          messageService.getMessage("compilerDirective.validation.dataSection", ctx.getText()));
    }
  }

  private void processJavaShareableOn(
      CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    Matcher directiveLine =
        Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+ON\\s*(?<extraText>.*)")
            .matcher(this.directiveLineText);
    validateDirective(ctx, directiveLine);
    Locality statementLocality = createStatementLocality(ctx);
    if (!section.contains(SectionType.WORKING_STORAGE.getType())) {
      throwException(
          "",
          statementLocality,
          messageService.getMessage("compilerDirective.validation.workingSection", ctx.getText()));
    }
  }

  private void processJavaShareableOff(
      CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    Matcher directiveLine =
        Pattern.compile("(?i).*>>\\s?JAVA-SHAREABLE\\s+OFF\\s*(?<extraText>.*)")
            .matcher(this.directiveLineText);
    boolean isValid = validateDirective(ctx, directiveLine);
    Locality statementLocality = createStatementLocality(ctx);
    if (!section.contains(SectionType.WORKING_STORAGE.getType())) {
      throwException(
          "",
          statementLocality,
          messageService.getMessage("compilerDirective.validation.workingSection", ctx.getText()));
    }
    if (isValid) {
      if (!isJavaShareableOn) {
        throwException(
            "",
            statementLocality,
            messageService.getMessage(
                "compilerDirective.validation.javaShareableOff", ctx.getText()));
      }
    }
  }

  private boolean validateDirective(
      CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx, Matcher directiveLine) {
    if (!directiveLine.matches()) {
      VisitorHelper.retrieveRangeLocality(ctx)
          .ifPresent(
              r -> {
                Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
                Location location = analysisContext.getExtendedDocument().mapLocation(range);
                throwException(
                    ctx.getText(),
                    locationToLocality(location),
                    messageService.getMessage("compilerDirective.invalid"));
              });
      return false;
    }

    return !isTextAfterDirective(directiveLine);
  }

  private Locality createStatementLocality(
      CompilerDirectivesParser.CobolJavaInteroperabilityContext ctx) {
    return getLocality(this.analysisContext.getExtendedDocument().mapLocation(constructRange(ctx)))
        .toBuilder()
        .range(
            new Range(
                new Position(startPosition.getLine(), startPosition.getCharacter()),
                new Position(
                    startPosition.getLine(),
                    startPosition.getCharacter() + ctx.start.getStopIndex() + 1)))
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

  private Locality getLocality(Location location) {
    Locality.LocalityBuilder builder =
        Locality.builder().uri(location.getUri()).range(location.getRange());
    return builder.build();
  }

  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    String formatedMessage =
        wrongToken.isEmpty() ? message : String.format("%s %s", message, wrongToken);
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .suggestion(formatedMessage)
            .severity(ErrorSeverity.ERROR)
            .build();

    if (!analysisContext.getAccumulatedErrors().contains(error)
        && !wrongToken.contains(CobolDialect.FILLER)) {
      analysisContext.getAccumulatedErrors().add(error);
    }
  }

  private Locality locationToLocality(Location location) {
    Locality.LocalityBuilder builder =
        Locality.builder().range(location.getRange()).uri(location.getUri());

    if (analysisContext.getCopybooksRepository() != null) {
      builder.copybookId(
          analysisContext.getCopybooksRepository().getCopybookIdByUri(location.getUri()));
    }

    return builder.build();
  }
}
