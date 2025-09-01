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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lombok.Setter;
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
  @Setter private Position startPosition;

  private final Map<String, List<DirectiveInfo>> directivesByConflictGroup = new HashMap<>();

  private static class DirectiveInfo {
    final List<CicsOptionOccurrence> options;
    final int directiveIndex;

    DirectiveInfo(List<CicsOptionOccurrence> options, int directiveIndex) {
      this.options = options;
      this.directiveIndex = directiveIndex;
    }
  }

  private int currentDirectiveIndex = 0;

  private static class CicsOptionOccurrence {
    final String optionText;
    final Token token;
    final Position basePosition;
    final int positionInLiteral;
    final boolean isFromLiteral;

    CicsOptionOccurrence(
        String optionText,
        Token token,
        Position basePosition,
        int positionInLiteral,
        boolean isFromLiteral) {
      this.optionText = optionText;
      this.token = token;
      this.basePosition = basePosition;
      this.positionInLiteral = positionInLiteral;
      this.isFromLiteral = isFromLiteral;
    }
  }

  private static class OptionInfo {
    final String option;
    final Token token;
    final boolean isFromLiteral;
    final int positionInLiteral;

    OptionInfo(String option, Token token, boolean isFromLiteral, int positionInLiteral) {
      this.option = option;
      this.token = token;
      this.isFromLiteral = isFromLiteral;
      this.positionInLiteral = positionInLiteral;
    }
  }

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
    processDirectiveOptions(getAllOptions(ctx));
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

  private void processDirectiveOptions(List<OptionInfo> options) {
    Map<String, List<OptionInfo>> conflictGroups = new HashMap<>();

    for (OptionInfo option : options) {
      String conflictGroup = getConflictGroup(option.option.toUpperCase());
      if (conflictGroup != null) {
        conflictGroups.computeIfAbsent(conflictGroup, k -> new ArrayList<>()).add(option);
      }
    }

    for (Map.Entry<String, List<OptionInfo>> entry : conflictGroups.entrySet()) {
      String conflictGroup = entry.getKey();
      List<OptionInfo> groupOptions = entry.getValue();

      List<CicsOptionOccurrence> directiveOccurrences = new ArrayList<>();
      for (OptionInfo option : groupOptions) {
        directiveOccurrences.add(
            new CicsOptionOccurrence(
                option.option,
                option.token,
                startPosition,
                option.positionInLiteral,
                option.isFromLiteral));
      }

      directivesByConflictGroup
          .computeIfAbsent(conflictGroup, k -> new ArrayList<>())
          .add(new DirectiveInfo(directiveOccurrences, currentDirectiveIndex));
    }

    for (OptionInfo option : options) {
      String conflictGroup = getConflictGroup(option.option.toUpperCase());
      if (conflictGroup == null) {
        List<String> cicsDirectives =
            analysisContext
                .getPreprocessorsDirectives()
                .computeIfAbsent("CICS", e -> new ArrayList<>());
        if (!cicsDirectives.contains(option.option)) {
          cicsDirectives.add(option.option);
        }
      }
    }
  }

  private List<OptionInfo> getAllOptions(
      CompilerDirectivesParser.CicsTranslatorDirectivesContext ctx) {
    currentDirectiveIndex++;
    List<OptionInfo> allOptions = new ArrayList<>();
    for (CompilerDirectivesParser.CicsTranslatorOptionsContext optCtx :
        ctx.cicsTranslatorOptions()) {
      Token t = optCtx.getStart();
      if (t != null) {
        String optionText = t.getText();
        List<String> cicsDirectives =
            analysisContext
                .getPreprocessorsDirectives()
                .computeIfAbsent("CICS", e -> new ArrayList<>());
        cicsDirectives.add(optionText);
        allOptions.add(new OptionInfo(optionText, t, false, -1));
      }
    }

    final TerminalNode literal = ctx.LITERAL();
    if (literal != null) {
      String literalText = literal.getText();
      List<String> cicsDirectives =
          analysisContext
              .getPreprocessorsDirectives()
              .computeIfAbsent("CICS", e -> new ArrayList<>());

      if ((literalText.startsWith("\"") && literalText.endsWith("\""))
          || (literalText.startsWith("'") && literalText.endsWith("'"))) {
        String content = literalText.substring(1, literalText.length() - 1);
        String[] options = content.split("[,\\s]+");

        int currentPos = 0;
        for (String option : options) {
          option = option.trim();
          if (!option.isEmpty()) {
            cicsDirectives.add(option);
            int optionPos = content.indexOf(option, currentPos);
            if (optionPos != -1) {
              currentPos = optionPos + option.length();
              allOptions.add(new OptionInfo(option, literal.getSymbol(), true, optionPos + 1));
            }
          }
        }
      }
    }
    return allOptions;
  }

  /** postProcessDirectives */
  public void postProcessDirectives() {
    for (Map.Entry<String, List<DirectiveInfo>> entry : directivesByConflictGroup.entrySet()) {
      List<DirectiveInfo> directives = entry.getValue();

      String finalAssumedOption = null;
      DirectiveInfo lastDirective = null;

      for (DirectiveInfo directive : directives) {
        if (lastDirective == null || directive.directiveIndex > lastDirective.directiveIndex) {
          lastDirective = directive;
        }
      }

      if (lastDirective != null && !lastDirective.options.isEmpty()) {
        finalAssumedOption = lastDirective.options.get(lastDirective.options.size() - 1).optionText;
      }

      if (finalAssumedOption == null) {
        continue;
      }

      for (DirectiveInfo directive : directives) {
        List<CicsOptionOccurrence> options = directive.options;

        if (options.size() == 1) {
          CicsOptionOccurrence option = options.get(0);
          if (!option.optionText.equalsIgnoreCase(finalAssumedOption)) {
            generateWarningForOccurrence(option, finalAssumedOption);
          }
        } else {
          String directiveAssumedOption = options.get(options.size() - 1).optionText;

          for (int i = 0; i < options.size() - 1; i++) {
            CicsOptionOccurrence option = options.get(i);
            if (!option.optionText.equalsIgnoreCase(directiveAssumedOption)
                && !option.optionText.equalsIgnoreCase(finalAssumedOption)) {
              generateWarningForOccurrence(option, finalAssumedOption);
            }
          }

          CicsOptionOccurrence lastOption = options.get(options.size() - 1);
          if (!lastOption.optionText.equalsIgnoreCase(finalAssumedOption)) {
            generateWarningForOccurrence(lastOption, finalAssumedOption);
          }
        }
      }
    }
  }

  private void generateWarningForOccurrence(CicsOptionOccurrence occurrence, String assumedOption) {
    Token token = occurrence.token;
    if (token == null) return;

    Range tokenRange;
    if (occurrence.isFromLiteral) {
      int tokenLine = token.getLine() - 1;
      int tokenColumn = token.getCharPositionInLine() + occurrence.positionInLiteral;
      tokenRange =
          new Range(
              new Position(tokenLine, tokenColumn),
              new Position(tokenLine, tokenColumn + occurrence.optionText.length()));
    } else {
      tokenRange =
          new Range(
              new Position(token.getLine() - 1, token.getCharPositionInLine()),
              new Position(
                  token.getLine() - 1, token.getCharPositionInLine() + token.getText().length()));
    }

    Range range =
        occurrence.basePosition != null
            ? CompilerDirectivesUtils.shiftRange(tokenRange, occurrence.basePosition)
            : tokenRange;

    Location location = new Location(analysisContext.getExtendedDocument().getUri(), range);

    analysisContext
        .getAccumulatedErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .location(new OriginalLocation(location, null))
                .suggestion(
                    messageService.getMessage(
                        "compilerDirective.warning.conflictingCicsOptions",
                        assumedOption.toUpperCase()))
                .severity(ErrorSeverity.WARNING)
                .build());
  }

  private String getConflictGroup(String option) {
    switch (option.toUpperCase()) {
      case "QUOTE":
      case "APOST":
        return "DELIMITER";

      case "CBLCARD":
      case "NOCBLCARD":
        return "CBLCARD";

      case "COBOL2":
      case "CO2":
      case "COBOL3":
      case "CO3":
        return "COBOL_VERSION";

      case "CPSM":
      case "NOCPSM":
        return "CPSM";

      case "DEBUG":
      case "NODEBUG":
        return "DEBUG";

      case "EDF":
      case "NOEDF":
        return "EDF";

      case "FEPI":
      case "NOFEPI":
        return "FEPI";

      case "LENGTH":
      case "NOLENGTH":
        return "LENGTH";

      case "LINKAGE":
      case "NOLINKAGE":
        return "LINKAGE";

      case "NUM":
      case "NONUM":
        return "NUM";

      case "OPTIONS":
      case "NOOPTIONS":
        return "OPTIONS";

      case "SEQ":
      case "NOSEQ":
        return "SEQ";

      case "SPIE":
      case "NOSPIE":
        return "SPIE";

      case "VBREF":
      case "NOVBREF":
        return "VBREF";

      default:
        return null;
    }
  }
}
