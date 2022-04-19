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
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.*;

/** Dialect utility class */
@Singleton
public class DialectService {
  private static final CobolDialect EMPTY_DIALECT = () -> "COBOL";
  private final Map<String, CobolDialect> dialectSuppliers;

  @Inject
  public DialectService(CopybookService copybookService) {
    dialectSuppliers = new HashMap<>();

    CobolDialect dialect = new IdmsDialect(copybookService);
    dialectSuppliers.put(dialect.getName(), dialect);
  }

  /**
   * Process the source file text with dialects
   *
   * @param uri the source file URI
   * @param text the source text
   * @param dialects the list of enabled dialects
   * @param messageService error message service
   * @param copybookConfig is a copybook config
   * @return dialects outcome
   */
  public ResultWithErrors<DialectOutcome> process(String uri, String text, List<String> dialects,
                                                  MessageService messageService, CopybookConfig copybookConfig) {
    return dialects.stream()
        .map(this::getDialectByName)
        .reduce(
            ResultWithErrors.of(new DialectOutcome(text, ImmutableList.of())),
            (previousResult, dialect) -> processDialect(previousResult, dialect, uri, messageService, copybookConfig),
            DialectService::mergeResults
        );
  }

  private CobolDialect getDialectByName(String dialectName) {
    return dialectSuppliers.getOrDefault(dialectName, EMPTY_DIALECT);
  }

  private static ResultWithErrors<DialectOutcome> processDialect(ResultWithErrors<DialectOutcome> previousResult,
                                                                 CobolDialect dialect,
                                                                 String uri,
                                                                 MessageService messageService,
                                                                 CopybookConfig copybookConfig) {
    List<Node> nodes = new ArrayList<>(previousResult.getResult().getDialectNodes());
    List<SyntaxError> errors = new ArrayList<>(previousResult.getErrors());
    DialectOutcome result = dialect.processText(uri, previousResult.getResult().getText(), messageService, copybookConfig)
        .unwrap(errors::addAll);
    nodes.addAll(result.getDialectNodes());
    return new ResultWithErrors<>(new DialectOutcome(result.getText(), nodes), errors);
  }

  private static ResultWithErrors<DialectOutcome> mergeResults(ResultWithErrors<DialectOutcome> result1,
                                                               ResultWithErrors<DialectOutcome> result2) {
    throw new ConcurrentModificationException("The reduction must be done sequentially");
  }

}
