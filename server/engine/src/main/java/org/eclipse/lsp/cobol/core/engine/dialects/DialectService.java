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
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;

/** Dialect utility class */
@Singleton
public class DialectService {
  private final Map<String, CobolDialect> dialectSuppliers;
  private final DialectDiscoveryService discoveryService;
  private final CopybookService copybookService;
  private final MessageService messageService;

  @Inject
  public DialectService(
      DialectDiscoveryService discoveryService,
      CopybookService copybookService,
      MessageService messageService) {
    this.dialectSuppliers = new HashMap<>();
    this.discoveryService = discoveryService;
    this.copybookService = copybookService;
    this.messageService = messageService;

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
    List<SyntaxError> errors = new LinkedList<>();
    List<CobolDialect> orderedDialects;
    try {
      orderedDialects = sortDialects(filterMissing(dialects, errors, context));
    } catch (NoSuchElementException e) {
      return handleMissingDialect(context, errors, e.getMessage());
    }
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
    ResultWithErrors<DialectOutcome> acc = new ResultWithErrors<>(new DialectOutcome(context), errors);
    for (CobolDialect orderedDialect : orderedDialects) {
      acc = processDialect(acc, orderedDialect, context);
      context.getExtendedSource().commitTransformations();
    }
    return acc;
  }

  private List<String> filterMissing(List<String> dialects, List<SyntaxError> errors, DialectProcessingContext context) {
    List<String> result = new ArrayList<>();
    for (String dialectName: dialects) {
      if (!dialectSuppliers.containsKey(dialectName)) {
        errors.add(errorMissingDialect(context, dialectName));
      } else {
        result.add(dialectName);
      }
    }
    return result;
  }

  private static SyntaxError errorMissingDialect(DialectProcessingContext context, String dialectName) {
    return SyntaxError.syntaxError()
            .messageTemplate(MessageTemplate.of("dialects.missingDialect",
                    dialectName, context.getExtendedSource().getUri()))
            .severity(ErrorSeverity.ERROR)
            .location(new OriginalLocation(new Location(context.getProgramDocumentUri(),
                    new Range(new Position(0, 0), new Position(0, 0))), null))
            .errorSource(ErrorSource.DIALECT)
            .build();
  }

  private ResultWithErrors<DialectOutcome> handleMissingDialect(DialectProcessingContext context,
                                                                List<SyntaxError> errors, String missedDialectName) {
    Optional<String> originalDialectName = findOriginalDialect(missedDialectName);
    String errorMsg = originalDialectName.map(name -> missedDialectName + " (needed for " + name + ")")
            .orElse(missedDialectName);
    errors.add(errorMissingDialect(context, errorMsg));
    return new ResultWithErrors<>(new DialectOutcome(context), errors);
  }

  private Optional<String> findOriginalDialect(String name) {
    for (CobolDialect dialect: dialectSuppliers.values()) {
      if (dialect.runBefore().contains(name)) {
        return Optional.of(dialect.getName());
      }
    }
    return Optional.empty();
  }

  private LinkedList<CobolDialect> sortDialects(List<String> dialects) {
    LinkedList<CobolDialect> orderedDialects = new LinkedList<>();
    for (String dialectName : dialects) {
      CobolDialect dialect = getDialectByName(dialectName).orElseThrow(() -> new NoSuchElementException(dialectName));
      orderedDialects.add(dialect);
    }
    return orderedDialects;
  }

  /**
   * Returns dialect object by name
   * @param dialectName is a dialect name
   * @return a dialect is it's possible
   */
  public Optional<CobolDialect> getDialectByName(String dialectName) {
    return Optional.ofNullable(dialectSuppliers.get(dialectName));
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

  /**
   * Updates available dialect list based on dialect registry
   * @param dialectRegistry is a dialect registry items list
   * @return true if list of dialects were changed or false otherwise
   */
  public boolean updateDialects(List<DialectRegistryItem> dialectRegistry) {
    AtomicBoolean changed = new AtomicBoolean(false);
    dialectRegistry.forEach(r ->
      dialectSuppliers.computeIfAbsent(r.getName(), name ->
          discoveryService.loadDialects(r.getPath(), copybookService, messageService).stream()
          .filter(d -> d.getName().equals(name))
          .findFirst()
              .map(dialect -> {
                registerDialectCodeActions(dialect);
                changed.set(true);
                return dialect;
              })
          .orElse(null))
    );
    return changed.get();
  }

  private void registerDialectCodeActions(CobolDialect dialect) {
    discoveryService.registerExecuteCommandCapabilities(
            dialect.getDialectExecuteCommandCapabilities(), dialect.getName());
    discoveryService.registerDialectCodeActionProviders(dialect.getDialectCodeActionProviders());
  }

  /**
   * Return a list of settings sections for provided dialects.
   *
   * @return a list of settings sections
   */
  public List<String> getSettingsSections() {
    return dialectSuppliers.values().stream()
        .flatMap(d -> d.getSettingsSections().stream()).collect(Collectors.toList());
  }

  /**
   * Return a list of settings sections that hold dialect folders
   *
   * @return a list of settings sections
   */
  public List<String> getWatchingFolderSettings() {
    return dialectSuppliers.values().stream()
        .flatMap(d -> d.getWatchingFolderSettings().stream()).collect(Collectors.toList());
  }
}
