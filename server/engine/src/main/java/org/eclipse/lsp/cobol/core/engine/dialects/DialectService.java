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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;

import java.util.*;
import java.util.stream.Collectors;

/** Dialect utility class */
@Singleton
public class DialectService {
  private static final CobolDialect EMPTY_DIALECT = () -> "COBOL";
  private final Map<String, CobolDialect> dialectSuppliers;

  @Inject
  public DialectService(
      DialectDiscoveryService discoveryService,
      CopybookService copybookService,
      MessageService messageService) {
    dialectSuppliers = new HashMap<>();

    List<CobolDialect> dialects = discoveryService.loadDialects(copybookService, messageService);
    dialects.forEach(dialect -> dialectSuppliers.put(dialect.getName(), dialect));
  }

  /**
   * Process the source file text with dialects
   *
   * @param dialects the list of enabled dialects
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return dialects outcome
   */
  public ResultWithErrors<DialectOutcome> process(
      List<String> dialects, DialectProcessingContext context) {
    List<CobolDialect> orderedDialects = sortDialects(dialects);
    List<SyntaxError> errors = new LinkedList<>();
    for (CobolDialect orderedDialect : orderedDialects) {
      List<SyntaxError> dialectErrors = orderedDialect.extend(context);
      dialectErrors.forEach(
          e ->
              e.getLocation().getLocation()
                  .setRange(
                      context
                          .getExtendedSource()
                          .getMainMap()
                          .mapLocation(e.getLocation().getLocation().getRange(), false)
                          .getRange()));

      errors.addAll(dialectErrors);
      context.getExtendedSource().commitTransformations();
    }
    ResultWithErrors<DialectOutcome> acc =
        new ResultWithErrors<>(new DialectOutcome(context), errors);
    for (CobolDialect orderedDialect : orderedDialects) {
      acc = processDialect(acc, orderedDialect, context);
      context.getExtendedSource().commitTransformations();
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

  /**
   * Returns dialect object by name
   * @param dialectName is a dialect name
   * @return a dialect
   */
  public CobolDialect getDialectByName(String dialectName) {
    return dialectSuppliers.getOrDefault(dialectName, EMPTY_DIALECT);
  }

  private static ResultWithErrors<DialectOutcome> processDialect(
      ResultWithErrors<DialectOutcome> previousResult,
      CobolDialect dialect,
      DialectProcessingContext context) {
    List<Node> nodes = new ArrayList<>(previousResult.getResult().getDialectNodes());

    List<SyntaxError> errors = new ArrayList<>(previousResult.getErrors());

    DialectOutcome result = dialect.processText(context).unwrap(errors::addAll);
    nodes.addAll(result.getDialectNodes());
    return new ResultWithErrors<>(new DialectOutcome(nodes, context), errors);
  }

  /**
   * Return a list of processor descriptors for provided dialects.
   *
   * @param dialects dialect names
   * @return a list of processor descriptors
   */
  public List<ProcessorDescription> getProcessors(List<String> dialects) {
    return dialects.stream()
        .filter(dialectSuppliers::containsKey)
        .map(dialectSuppliers::get)
        .flatMap(d -> d.getProcessors().stream())
        .collect(Collectors.toList());
  }
}
