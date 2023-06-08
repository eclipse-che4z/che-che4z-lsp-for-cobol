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
import lombok.Data;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Visitor to collect all IDMS copybooks
 */
class IdmsDialectVisitor extends IdmsParserBaseVisitor<List<IdmsCopybookDescriptor>> {

  private static final String DEFAULT_PLACEMENT = "WORKING-STORAGE";
  private static final String SUBSCHEMA_COPY = "SUBSCHEMA-DESCRIPTION";
  private static final String MAPS_COPY = "MAPS";

  /**
   * Contains information about records statement defined in the program
   */
  @Data
  private static class IdmsRecordsDescriptor {
    private boolean recordsManualExists;
    private String recordsWithinPlacement;
    private boolean mapSectionExists;
  }

  private final DialectProcessingContext context;
  @Getter
  private final IdmsRecordsDescriptor recordsDescriptor;

  IdmsDialectVisitor(DialectProcessingContext context) {
    this.context = context;
    recordsDescriptor = new IdmsRecordsDescriptor();
    recordsDescriptor.setRecordsWithinPlacement(DEFAULT_PLACEMENT);
  }

  @Override
  public List<IdmsCopybookDescriptor> visitCopyIdmsStatement(IdmsParser.CopyIdmsStatementContext ctx) {
    return ImmutableList.of(IdmsCopybookDescriptor.from(ctx, context.getExtendedDocument().getUri()));
  }

  @Override
  protected List<IdmsCopybookDescriptor> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  public List<IdmsCopybookDescriptor> visitIdmsRecordLocationParagraph(IdmsParser.IdmsRecordLocationParagraphContext ctx) {
    if (ctx.withinClause() != null) {
      if (ctx.withinClause().withinEntry() != null && ctx.withinClause().withinEntry().children.size() > 1) {
        String placement = ctx.withinClause().withinEntry().getChild(1).getText().toUpperCase();
        recordsDescriptor.setRecordsWithinPlacement(placement);
      } else if ("MANUAL".equalsIgnoreCase(ctx.withinClause().getText())) {
        recordsDescriptor.setRecordsManualExists(true);
      }
    }
    return visitChildren(ctx);
  }

  @Override
  public List<IdmsCopybookDescriptor> visitMapSection(IdmsParser.MapSectionContext ctx) {
    recordsDescriptor.setMapSectionExists(true);
    return visitChildren(ctx);
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
  public List<IdmsCopybookDescriptor> visitStartRule(IdmsParser.StartRuleContext ctx) {
    List<IdmsCopybookDescriptor> result = visitChildren(ctx);
    result.addAll(processIdmsRecords());
    return result;
  }

  private List<IdmsCopybookDescriptor> processIdmsRecords() {
    if (recordsDescriptor.isRecordsManualExists()) {
      return ImmutableList.of();
    }
    List<IdmsCopybookDescriptor> result = new LinkedList<>();
    Pattern pattern = Pattern.compile(recordsDescriptor.getRecordsWithinPlacement() + " +SECTION", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);

    String[] lines = context.getExtendedDocument().toString().split("\\r?\\n");
    for (int i = 0; i < lines.length; i++) {
      Matcher matcher = pattern.matcher(lines[i]);
      if (matcher.find()) {
        result.add(createDescriptor(i, SUBSCHEMA_COPY, matcher.start(), matcher.end()));
        if (recordsDescriptor.isMapSectionExists()) {
          result.add(createDescriptor(i, MAPS_COPY, matcher.start(), matcher.end()));
        }
        break;
      }
    }
    return result;
  }

  private IdmsCopybookDescriptor createDescriptor(int i, String name, int start, int end) {
    IdmsCopybookDescriptor descriptor = new IdmsCopybookDescriptor();
    descriptor.setName(name);
    Locality locality = Locality.builder()
        .uri(context.getProgramDocumentUri())
        .range(new Range(new Position(i, start), new Position(i, end)))
        .build();

    descriptor.setUsage(locality);
    descriptor.setStatement(locality);
    descriptor.setInsert(true);
    return descriptor;
  }
}
