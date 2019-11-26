/*
 * Copyright (c) 2019 Broadcom.
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

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.codehaus.plexus.util.StringUtils;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.PseudoTextContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceableContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplacementContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceSameElementContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;

/** A mapping from a replaceable to a replacement. */
public class CobolReplacementMapping implements Comparable<CobolReplacementMapping> {

  private ReplaceableContext replaceable;
  private ReplacementContext replacement;

  public ReplaceableContext getReplaceable() {
    return replaceable;
  }

  public void setReplaceable(ReplaceableContext replaceable) {
    this.replaceable = replaceable;
  }

  public ReplacementContext getReplacement() {
    return replacement;
  }

  public void setReplacement(ReplacementContext replacement) {
    this.replacement = replacement;
  }

  private String extractPseudoText(
      final PseudoTextContext pseudoTextCtx, final BufferedTokenStream tokens) {
    final String pseudoText = TokenUtils.getTextIncludingHiddenTokens(pseudoTextCtx, tokens).trim();
    return pseudoText.replaceAll("^==", "").replaceAll("==$", "").trim();
  }

  /**
   * Whitespace in Cobol replaceables matches line breaks. Hence, the replaceable search string has
   * to be enhanced to a regex, which is returned by this function.
   */
  private String getRegexFromReplaceable(final String replaceable) {
    final String result;

    if (replaceable == null) {
      result = null;
    } else {
      final String[] parts = StringUtils.split(replaceable);
      final String[] regexParts = new String[parts.length];
      final String regexSeparator = "[\\r\\n\\s]+";

      for (int i = 0; i < parts.length; i++) {
        final String part = parts[i];
        regexParts[i] = Pattern.quote(part);
      }

      result = StringUtils.join(regexParts, regexSeparator);
    }

    return result;
  }

  private String getText(final ParserRuleContext ctx, final BufferedTokenStream tokens) {
    if (ctx instanceof ReplaceableContext) {
      return getContextSameElement(((ReplaceableContext) ctx).replaceSameElement(), tokens);
    } else if (ctx instanceof ReplacementContext) {
      return getContextSameElement(((ReplacementContext) ctx).replaceSameElement(), tokens);
    }
    return null;
  }

  private String getContextSameElement(
      final ReplaceSameElementContext ctx, final BufferedTokenStream tokens) {

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

  protected String replace(final String string, final BufferedTokenStream tokens) {
    final String replaceableString = getText(replaceable, tokens);
    final String replacementString = getText(replacement, tokens);

    final String result;

    if (replaceableString != null && replacementString != null) {
      // regex for the replaceable
      final String replaceableRegex = getRegexFromReplaceable(replaceableString);

      // regex for the replacement
      final String quotedReplacementRegex = Matcher.quoteReplacement(replacementString);

      result = Pattern.compile(replaceableRegex).matcher(string).replaceAll(quotedReplacementRegex);
    } else {
      result = string;
    }

    return result;
  }

  @Override
  public String toString() {
    return replaceable.getText() + " -> " + replacement.getText();
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((replaceable == null) ? 0 : replaceable.hashCode());
    result = prime * result + ((replacement == null) ? 0 : replacement.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null) return false;
    if (getClass() != obj.getClass()) return false;
    CobolReplacementMapping other = (CobolReplacementMapping) obj;
    if (replaceable == null) {
      if (other.replaceable != null) return false;
    } else if (!replaceable.equals(other.replaceable)) return false;
    if (replacement == null) {
      if (other.replacement != null) return false;
    } else if (!replacement.equals(other.replacement)) return false;
    return true;
  }

  @Override
  public int compareTo(final CobolReplacementMapping o) {
    return o.replaceable.getText().length() - replaceable.getText().length();
  }
}
