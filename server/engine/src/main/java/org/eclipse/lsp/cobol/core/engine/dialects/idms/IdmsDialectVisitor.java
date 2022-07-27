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
package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.IdmsParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Visitor to collect all IDMS copybooks
 */
class IdmsDialectVisitor extends IdmsParserBaseVisitor<List<IdmsCopybookDescriptor>> {


  private final DialectProcessingContext context;

  IdmsDialectVisitor(DialectProcessingContext context) {
    this.context = context;
  }

  @Override
  public List<IdmsCopybookDescriptor> visitCopyIdmsStatement(IdmsParser.CopyIdmsStatementContext ctx) {
    return ImmutableList.of(IdmsCopybookDescriptor.from(ctx, context.getCurrentUri()));
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
}
