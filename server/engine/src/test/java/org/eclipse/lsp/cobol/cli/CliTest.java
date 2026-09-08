/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.cli;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.cli.command.Cli;
import org.eclipse.lsp.cobol.cli.command.CliHelp;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import picocli.CommandLine;

/** Test for {@link Cli} */
@ExtendWith(MockitoExtension.class)
class CliTest {
  public static final String EXPECTED_USAGE =
      "Usage: <main class> [-hV] [COMMAND]"
          + System.lineSeparator()
          + "COBOL Analysis CLI tools."
          + System.lineSeparator()
          + "  -h, --help      Show this help message and exit."
          + System.lineSeparator()
          + "  -V, --version   Print version information and exit."
          + System.lineSeparator()
          + "Commands:"
          + System.lineSeparator()
          + "  list_sources    list sources"
          + System.lineSeparator()
          + "  list_copybooks  list copybooks"
          + System.lineSeparator()
          + "  analysis        analyse cobol source"
          + System.lineSeparator()
          + "  cfast           generate cfast from cobol source"
          + System.lineSeparator();

  @Test
  void testCli_srcNonNull() {
    CommandLine commandLine = new CommandLine(new Cli());
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    commandLine.usage(pw);
    pw.flush();
    assertEquals(EXPECTED_USAGE, sw.toString());
  }

  @Test
  void testCli_usage() {
    CommandLine commandLine = new CommandLine(new Cli());
    assertEquals(CommandLine.ExitCode.USAGE, commandLine.execute("-s", "source"));
  }

  @Test
  void testCli_srcNull() {
    CommandLine commandLine = new CommandLine(new Cli());
    assertEquals(CommandLine.ExitCode.OK, commandLine.execute());
  }

  @Test
  void testCliCommands() {
    CommandLine commandLine = new CommandLine(new Cli());
    Set<String> commandList = commandLine.getSubcommands().keySet();
    assertEquals(4, commandList.size());
    assertTrue(commandList.contains("analysis"));
    assertTrue(commandList.contains("list_copybooks"));
    assertTrue(commandList.contains("list_sources"));
    assertTrue(commandList.contains("cfast"));
  }

  @Test
  void testListCopybooksHelp_optionsAreUniformlyIndented() {
    CommandLine commandLine = new CommandLine(new Cli());
    commandLine.setHelpFactory(new CliHelp.Factory());
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    commandLine.getSubcommands().get("list_copybooks").usage(pw);
    pw.flush();

    List<String> optionLines =
        Arrays.stream(sw.toString().split(System.lineSeparator()))
            .filter(line -> line.trim().startsWith("-"))
            .collect(Collectors.toList());
    assertEquals(7, optionLines.size());
    Set<Integer> indents =
        optionLines.stream()
            .map(line -> line.length() - line.replaceFirst("^ +", "").length())
            .collect(Collectors.toSet());
    assertEquals(
        Collections.singleton(3),
        indents,
        "every option, whether it has a true short flag (-h) or a multi-character"
            + " mnemonic (-ce, -cf, -ws), should be indented the same amount");
  }

  @Test
  void testAnalysisHelp_everyOptionFitsOnOneLine() {
    CommandLine commandLine = new CommandLine(new Cli());
    commandLine.setHelpFactory(new CliHelp.Factory());
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    commandLine.getSubcommands().get("analysis").usage(pw);
    pw.flush();

    // "analysis" has an option whose combined names are unusually long
    // ("-esf, -exf, --save-extended-source=<extendedSourcePath>"), which previously either pushed
    // its own description to a hanging second line, or (once that column was widened to fit it)
    // starved the description column for every other option into wrapping instead. Neither should
    // happen: every option, including this one, should render as exactly one line.
    List<String> optionLines =
        Arrays.stream(sw.toString().split(System.lineSeparator()))
            .filter(line -> line.trim().startsWith("-"))
            .collect(Collectors.toList());
    List<String> nonOptionBodyLines =
        Arrays.stream(sw.toString().split(System.lineSeparator()))
            .skip(6) // Usage: synopsis (5 lines) + "analyse cobol source" header
            .filter(line -> !line.trim().isEmpty())
            .collect(Collectors.toList());

    assertEquals(13, optionLines.size());
    assertEquals(
        optionLines.size(),
        nonOptionBodyLines.size(),
        "every non-blank line in the option list should itself start with an option name;"
            + " a mismatch means some description wrapped onto its own line");
  }
}
