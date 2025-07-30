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

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.AntlrRangeUtils;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Visitor */
public class CompilerDirectivesVisitor extends CompilerDirectivesParserBaseVisitor<Object> {
  private final AnalysisContext analysisContext;
  private final MessageService messageService;
  private final Position startPosition;

  public CompilerDirectivesVisitor(
      AnalysisContext ctx, MessageService messageService, Position startPosition) {
    this.analysisContext = ctx;
    this.messageService = messageService;
    this.startPosition = startPosition;
  }

  @Override
  public Object visitCompilerOption(CompilerDirectivesParser.CompilerOptionContext ctx) {
    analysisContext.getConfig().getCompilerOptions().add(ctx.getText().trim());
    return super.visitCompilerOption(ctx);
  }

  @Override
  public Object visitUnSupportedDeprecatedCompilerDirectives(
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
  public Object visitOptionalDeprecatedCompilerDirectives(
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
                          .messageTemplate(
                              MessageTemplate.of(
                                  "compilerDirective.info.deprecatedDirectiveUse", ctx.getText()))
                          .severity(ErrorSeverity.INFO)
                          .build());
            });
    return super.visitOptionalDeprecatedCompilerDirectives(ctx);
  }

  @Override
  public Object visitCompilableSupportedDeprecatedCompilerDirectives(
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
  public Object visitCicsTranslatorOptions(
      CompilerDirectivesParser.CicsTranslatorOptionsContext ctx) {
    final Token t = ctx.getStart();
    if (t != null) {
      List<String> cicsDirectives =
          analysisContext
              .getPreprocessorsDirectives()
              .computeIfAbsent("CICS", e -> new ArrayList<>());
      cicsDirectives.add(t.getText());
    }
    return super.visitCicsTranslatorOptions(ctx);
  }

  private static final Pattern CICS_DIRECTIVES_IN_LITERAL =
      Pattern.compile("\\b(SP|LENGTH|NOLENGTH|EXCI|APOST|QUOTE)\\b", Pattern.CASE_INSENSITIVE);

  @Override
  public Object visitCicsTranslatorDirectives(
      CompilerDirectivesParser.CicsTranslatorDirectivesContext ctx) {
    final TerminalNode literal = ctx.LITERAL();
    if (literal != null) {
      List<String> cicsDirectives =
          analysisContext
              .getPreprocessorsDirectives()
              .computeIfAbsent("CICS", e -> new ArrayList<>());
      Matcher m = CICS_DIRECTIVES_IN_LITERAL.matcher(literal.getText());
      while (m.find()) {
        cicsDirectives.add(m.group());
      }
    }
    return super.visitCicsTranslatorDirectives(ctx);
  }

  @Override
  public Object visitCobolJavaInteroperabilityOptions(
      CompilerDirectivesParser.CobolJavaInteroperabilityOptionsContext ctx) {
    for (TerminalNode commaToken : ctx.COMMACHAR()) {
      if (commaToken.getText().length() <= 1) continue;
      Range range =
          CompilerDirectivesUtils.shiftRange(
              AntlrRangeUtils.constructRange(commaToken), startPosition);

      Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);
      analysisContext
          .getAccumulatedErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .location(new OriginalLocation(location, null))
                  .suggestion(
                      messageService.getMessage("compilerDirective.javaiop.spaceAfterComma"))
                  .severity(ErrorSeverity.ERROR)
                  .build());
    }
    return super.visitCobolJavaInteroperabilityOptions(ctx);
  }
}
