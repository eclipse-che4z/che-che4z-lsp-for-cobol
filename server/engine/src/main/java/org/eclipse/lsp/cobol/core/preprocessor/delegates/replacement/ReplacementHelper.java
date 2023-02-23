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

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Range;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

/**
 * Helper for replacement functionality
 */
@UtilityClass
public class ReplacementHelper {

  /**
   * Creates a string for replacement parsing from a given clause
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
   * Creates a string for replacement parsing from a given list of clauses
   * @param children - list of clauses
   * @return a string
   */
  public List<Pair<String, Range>> createClause(List<ParseTree> children) {
    List<Pair<String, Range>> clauses = new LinkedList<>();
    for (ParseTree parseTree : children) {
      if (parseTree instanceof CobolPreprocessor.ReplacingPhraseContext) {
        for (ParseTree clause : ((CobolPreprocessor.ReplacingPhraseContext) parseTree).children) {
          if (clause instanceof CobolPreprocessor.ReplaceClauseContext) {
            CobolPreprocessor.ReplacePseudoTextContext pseudoTextContext = ((CobolPreprocessor.ReplaceClauseContext) clause).replacePseudoText();
            CobolPreprocessor.ReplaceLiteralContext literalContext = ((CobolPreprocessor.ReplaceClauseContext) clause).replaceLiteral();
            ParserRuleContext context = Optional.ofNullable((ParserRuleContext) pseudoTextContext).orElse(literalContext);

            String clauseString = createClause(context)
                .replace(" : ", ":")
                .replace(" .", ".");
            clauses.add(ImmutablePair.of(clauseString, VisitorHelper.constructRange(context)));
          }
        }
      }
    }
    return clauses;
  }
}
