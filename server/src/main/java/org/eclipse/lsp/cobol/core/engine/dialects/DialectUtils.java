/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.List;
import java.util.Map;

/** Dialect utility class */
@UtilityClass
public class DialectUtils {
  private static final Map<String, CobolDialect> DIALECTS_SUPPLIERS = ImmutableMap.of(
      IdmsDialect.NAME, new IdmsDialect()
  );

  private static final CobolDialect EMPTY_DIALECT = new CobolDialect() {};

  /**
   * Process the source file text with dialects
   *
   * @param uri the source file URI
   * @param text the source text
   * @param dialects the list of enabled dialects
   * @param messageService error message service
   * @return dialects outcome
   */
  public ResultWithErrors<DialectOutcome> process(String uri, String text, List<String> dialects,
                                                  MessageService messageService) {
    return dialects.stream()
        .map(DialectUtils::getDialectByName)
        .reduce(
            ResultWithErrors.of(new DialectOutcome(text, ImmutableList.of())),
            (previousResult, dialect) -> processDialect(previousResult, dialect, uri, messageService),
            DialectUtils::mergeResults
        );
  }

  private static CobolDialect getDialectByName(String dialectName) {
    return DIALECTS_SUPPLIERS.getOrDefault(dialectName, EMPTY_DIALECT);
  }

  private static ResultWithErrors<DialectOutcome> processDialect(ResultWithErrors<DialectOutcome> previousResult,
                                                                 CobolDialect dialect,
                                                                 String uri,
                                                                 MessageService messageService) {
    List<Node> nodes = new ArrayList<>(previousResult.getResult().getDialectNodes());
    List<SyntaxError> errors = new ArrayList<>(previousResult.getErrors());
    DialectOutcome result = dialect.processText(uri, previousResult.getResult().getText(), messageService)
        .unwrap(errors::addAll);
    nodes.addAll(result.getDialectNodes());
    return new ResultWithErrors<>(new DialectOutcome(result.getText(), nodes), errors);
  }

  private static ResultWithErrors<DialectOutcome> mergeResults(ResultWithErrors<DialectOutcome> result1,
                                                               ResultWithErrors<DialectOutcome> result2) {
    throw new ConcurrentModificationException("The reduction must be done sequentially");
  }

  /**
   * Construct the range from ANTLR context
   *
   * @param ctx the ANTLR context
   * @return the range
   */
  public Range constructRange(ParserRuleContext ctx) {
    return new Range(
        new Position(
            ctx.start.getLine() - 1,
            ctx.start.getCharPositionInLine()),
        new Position(
            ctx.stop.getLine() - 1,
            ctx.stop.getCharPositionInLine() + ctx.stop.getStopIndex() - ctx.stop.getStartIndex() + 1)
    );
  }
}
