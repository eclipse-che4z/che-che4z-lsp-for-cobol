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
    return replacePseudoTextContext.LEADING() != null
        ? SearchPattern.STARTS_WITH
        : replacePseudoTextContext.TRAILING() != null
            ? SearchPattern.ENDS_WITH
            : SearchPattern.EXACT;
  }
}
