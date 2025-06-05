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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import java.util.LinkedList;
import java.util.List;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;

/** Helper for replacement functionality */
@UtilityClass
public class ReplacementHelper {

  /**
   * Creates a string for replacement parsing from a given clause
   *
   * @param ctx - clause
   * @return a string
   */
  public String createClause(ParserRuleContext ctx) {
    if (ctx == null) {
      return "";
    }
    List<String> children = new LinkedList<>();
    for (ParseTree child : ctx.children) {
      if (child instanceof ParserRuleContext) {
        children.add(createClause((ParserRuleContext) child));
      } else {
        children.add(child.getText());
      }
    }
    return String.join(" ", children);
  }

  /**
   * Returns a searchPattern strategy based on the passed antlr context
   *
   * @param replacePseudoTextContext Antlr replacePseudoText context
   * @return SearchPattern
   */
  public static SearchPattern getSearchPattern(
      CobolPreprocessor.ReplacePseudoTextContext replacePseudoTextContext) {
    if (replacePseudoTextContext.LEADING() != null) return SearchPattern.STARTS_WITH;
    if (replacePseudoTextContext.TRAILING() != null) return SearchPattern.ENDS_WITH;
    return SearchPattern.EXACT;
  }

  /**
   * Gives replaceable pseudo text used in `{replaceable} BY {replacement}` replac(e/ing) context of
   * COBOL source.
   *
   * @param pseudoReplaceableContext
   * @return a pseudo text String.
   */
  public String getPseudoText(CobolPreprocessor.PseudoReplaceableContext pseudoReplaceableContext) {
    if (pseudoReplaceableContext == null || pseudoReplaceableContext.pseudoTextContent() == null) {
      return "";
    }
    return pseudoReplaceableContext.pseudoTextContent().getText();
  }

  /**
   * Gives replacement pseudo text used in `{replaceable} BY {replacement}` replac(e/ing) context of
   * COBOL source.
   *
   * @param pseudoReplacementContext
   * @return a pseudo text String.
   */
  public String getPseudoText(CobolPreprocessor.PseudoReplacementContext pseudoReplacementContext) {
    if (pseudoReplacementContext == null || pseudoReplacementContext.pseudoTextContent() == null) {
      return "";
    }
    return pseudoReplacementContext.pseudoTextContent().getText();
  }
}
