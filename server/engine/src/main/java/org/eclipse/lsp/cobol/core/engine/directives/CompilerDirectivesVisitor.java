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
import java.util.function.Function;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
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
                          .suggestion(
                              messageService.getMessage(
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
  public Object visitCicsTranslatorDirectives(
      CompilerDirectivesParser.CicsTranslatorDirectivesContext ctx) {
    Function<String, List<String>> cicsInitializer =
        key -> {
          List<String> initial = new ArrayList<>();
          if (analysisContext.getConfig() != null
              && analysisContext.getConfig().getPreprocessorsDirectives() != null) {
            List<String> directivesConfig =
                analysisContext.getConfig().getPreprocessorsDirectives().get("CICS");
            if (directivesConfig != null) {
              initial.addAll(directivesConfig);
            }
          }
          return initial;
        };

    List<String> cicsDirectives =
        analysisContext.getPreprocessorsDirectives().computeIfAbsent("CICS", cicsInitializer);
    for (CompilerDirectivesParser.CicsTranslatorOptionsContext options :
        ctx.cicsTranslatorOptions()) {
      if (options != null) {
        cicsDirectives.add(options.getText());
      }
    }
    return super.visitCicsTranslatorDirectives(ctx);
  }
}
