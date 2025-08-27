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

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.core.preprocessor.cbl.CblLexer;
import org.eclipse.lsp.cobol.core.preprocessor.cbl.CblNode;
import org.eclipse.lsp.cobol.core.preprocessor.cbl.CblParser;
import org.eclipse.lsp.cobol.core.preprocessor.cbl.CicsFilter;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** CICS translator options utils */
public final class TranslatorOptionsUtils {
  private static final int A_B_ARIA_LEN = 72 - 7;

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
    int ariaA = getAriaA(context.getLanguageId());
    String cblString =
        StringUtils.repeat(" ", ariaA)
            + line.substring(ariaA, Math.min(A_B_ARIA_LEN + ariaA, line.length()));
    CblLexer lexer = new CblLexer(context.getProgramDocumentUri(), cblString, lineNumber);
    CblNode cbl = new CblParser(lexer, diagnostics).cbl();

    String result = new CicsFilter().createFilteredLine(cbl, directiveNodes);
    if (!result.isEmpty()) {
      result = result.substring(ariaA);
      String prefix = line.substring(0, ariaA);
      String tail =
          line.length() - ariaA - result.length() > 0
              ? line.substring(ariaA + result.length())
              : "";

      return prefix + result + tail;
    }
    return result;
  }

  private static int getAriaA(String languageId) {
    CobolProgramLayout layout = CobolLanguageId.MAPPER.get(languageId).getLayout();
    return layout.getSequenceLength() + layout.getIndicatorLength();
  }
}
