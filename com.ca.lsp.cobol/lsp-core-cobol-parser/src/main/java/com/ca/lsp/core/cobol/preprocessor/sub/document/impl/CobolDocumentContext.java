/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceClauseContext;
import org.antlr.v4.runtime.BufferedTokenStream;

import java.util.List;

/**
 * A replacement context that defines, which replaceables should be replaced by which replacements.
 */
public class CobolDocumentContext {

  private StringBuilder outputBuffer = new StringBuilder();

  public String read() {
    return outputBuffer.toString();
  }

  public void write(String text) {
    outputBuffer.append(text);
  }

  void applyReplacing(List<ReplaceClauseContext> replaceClauses, BufferedTokenStream tokens) {
    if (replaceClauses == null || replaceClauses.isEmpty()) {
      return;
    }
    replaceClauses.stream()
        .map(it -> new CobolReplacementMapping(it.replaceable(), it.replacement()))
        .forEach(
            it -> {
              String currentOutput = outputBuffer.toString();
              outputBuffer = new StringBuilder();
              outputBuffer.append(it.replace(currentOutput, tokens));
            });
  }
}
