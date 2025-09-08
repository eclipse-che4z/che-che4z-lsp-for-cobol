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

import static org.apache.commons.lang3.StringUtils.isBlank;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.core.preprocessor.cbl.*;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** CICS translator options utils */
public final class TranslatorOptionsUtils {

  private static final Pattern CBL_LINE =
      Pattern.compile("^(?<prefix>\\s*(CBL|PROCESS)\\s+)(?<cbl>.*)$", Pattern.CASE_INSENSITIVE);

  /**
   * Extract CICS translator options from CBL lines
   *
   * @param context is a dialect processing context
   * @param diagnostics list of syntax errors
   * @return List of CICS translator options
   */
  public static List<CompilerDirectiveNode> extractCompilerDirectives(
      DialectProcessingContext context, List<SyntaxError> diagnostics) {
    String[] lines = context.getExtendedDocument().getCurrentText().toString().split("\n\r?");
    List<CompilerDirectiveNode> compilerDirectiveNodes = new ArrayList<>();
    CobolProgramLayout layout = context.getLayout();
    for (int lineNumber = 0; lineNumber < lines.length; lineNumber++) {
      String line = lines[lineNumber];
      if (line.trim().length() <= layout.getAriaAStart()) {
        continue;
      }
      Matcher lineMatch = CBL_LINE.matcher(getABContent(line, layout));
      if (!lineMatch.find()) {
        break;
      }
      Range lineRange =
          new Range(new Position(lineNumber, 0), new Position(lineNumber, line.length()));
      String newText =
          replaceCicsOpts(context, line, lineNumber, compilerDirectiveNodes, diagnostics);
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
      String line,
      int lineNumber,
      List<CompilerDirectiveNode> directiveNodes,
      List<SyntaxError> diagnostics) {
    CobolProgramLayout layout = context.getLayout();
    String cblString = StringUtils.repeat(" ", layout.getAriaAStart()) + getABContent(line, layout);

    CblParser cblParser = new CblParser(cblString, context.getProgramDocumentUri(), lineNumber);
    String serialize = cblParser.extractCicsOptions();
    diagnostics.addAll(cblParser.getDiagnostics());
    directiveNodes.addAll(cblParser.getDirectiveNodes());
    if (isBlank(serialize)) {
      return "";
    }
    return formatResult(context, line, serialize);
  }

  private static String formatResult(DialectProcessingContext context, String line, String result) {
    if (!result.isEmpty()) {
      CobolProgramLayout l = context.getLayout();
      int codeEnd = Math.min(l.getSourceCodeLength(), line.length());
      if (result.length() < codeEnd) {
        result += StringUtils.repeat(" ", codeEnd - result.length());
      }
      result = result.substring(l.getAriaAStart());
      String prefix = line.substring(0, l.getAriaAStart());
      String tail =
          line.length() - l.getSourceCodeLength() > 0
              ? line.substring(l.getSourceCodeLength())
              : "";

      return prefix + result + tail;
    }
    return result;
  }

  private static String getABContent(String line, CobolProgramLayout layout) {
    return line.substring(
        layout.getAriaAStart(),
        Math.min(
            layout.getAreaALength() + layout.getAreaBLength() + layout.getAriaAStart(),
            line.length()));
  }
}
