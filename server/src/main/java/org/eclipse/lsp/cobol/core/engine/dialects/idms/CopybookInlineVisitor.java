package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.IdmsParserBaseVisitor;
import org.eclipse.lsp.cobol.core.model.ExtendedDocumentHierarchy;

import java.util.ArrayList;
import java.util.List;

class CopybookInlineVisitor extends IdmsParserBaseVisitor<List<IdmsCopybookDescriptor>> {
  private final ExtendedDocumentHierarchy extendedDocumentHierarchy;

  public CopybookInlineVisitor(ExtendedDocumentHierarchy extendedDocumentHierarchy) {
    this.extendedDocumentHierarchy = extendedDocumentHierarchy;
  }

  @Override
  public List<IdmsCopybookDescriptor> visitCopyIdmsStatement(
          IdmsParser.CopyIdmsStatementContext ctx) {
    return ImmutableList.of(
            IdmsCopybookDescriptor.from(ctx, extendedDocumentHierarchy.getUri()));
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
