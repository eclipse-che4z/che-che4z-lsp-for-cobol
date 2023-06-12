/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;

/**
 * Visitor to collect all IDMS copybooks
 */
class IdmsCopyVisitor extends IdmsCopyParserBaseVisitor<List<IdmsCopybookDescriptor>> {
  private final ExtendedDocument extendedDocument;
  @Getter
  private final List<Pair<Range, Integer>> variableLevels = new LinkedList<>();

  IdmsCopyVisitor(ExtendedDocument extendedDocument) {
    this.extendedDocument = extendedDocument;
  }

  @Override
  public List<IdmsCopybookDescriptor> visitCopyIdmsStatement(
          IdmsCopyParser.CopyIdmsStatementContext ctx) {
    return ImmutableList.of(
            IdmsCopybookDescriptor.from(ctx, extendedDocument.getUri()));
  }

  @Override
  protected List<IdmsCopybookDescriptor> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  protected List<IdmsCopybookDescriptor> aggregateResult(
          List<IdmsCopybookDescriptor> aggregate, List<IdmsCopybookDescriptor> nextResult) {
    List<IdmsCopybookDescriptor> result =
            new ArrayList<>(aggregate.size() + nextResult.size());
    result.addAll(aggregate);
    result.addAll(nextResult);
    return result;
  }

  @Override
  public List<IdmsCopybookDescriptor> visitDataDescriptionEntryFormat1(IdmsCopyParser.DataDescriptionEntryFormat1Context ctx) {
    variableLevels.add(Pair.of(getLevelLocality(ctx.levelNumber().LEVEL_NUMBER()).getRange(), VisitorHelper.getLevel(ctx.levelNumber().LEVEL_NUMBER())));
    return visitChildren(ctx);
  }

  @Override
  public List<IdmsCopybookDescriptor> visitDataDescriptionEntryFormat2(IdmsCopyParser.DataDescriptionEntryFormat2Context ctx) {
    variableLevels.add(Pair.of(getLevelLocality(ctx.LEVEL_NUMBER_66()).getRange(), LEVEL_66));
    return visitChildren(ctx);
  }

  @Override
  public List<IdmsCopybookDescriptor> visitDataDescriptionEntryFormat1Level77(
      IdmsCopyParser.DataDescriptionEntryFormat1Level77Context ctx) {
    variableLevels.add(Pair.of(getLevelLocality(ctx.LEVEL_NUMBER_77()).getRange(), LEVEL_77));
    return visitChildren(ctx);
  }

  @Override
  public List<IdmsCopybookDescriptor> visitDataDescriptionEntryFormat3(IdmsCopyParser.DataDescriptionEntryFormat3Context ctx) {
    ofNullable(ctx.dataValueClause())
        .map(IdmsCopyParser.DataValueClauseContext::valueIsToken)
        .ifPresent(t -> variableLevels.add(Pair.of(getLevelLocality(ctx.LEVEL_NUMBER_88()).getRange(), LEVEL_88)));
    return visitChildren(ctx);
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    return Locality.builder()
        .range(new Range(
            new Position(terminalNode.getSymbol().getLine() - 1, terminalNode.getSymbol().getCharPositionInLine()),
            new Position(terminalNode.getSymbol().getLine() - 1, terminalNode.getSymbol().getCharPositionInLine() + terminalNode.getText().length())))
        .build();
  }

}
