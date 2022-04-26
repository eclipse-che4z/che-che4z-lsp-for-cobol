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
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.*;

/** Dialect utility class */
@Singleton
public class DialectService {
  private static final CobolDialect EMPTY_DIALECT = () -> "COBOL";

  private final Map<String, CobolDialect> dialectSuppliers;

  @Inject
  public DialectService(CopybookService copybookService,
                        ParseTreeListener treeListener,
                        MessageService messageService) {
    dialectSuppliers = new HashMap<>();

    CobolDialect dialect = new IdmsDialect(copybookService, treeListener, messageService);
    dialectSuppliers.put(dialect.getName(), dialect);
  }

  /**
   * Process the source file text with dialects
   *
   * @param dialects the list of enabled dialects
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return dialects outcome
   */
  public ResultWithErrors<DialectOutcome> process(List<String> dialects, DialectProcessingContext context) {
    return dialects.stream()
        .map(this::getDialectByName)
        .reduce(
            ResultWithErrors.of(new DialectOutcome(context.getText(), ImmutableList.of())),
            (previousResult, dialect) -> processDialect(previousResult, dialect, context),
            DialectService::mergeResults
        );
  }

  private CobolDialect getDialectByName(String dialectName) {
    return dialectSuppliers.getOrDefault(dialectName, EMPTY_DIALECT);
  }

  private static ResultWithErrors<DialectOutcome> processDialect(ResultWithErrors<DialectOutcome> previousResult,
                                                                 CobolDialect dialect,
                                                                 DialectProcessingContext context) {
    List<Node> nodes = new ArrayList<>(previousResult.getResult().getDialectNodes());
    List<SyntaxError> errors = new ArrayList<>(previousResult.getErrors());

    DialectOutcome result = dialect.processText(context.toBuilder()
            .text(previousResult.getResult().getText())
            .build())
        .unwrap(errors::addAll);
    nodes.addAll(result.getDialectNodes());
    return new ResultWithErrors<>(new DialectOutcome(result.getText(), nodes), errors);
  }

  private static ResultWithErrors<DialectOutcome> mergeResults(ResultWithErrors<DialectOutcome> result1,
                                                               ResultWithErrors<DialectOutcome> result2) {
    throw new ConcurrentModificationException("The reduction must be done sequentially");
  }

}
