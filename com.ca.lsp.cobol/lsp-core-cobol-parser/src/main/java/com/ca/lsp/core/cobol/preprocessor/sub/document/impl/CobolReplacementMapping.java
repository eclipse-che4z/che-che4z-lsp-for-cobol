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

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.PseudoTextContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceSameElementContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.antlr.v4.runtime.BufferedTokenStream;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.util.Arrays.stream;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static org.apache.commons.lang3.StringUtils.split;

/** A mapping from a replaceable to a replacement. */
@Data
@AllArgsConstructor
public class CobolReplacementMapping {

  private ReplaceSameElementContext replaceable;
  private ReplaceSameElementContext replacement;

  private String extractPseudoText(PseudoTextContext pseudoTextCtx, BufferedTokenStream tokens) {
    String pseudoText = TokenUtils.getTextIncludingHiddenTokens(pseudoTextCtx, tokens).trim();
    return pseudoText.replaceAll("^==", "").replaceAll("==$", "").trim();
  }

  /**
   * Get a regex from string. Whitespace in Cobol replaceables matches line breaks. Hence, the
   * replaceable search string has to be enhanced to a regex
   */
  private String getRegexFromReplaceable(String replaceable) {
    return stream(split(ofNullable(replaceable).orElse("")))
        .map(Pattern::quote)
        .collect(joining("[\\r\\n\\s]+"));
  }

  private String getText(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    if (ctx.pseudoText() != null) {
      return extractPseudoText(ctx.pseudoText(), tokens);
    } else if (ctx.charDataLine() != null) {
      return TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    } else if (ctx.cobolWord() != null) {
      return ctx.getText();
    } else if (ctx.literal() != null) {
      return ctx.literal().getText();
    }
    return null;
  }

  public String replace(String text, BufferedTokenStream tokens) {
    String replaceableString = getText(replaceable, tokens);
    String replacementString = getText(replacement, tokens);

    if (replaceableString == null || replacementString == null) {
      return text;
    }
    // regex for the replaceable
    String replaceableRegex = getRegexFromReplaceable(replaceableString);
    // regex for the replacement
    String quotedReplacementRegex = Matcher.quoteReplacement(replacementString);
    return Pattern.compile(replaceableRegex).matcher(text).replaceAll(quotedReplacementRegex);
  }
}
