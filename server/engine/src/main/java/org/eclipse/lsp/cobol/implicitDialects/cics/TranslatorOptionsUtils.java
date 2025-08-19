/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.cics;

import com.google.common.collect.Sets;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import static org.apache.commons.lang3.StringUtils.repeat;

/** CICS translator options utils */
public final class TranslatorOptionsUtils {
  private static final int A_B_ARIA_LEN = 72 - 7;

  private static final Pattern CBL_LINE =
      Pattern.compile("^(?<prefix>\\s*(CBL|PROCESS)\\s+)(?<cbl>.*)$", Pattern.CASE_INSENSITIVE);
  private static final Pattern CBL_CICS =
      Pattern.compile(
          ".*(?<cics>CICS\\s*\\(\"?(?<args>([^()]|\\([^()]*\"?\\))+)\\))", Pattern.CASE_INSENSITIVE);
  private static final Pattern CBL_XOPTS =
      Pattern.compile(
          ".*(?<xopts>XOPTS?\\s*\\((?<args>([^()]|\\([^()]*\\))+)\\))", Pattern.CASE_INSENSITIVE);
  public static final HashSet<Character> DELIMITERS = Sets.newHashSet(' ', ',');

  /**
   * Extract CICS translator options from CBL lines
   *
   * @param context is a dialect processing context
   * @return List of CICS translator options
   */
  public static List<CompilerDirectiveNode> extractCompilerDirectives(
      DialectProcessingContext context) {
    String[] lines = context.getExtendedDocument().getCurrentText().toString().split("\n\r?");
    List<CompilerDirectiveNode> compilerDirectiveNodes = new ArrayList<>();
    for (int lineNumber = 0; lineNumber < lines.length; lineNumber++) {
      String line = lines[lineNumber];
      if (line.trim().length() <= getAriaA(context.getLanguageId())) {
        continue;
      }
      Matcher lineMatch =
          CBL_LINE.matcher(
              line.substring(
                  getAriaA(context.getLanguageId()),
                  Math.min(A_B_ARIA_LEN + getAriaA(context.getLanguageId()), line.length())));
      if (!lineMatch.find()) {
        break;
      }
      Range lineRange =
          new Range(new Position(lineNumber, 0), new Position(lineNumber, line.length()));
      String newText =
          replaceCicsOpts(context, lineMatch, line, lineNumber, compilerDirectiveNodes);
      if (newText.isEmpty()) {
        context.getExtendedDocument().delete(lineNumber);
      } else {
        context.getExtendedDocument().replace(lineRange, newText);
      }

    }
    return compilerDirectiveNodes;
  }

  private static String replaceCicsOpts(
      DialectProcessingContext context,
      Matcher lineMatch,
      String line,
      int lineNumber,
      List<CompilerDirectiveNode> directiveNodes) {
    String cblString = lineMatch.group("cbl");

    List<String> fragments = split(cblString);
    int[] counts = new int[fragments.size()];

    int shift = getAriaA(context.getLanguageId()) + lineMatch.start("cbl");
    for (int i = 0; i < fragments.size(); i++) {
      Matcher cicsMatcher = CBL_CICS.matcher(fragments.get(i));
      Matcher xoptsMatcher = CBL_XOPTS.matcher(fragments.get(i));
      if (cicsMatcher.find()) {
        counts[i] = 0;
        fragments.set(i, repeat(' ', fragments.get(i).length()));
        String cicsText = cicsMatcher.group("args");
        int cicsStart = shift + cicsMatcher.start("args");
        directiveNodes.addAll(
            createCicsNodes(
                context.getExtendedDocument().getUri(), lineNumber, cicsStart, cicsText));
      } else if (xoptsMatcher.find()) {
        StringBuilder fragmentBuilder = new StringBuilder();
        counts[i] =
            processCicsXOpts(
                context,
                directiveNodes,
                xoptsMatcher,
                fragments.get(i),
                shift + xoptsMatcher.start("args"),
                lineNumber,
                fragmentBuilder);
        fragments.set(
            i, counts[i] > 0 ? fragmentBuilder.toString() : repeat(' ', fragments.get(i).length()));
      } else {
        counts[i] = 1;
      }
      shift += fragments.get(i).length();
    }

    int nonCicsOptionsCount = sumCounts(counts);

    StringBuilder result = new StringBuilder();
    for (int i = 0; i < fragments.size(); i++) {
      // count 1 means it's the last option
      result.append(counts[i] > 1 ? fragments.get(i) : removeLastComma(fragments.get(i)));
    }

    String prefix =
        nonCicsOptionsCount > 0
            ? line.substring(0, getAriaA(context.getLanguageId()) + lineMatch.start("cbl"))
            : line.substring(0, getAriaA(context.getLanguageId()) + lineMatch.start("prefix"))
                + repeat(' ', lineMatch.group("prefix").length());

    String tail =
        line.length() - prefix.length() - result.length() > 0
            ? line.substring(prefix.length() + result.length())
            : "";

    if (result.toString().trim().isEmpty()) {
      return "";
    }
    return prefix + result + tail;
  }

  private static int sumCounts(int[] counts) {
    int nonCicsOptionsCount = 0;
    for (int i = counts.length - 1; i >= 0; i--) {
      if (counts[i] > 0) {
        nonCicsOptionsCount += counts[i];
        counts[i] = nonCicsOptionsCount;
      }
    }
    return nonCicsOptionsCount;
  }

  private static List<CompilerDirectiveNode> createCicsNodes(
      String uri, int lineNumber, int shift, String cicsText) {
    List<CompilerDirectiveNode> result = new ArrayList<>();
    List<String> fragments = split(cicsText);
    for (String fragment : fragments) {
      String nodeText = removeLastComma(fragment).trim();
      result.add(createNode(uri, lineNumber, shift, shift + nodeText.length(), nodeText));
      shift += fragment.length();
    }

    return result;
  }

  private static int processCicsXOpts(
      DialectProcessingContext context,
      List<CompilerDirectiveNode> directiveNodes,
      Matcher xOpts,
      String xOptText,
      int shift,
      int lineNumber,
      StringBuilder result) {
    result.append(xOpts.group(0), 0, xOpts.start("args"));
    List<String> fragments = split(xOpts.group("args"));

    int[] counts = new int[fragments.size()];
    for (int i = 0; i < fragments.size(); i++) {
      if (isCicsOption(fragments.get(i))) {
        counts[i] = 0;
      } else {
        counts[i] = 1;
      }
    }
    sumCounts(counts);
    boolean hasNonCics = false;
    for (int i = 0; i < fragments.size(); i++) {
      int length = fragments.get(i).length();
      if (!isCicsOption(fragments.get(i))) {
        result.append(counts[i] > 1 ? fragments.get(i) : removeLastComma(fragments.get(i)));
        hasNonCics = true;
        shift += length;
        continue;
      }

      result.append(repeat(' ', length));
      String nodeText = removeLastComma(fragments.get(i)).trim();
      directiveNodes.add(
          createNode(
              context.getExtendedDocument().getUri(),
              lineNumber,
              shift,
              shift + nodeText.length(),
              nodeText));
      shift += length;
    }
    result.append(xOptText, result.length(), xOptText.length());
    return hasNonCics ? 1 : 0;
  }

  private static boolean isCicsOption(String fragment) {
    switch (getOptionName(fragment)) {
      case "APOST":
      case "QUOTE":
      case "CBLCARD":
      case "NOCBLCARD":
      case "CICS":
      case "COBOL2":
      case "COBOL3":
      case "CPSM":
      case "NOCPSM":
      case "DBCS":
      case "DEBUG":
      case "NODEBUG":
      case "DLI":
      case "EDF":
      case "NOEDF":
      case "EXCI":
      case "FEPI":
      case "NOFEPI":
      case "LENGTH":
      case "NOLENGTH":
      case "LINKAGE":
      case "NOLINKAGE":
      case "NATLANG":
      case "NUM":
      case "NONUM":
      case "OPTIONS":
      case "NOOPTIONS":
      case "SEQ":
      case "NOSEQ":
      case "SP":
      case "SPIE":
      case "NOSPIE":
      case "SYSEIB":
      case "VBREF":
      case "NOVBREF":
      case "SPACE":
      case "FLAG":
      case "F":
      case "LC":
      case "LINECOUNT":
        return true;
      default:
        return false;
    }
  }

  private static String getOptionName(String fragment) {
    int parenthesis = fragment.indexOf('(');
    if (parenthesis > 0) {
      fragment = fragment.substring(0, parenthesis);
    }
    int space = fragment.indexOf(' ');
    if (space > 0) {
      fragment = fragment.substring(0, space);
    }
    int comma = fragment.indexOf(',');
    if (comma > 0) {
      fragment = fragment.substring(0, comma);
    }
    fragment = fragment.toUpperCase();
    return fragment;
  }

  private static List<String> split(String cblString) {
    List<String> result = new ArrayList<>();
    int fragmentStart = 0;
    int depth = 0;
    for (int i = 0; i < cblString.length(); i++) {
      if (depth == 0 && DELIMITERS.contains(cblString.charAt(i))) {
        i += 1;
        while (i < cblString.length() && DELIMITERS.contains(cblString.charAt(i))) {
          i += 1;
        }
        if (i < cblString.length() && cblString.charAt(i) != '(') {
          result.add(cblString.substring(fragmentStart, i));
          fragmentStart = i;
        } else {
          depth++;
        }
      } else if (cblString.charAt(i) == '(') {
        depth++;
      } else if (cblString.charAt(i) == ')') {
        depth--;
      }
    }
    if (fragmentStart < cblString.length()) {
      result.add(cblString.substring(fragmentStart));
    }
    return result;
  }

  private static CompilerDirectiveNode createNode(
      String uri, int lineNumber, int start, int end, String text) {
    Locality locality =
        Locality.builder()
            .uri(uri)
            .range(new Range(new Position(lineNumber, start), new Position(lineNumber, end)))
            .build();
    return new CompilerDirectiveNode(locality, text, CICSDialect.DIALECT_NAME);
  }

  private static String removeLastComma(String fragment) {
    int commaPos = fragment.lastIndexOf(',');
    if (commaPos < 0 || commaPos < fragment.lastIndexOf(')')) {
      return fragment;
    }
    return fragment.substring(0, commaPos) + " " + fragment.substring(commaPos + 1);
  }

  private static int getAriaA(String languageId) {
    CobolProgramLayout layout = CobolLanguageId.MAPPER.get(languageId).getLayout();
    return layout.getSequenceLength() + layout.getIndicatorLength();
  }

  private static int getAriaABLen(String languageId) {
    CobolProgramLayout layout = CobolLanguageId.MAPPER.get(languageId).getLayout();
    return layout.getAreaBLength() + layout.getAreaALength();
  }
}
