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
    String[] lines = context.getExtendedDocument().getCurrentText().toString().split("\r?\n");
    List<CompilerDirectiveNode> compilerDirectiveNodes = new ArrayList<>();
    CobolProgramLayout layout = context.getLayout();
    for (int lineNumber = 0; lineNumber < lines.length; lineNumber++) {
      String line = lines[lineNumber];
      if (line.trim().length() <= layout.getAriaAStart()) {
        continue;
      }
      Matcher lineMatch =
          CBL_LINE.matcher(
              line.substring(
                  layout.getAriaAStart(), Math.min(layout.getSourceCodeLength(), line.length())));
      if (!lineMatch.find()) {
        break;
      }
      int character = lineMatch.start("cbl") + layout.getAriaAStart();
      Position start = new Position(lineNumber, character);
      Range lineRange =
          new Range(
              start,
              new Position(lineNumber, Math.min(line.length(), layout.getSourceCodeLength())));

      CblParser cblParser =
          new CblParser(
              line.substring(
                  start.getCharacter(),
                  Math.min(context.getLayout().getSourceCodeLength(), line.length())),
              context.getProgramDocumentUri(),
              start.getLine(),
              start.getCharacter());
      String newText = cblParser.extractCicsOptions();
      diagnostics.addAll(cblParser.getDiagnostics());
      compilerDirectiveNodes.addAll(cblParser.getDirectiveNodes());
      if (isBlank(newText)) {
        context.getExtendedDocument().delete(lineNumber);
      } else {
        context.getExtendedDocument().replace(lineRange, newText);
      }
    }
    return compilerDirectiveNodes;
  }
}
