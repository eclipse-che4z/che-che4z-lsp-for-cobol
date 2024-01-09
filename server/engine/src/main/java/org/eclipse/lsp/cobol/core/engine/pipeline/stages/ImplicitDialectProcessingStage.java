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
package org.eclipse.lsp.cobol.core.engine.pipeline.stages;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;

/** Implicit dialects processing stage */
@RequiredArgsConstructor
public class ImplicitDialectProcessingStage implements Stage<DialectOutcome, CopybooksRepository> {
  private final DialectService dialectService;

  @Override
  public StageResult<DialectOutcome> run(
      AnalysisContext context, StageResult<CopybooksRepository> prevStageResult) {
    // Implicit dialect processing
    DialectOutcome dialectOutcome = processImplicitDialects(context, prevStageResult.getData());
    context.setCopybooksRepository(prevStageResult.getData());
    return new StageResult<>(dialectOutcome, dialectOutcome.isDialectMissed());
  }

  @Override
  public String getName() {
    return "Implicit dialects processing";
  }

  private DialectOutcome processImplicitDialects(
      AnalysisContext ctx, CopybooksRepository copybooksRepository) {
    DialectProcessingContext dialectProcessingContext =
        DialectProcessingContext.builder()
            .config(ctx.getConfig())
            .programDocumentUri(ctx.getExtendedDocument().getUri())
            .extendedDocument(ctx.getExtendedDocument())
            .build();
    dialectProcessingContext.getExtendedDocument().commitTransformations();

    // extends dialects
    Set<SyntaxError> actualErrors =
        new HashSet<>(dialectService.extendImplicitDialects(ctx, dialectProcessingContext));
    applyExtendedDialectCopybook(copybooksRepository, dialectProcessingContext);
    ArrayList<Node> extendedNodes = new ArrayList<>(dialectProcessingContext.getDialectNodes());
    dialectProcessingContext.getDialectNodes().clear();

    // process dialects
    ResultWithErrors<DialectOutcome> dialectOutcomeResultWithErrors =
        dialectService.processImplicitDialects(ctx, new ArrayList<>(), dialectProcessingContext);

    DialectOutcome dialectOutcome = dialectOutcomeResultWithErrors.getResult();
    dialectOutcome.getDialectNodes().forEach(node -> node.getLocality().toOriginalLocation());
    dialectOutcomeResultWithErrors
        .getErrors()
        .forEach(
            error -> actualErrors.add(getOriginalErrorLocation(ctx, copybooksRepository, error)));
    ctx.getAccumulatedErrors().addAll(actualErrors);

    return new DialectOutcome(
        getAllImplicitDialectNodes(dialectOutcome, extendedNodes),
        dialectOutcome.getContext(),
        dialectOutcome.isDialectMissed());
  }

  private static List<Node> getAllImplicitDialectNodes(
      DialectOutcome dialectOutcome, ArrayList<Node> extendedNodes) {
    Map<String, List<Node>> dialectProcessNodeMap =
        dialectOutcome.getDialectNodes().stream()
            .collect(Collectors.groupingBy(node -> node.getLocality().getUri()));

    extendedNodes.stream()
        .filter(CopyNode.class::isInstance)
        .map(CopyNode.class::cast)
        .forEach(
            node -> {
              String uri = node.getUri();
              if (dialectProcessNodeMap.containsKey(uri)) {
                dialectProcessNodeMap.get(uri).forEach(node::addChild);
                dialectProcessNodeMap.remove(uri);
              }
            });
    return Stream.concat(
            dialectProcessNodeMap.values().stream().flatMap(List::stream), extendedNodes.stream())
        .collect(Collectors.toList());
  }

  private static void applyExtendedDialectCopybook(
      CopybooksRepository copybooksRepository, DialectProcessingContext dialectProcessingContext) {
    dialectProcessingContext.getDialectNodes().stream()
        .filter(n -> n instanceof CopyNode)
        .map(CopyNode.class::cast)
        .filter(n -> n.getUri() != null)
        .forEach(
            n -> {
              copybooksRepository.addStatement(n.getName(), n.getDialect(), n.getLocality());
              copybooksRepository.define(
                  n.getName(), n.getDialect(), n.getNameLocation().getUri(), n.getUri());
            });
  }

  private SyntaxError getOriginalErrorLocation(
      AnalysisContext ctx, CopybooksRepository copybooksRepository, SyntaxError error) {
    Location location =
        ctx.getExtendedDocument().mapLocation(error.getLocation().getLocation().getRange());
    String copybookId = copybooksRepository.getCopybookIdByUri(location.getUri());
    OriginalLocation originalLocation = new OriginalLocation(location, copybookId);
    return error.toBuilder().location(originalLocation).build();
  }
}
