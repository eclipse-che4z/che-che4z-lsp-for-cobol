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
import com.google.common.collect.ImmutableMultimap;
import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoMaidProcessor;
import org.eclipse.lsp.cobol.core.engine.dialects.cicsTranslator.CICSTranslatorDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;

import java.util.*;

/**
 * Dialect utility class
 */
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

    dialect = new DaCoDialect(messageService, new DaCoMaidProcessor(copybookService, treeListener, messageService));
    dialectSuppliers.put(dialect.getName(), dialect);

    dialect = new CICSTranslatorDialect(messageService);
    dialectSuppliers.put(dialect.getName(), dialect);
  }

  /**
   * Process the source file text with dialects
   *
   * @param dialects the list of enabled dialects
   * @param context  is a DialectProcessingContext class with all needed data for dialect processing
   * @return dialects outcome
   */
  public ResultWithErrors<DialectOutcome> process(List<String> dialects, DialectProcessingContext context) {
    LinkedList<CobolDialect> orderedDialects = sortDialects(dialects);
    for (CobolDialect orderedDialect : orderedDialects) {
      orderedDialect.extend(context);
    }
    ResultWithErrors<DialectOutcome> acc = ResultWithErrors.of(
            new DialectOutcome(ImmutableList.of(), ImmutableMultimap.of(), context));
    for (CobolDialect orderedDialect : orderedDialects) {
      acc = processDialect(acc, orderedDialect, context);
    }
    return acc;
  }

  private LinkedList<CobolDialect> sortDialects(List<String> dialects) {
    LinkedList<CobolDialect> orderedDialects = new LinkedList<>();
    LinkedList<String> dialectsQueue = new LinkedList<>(dialects);
    while (!dialectsQueue.isEmpty()) {
      CobolDialect dialect = getDialectByName(dialectsQueue.pop());
      if (dialect.runBefore().isEmpty()) {
        orderedDialects.add(dialect);
      } else {
        for (String name : dialect.runBefore()) {
          CobolDialect d = getDialectByName(name);
          int index = orderedDialects.indexOf(d);
          if (index >= 0) {
            orderedDialects.add(index, dialect);
          } else {
            if (!dialectsQueue.contains(d.getName())) {
              dialectsQueue.add(d.getName());
            }
            dialectsQueue.add(dialect.getName());
          }
        }
      }
    }
    return orderedDialects;
  }

  private CobolDialect getDialectByName(String dialectName) {
    return dialectSuppliers.getOrDefault(dialectName, EMPTY_DIALECT);
  }

  private static ResultWithErrors<DialectOutcome> processDialect(ResultWithErrors<DialectOutcome> previousResult,
                                                                 CobolDialect dialect,
                                                                 DialectProcessingContext context) {
    List<Node> nodes = new ArrayList<>(previousResult.getResult().getDialectNodes());
    Multimap<String, Pair<String, String>> implicitCode = LinkedListMultimap.create(previousResult.getResult().getImplicitCode());

    List<SyntaxError> errors = new ArrayList<>(previousResult.getErrors());

    DialectOutcome result = dialect.processText(context).unwrap(errors::addAll);
    nodes.addAll(result.getDialectNodes());
    implicitCode.putAll(result.getImplicitCode());
    return new ResultWithErrors<>(new DialectOutcome(nodes, implicitCode, context), errors);
  }

}
