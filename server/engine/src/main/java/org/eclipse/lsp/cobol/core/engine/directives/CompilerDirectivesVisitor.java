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

import lombok.NonNull;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
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
  private final String directiveLineText;

  public CompilerDirectivesVisitor(
      AnalysisContext ctx,
      MessageService messageService,
      Position startPosition,
      String directiveLineText) {
    this.analysisContext = ctx;
    this.messageService = messageService;
    this.startPosition = startPosition;
    this.directiveLineText = directiveLineText;
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
  public Object visitCobolJavaInteroperabilityOptions(
      CompilerDirectivesParser.CobolJavaInteroperabilityOptionsContext ctx) {
    String extraText = directiveLineText.replaceAll("\\s+", "").substring(ctx.getText().length());
    if (!extraText.isEmpty()) {
      VisitorHelper.retrieveRangeLocality(ctx)
          .ifPresent(
              r -> {
                Range range = CompilerDirectivesUtils.shiftRange(r, startPosition);
                Location location = analysisContext.getExtendedDocument().mapLocation(range);
                location
                    .getRange()
                    .setStart(
                        new Position(
                            0,
                            startPosition.getCharacter()
                                + directiveLineText.length()
                                - extraText.length()));
                location
                    .getRange()
                    .setEnd(
                        new Position(0, startPosition.getCharacter() + directiveLineText.length()));
                throwException(
                    locationToLocality(location),
                    messageService.getMessage("compilerOption.invalid", extraText));
              });
    }
    return super.visitCobolJavaInteroperabilityOptions(ctx);
  }

  private void throwException(@NonNull Locality locality, String message) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .suggestion(message)
            .severity(ErrorSeverity.ERROR)
            .build();

    if (!analysisContext.getAccumulatedErrors().contains(error)) {
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
