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

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.AntlrRangeUtils;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp4j.Range;

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
      if (child instanceof CobolPreprocessor.PseudoReplacementContext
          || child instanceof CobolPreprocessor.PseudoReplaceableContext
          || !(child instanceof ParserRuleContext)) {
        children.add(child.getText());
      } else {
        children.add(createClause((ParserRuleContext) child));
      }
    }
    return String.join(" ", children);
  }

  /**
   * Creates a string for replacement parsing from a given list of clauses
   *
   * @param children - list of clauses
   * @return a string
   */
  public List<Pair<String, Range>> createClause(List<ParseTree> children) {
    if (children == null) return Collections.emptyList();
    return children.stream()
        .filter(t -> t instanceof CobolPreprocessor.ReplacingPhraseContext)
        .flatMap(t -> ((CobolPreprocessor.ReplacingPhraseContext) t).children.stream())
        .filter(c -> c instanceof CobolPreprocessor.ReplaceClauseContext)
        .map(
            c ->
                ImmutablePair.of(
                    createClause((ParserRuleContext) c), AntlrRangeUtils.constructRange(c)))
        .collect(Collectors.toList());
  }
}
