/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.visitor;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp.cobol.core.CobolIdentificationDivisionParser;
import org.eclipse.lsp.cobol.core.CobolIdentificationDivisionParserBaseVisitor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * Visitor for Identification Division ANTLR parser results
 */

public class CobolIdentificationDivisionVisitor extends CobolIdentificationDivisionParserBaseVisitor<List<Node>> {
  private final ExtendedDocument extendedDocument;
  private final CopybooksRepository copybooks;
  @Getter
  private final List<SyntaxError> errors = new ArrayList<>();
  public CobolIdentificationDivisionVisitor(ExtendedDocument extendedDocument, CopybooksRepository copybooks) {
    this.extendedDocument = extendedDocument;
    this.copybooks = copybooks;
  }

  @Override
  public List<Node> visitIdentificationDivision(CobolIdentificationDivisionParser.IdentificationDivisionContext ctx) {
    // FIXME areaAWarning(ctx.getStart());
    return addTreeNode(
            ctx, location -> new DivisionNode(location, DivisionType.IDENTIFICATION_DIVISION));
  }

  @Override
  public List<Node> visitProgramIdParagraph(CobolIdentificationDivisionParser.ProgramIdParagraphContext ctx) {
    List<Node> result = new ArrayList<>();
    ofNullable(ctx.programName())
            .map(RuleContext::getText)
            .map(StringUtils::trimQuotes)
            .ifPresent(
                    name ->
                            retrieveLocality(ctx)
                                    .ifPresent(locality -> result.add(new ProgramIdNode(locality, name))));
    return result;
  }

  @Override
  public List<Node> visitRemarksParagraph(CobolIdentificationDivisionParser.RemarksParagraphContext ctx) {
    return addTreeNode(ctx, RemarksNode::new);
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    List<Node> children = visitChildren(ctx);
    return retrieveLocality(ctx)
            .map(constructNode(nodeConstructor, children))
            .orElse(children);
  }

  private Optional<Locality> retrieveLocality(ParserRuleContext ctx) {
    return retrieveRangeLocality(ctx)
            .map(extendedDocument::mapLocation)
            .map(this::locationToLocality);
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
            .range(location.getRange())
            .uri(location.getUri())
            .copybookId(copybooks.getCopybookIdByUri(location.getUri()))
            .build();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    List<Node> result = new ArrayList<>(aggregate.size() + nextResult.size());
    result.addAll(aggregate);
    result.addAll(nextResult);
    return result;
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }
}
