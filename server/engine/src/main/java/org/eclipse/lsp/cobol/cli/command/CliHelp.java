/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.cli.command;

import java.util.ArrayList;
import java.util.List;
import picocli.CommandLine;
import picocli.CommandLine.Model.CommandSpec;
import picocli.CommandLine.Model.OptionSpec;
import picocli.CommandLine.Model.PositionalParamSpec;

/**
 * Renders every option's names in a single, uniformly indented column instead of picocli's default
 * layout, which only recognizes names of exactly two characters (e.g. "-d") as "short options"
 * placed in their own column. The multi-character single-dash mnemonics used throughout this CLI
 * (e.g. "-cf", "-ce", "-ws") don't qualify, so with the default layout they end up indented
 * differently from options like "-h", "-s" and "-V".
 */
public class CliHelp extends CommandLine.Help {

  public CliHelp(CommandSpec commandSpec, ColorScheme colorScheme) {
    super(commandSpec, colorScheme);
  }

  @Override
  public IOptionRenderer createDefaultOptionRenderer() {
    return new UniformOptionRenderer(requiredMarker());
  }

  @Override
  public IParameterRenderer createDefaultParameterRenderer() {
    return new UniformParameterRenderer(requiredMarker());
  }

  @Override
  public Layout createDefaultLayout(
      List<OptionSpec> options, List<PositionalParamSpec> positionals, ColorScheme colorScheme) {
    // Size both columns to fit their widest content rather than a fixed terminal width, so every
    // option always renders on exactly one line: no option overflows into the description column,
    // and no description wraps to a hanging second line.
    int namesWidth = 0;
    int descriptionWidth = 0;
    for (OptionSpec option : options) {
      if (!option.hidden()) {
        namesWidth =
            Math.max(
                namesWidth,
                namesText(option, parameterLabelRenderer(), colorScheme).plainString().length());
        descriptionWidth =
            Math.max(
                descriptionWidth,
                maxLineLength(descriptionLines(colorScheme, option.description())));
      }
    }
    for (PositionalParamSpec param : positionals) {
      if (!param.hidden()) {
        namesWidth =
            Math.max(
                namesWidth,
                parameterLabelRenderer()
                    .renderParameterLabel(param, ansi(), colorScheme.parameterStyles())
                    .plainString()
                    .length());
        descriptionWidth =
            Math.max(
                descriptionWidth,
                maxLineLength(descriptionLines(colorScheme, param.description())));
      }
    }
    int namesColumnWidth = namesWidth + 1;
    int descriptionColumnWidth = descriptionWidth + 1;
    TextTable textTable =
        TextTable.forColumns(
            colorScheme,
            new Column(2, 0, Column.Overflow.TRUNCATE),
            new Column(namesColumnWidth, 1, Column.Overflow.SPAN),
            new Column(descriptionColumnWidth, 1, Column.Overflow.WRAP));
    textTable.setAdjustLineBreaksForWideCJKCharacters(
        commandSpec().usageMessage().adjustLineBreaksForWideCJKCharacters());
    // picocli hangs any wrapped line 2 columns further right than the first line by default;
    // columns are sized above so wrapping shouldn't happen, but keep this as a safety net.
    textTable.indentWrappedLines = 0;
    return new Layout(
        colorScheme, textTable, createDefaultOptionRenderer(), createDefaultParameterRenderer());
  }

  private static int maxLineLength(Ansi.Text[] lines) {
    int max = 0;
    for (Ansi.Text line : lines) {
      max = Math.max(max, line.plainString().length());
    }
    return max;
  }

  private String requiredMarker() {
    return "" + commandSpec().usageMessage().requiredOptionMarker();
  }

  private static Ansi.Text namesText(
      OptionSpec option, IParamLabelRenderer paramLabelRenderer, ColorScheme colorScheme) {
    Ansi.Text names = colorScheme.optionText(String.join(", ", option.names()));
    Ansi.Text paramLabel =
        paramLabelRenderer.renderParameterLabel(
            option, colorScheme.ansi(), colorScheme.optionParamStyles());
    return names.concat(paramLabel);
  }

  private static Ansi.Text[] descriptionLines(ColorScheme colorScheme, String[] description) {
    if (description.length == 0) {
      return new Ansi.Text[] {colorScheme.text("")};
    }
    List<Ansi.Text> lines = new ArrayList<>();
    for (String line : description) {
      for (Ansi.Text splitLine : colorScheme.text(line).splitLines()) {
        lines.add(splitLine);
      }
    }
    return lines.toArray(new Ansi.Text[0]);
  }

  private static final class UniformOptionRenderer implements IOptionRenderer {
    private final String requiredMarker;

    UniformOptionRenderer(String requiredMarker) {
      this.requiredMarker = requiredMarker;
    }

    @Override
    public Ansi.Text[][] render(
        OptionSpec option, IParamLabelRenderer paramLabelRenderer, ColorScheme colorScheme) {
      Ansi.Text names = namesText(option, paramLabelRenderer, colorScheme);
      String requiredOption =
          !option.originallyRequired() && option.required() ? requiredMarker : "";
      Ansi.Text[] lines = descriptionLines(colorScheme, option.description());

      List<Ansi.Text[]> rows = new ArrayList<>();
      rows.add(new Ansi.Text[] {colorScheme.optionText(requiredOption), names, lines[0]});
      for (int i = 1; i < lines.length; i++) {
        rows.add(new Ansi.Text[] {colorScheme.text(""), colorScheme.text(""), lines[i]});
      }
      return rows.toArray(new Ansi.Text[0][]);
    }
  }

  private static final class UniformParameterRenderer implements IParameterRenderer {
    private final String requiredMarker;

    UniformParameterRenderer(String requiredMarker) {
      this.requiredMarker = requiredMarker;
    }

    @Override
    public Ansi.Text[][] render(
        PositionalParamSpec param,
        IParamLabelRenderer paramLabelRenderer,
        ColorScheme colorScheme) {
      Ansi.Text label =
          paramLabelRenderer.renderParameterLabel(
              param, colorScheme.ansi(), colorScheme.parameterStyles());
      Ansi.Text requiredParam =
          colorScheme.parameterText(param.arity().min() > 0 ? requiredMarker : "");
      Ansi.Text[] lines = descriptionLines(colorScheme, param.description());

      List<Ansi.Text[]> rows = new ArrayList<>();
      rows.add(new Ansi.Text[] {requiredParam, label, lines[0]});
      for (int i = 1; i < lines.length; i++) {
        rows.add(new Ansi.Text[] {colorScheme.text(""), colorScheme.text(""), lines[i]});
      }
      return rows.toArray(new Ansi.Text[0][]);
    }
  }

  /** Creates {@link CliHelp} instances so the uniform option layout applies to every subcommand. */
  public static final class Factory implements CommandLine.IHelpFactory {
    @Override
    public CommandLine.Help create(
        CommandSpec commandSpec, CommandLine.Help.ColorScheme colorScheme) {
      return new CliHelp(commandSpec, colorScheme);
    }
  }
}
