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
package org.eclipse.lsp.cobol.implicitDialects.sql;

import com.google.common.collect.ImmutableList;
import java.util.List;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Helper class for Db2SqlVisitor
 */
@UtilityClass
class Db2SqlVisitorHelper {

  public boolean isGroupName(String name) {
    return name.contains(".");
  }

  public String[] splitNames(String name) {
    return name.split("\\.");
  }

  public Range[] splitRange(Range range, String[] names) {
    Range[] result = new Range[names.length];
    int pos = range.getStart().getCharacter();
    int line = range.getStart().getLine();
    for (int i = 0; i < names.length; i++) {
      result[i] = new Range(new Position(line, pos), new Position(line, pos + names[i].length()));
      pos += names[i].length() + 1;
    }
    return result;
  }

  public List<Node> generateGroupNodes(String name, Locality locality) {
    String[] names = splitNames(name);
    Range[] ranges = splitRange(locality.getRange(), names);

    QualifiedReferenceNode groupNode = new QualifiedReferenceNode(locality);
    for (int i = ranges.length - 1; i >= 0; i--) {
      Locality nodeLocality = locality.toBuilder().range(ranges[i]).build();
      groupNode.addChild(new VariableUsageNode(names[i], nodeLocality));
    }
    return ImmutableList.of(groupNode);
  }

  public OriginalLocation adjustLocation(
      OriginalLocation originalLocation,
      ParserRuleContext sqlCodeContext,
      DialectProcessingContext analysisContext) {
    Location location = originalLocation.getLocation();
    Range updatedRange =
        new Range(
            getStartPosition(sqlCodeContext, location),
            getEndPosition(sqlCodeContext, location));
    location.setRange(updatedRange);
    Location mapLocation = analysisContext.getExtendedDocument().mapLocation(updatedRange);
    return new OriginalLocation(mapLocation, originalLocation.getCopybookId());
  }

  /**
   * Adjust node location as per the starting rule context location
   * @param ctx
   * @param context
   * @param nodes
   */
  public void adjustNodeLocations(ParserRuleContext ctx, DialectProcessingContext context, List<? extends Node> nodes) {
    for (Node node : nodes) {
      OriginalLocation originalLocation = Db2SqlVisitorHelper.adjustLocation(
              node.getLocality().toOriginalLocation(), ctx, context);
      Locality updatedLocality =
              node.getLocality().toBuilder()
                      .range(
                              originalLocation
                                      .getLocation()
                                      .getRange())
                      .uri(originalLocation.getLocation().getUri())
                      .build();
      node.setLocality(updatedLocality);
      if (node.getChildren().isEmpty()) continue;
      adjustNodeLocations(ctx, context, node.getChildren());
    }
  }

  public OriginalLocation adjustLocation(
          OriginalLocation originalLocation,
          Db2SqlParser.SqlCodeContext sqlCodeContext) {
    Location location = originalLocation.getLocation();
    Range updatedRange =
            new Range(
                    getStartPosition(sqlCodeContext, location),
                    getEndPosition(sqlCodeContext, location));
    location.setRange(updatedRange);
    return new OriginalLocation(location, originalLocation.getCopybookId());
  }

  private static Position getStartPosition(
      ParserRuleContext sqlCodeContext, Location nodeLocation) {
    Position start;
    if (nodeLocation.getRange().getStart().getLine() == 0) {
      start =
          new Position(
              nodeLocation.getRange().getStart().getLine() + sqlCodeContext.start.getLine() - 1,
              nodeLocation.getRange().getStart().getCharacter()
                  + sqlCodeContext.start.getCharPositionInLine());
    } else {
      start =
          new Position(
              nodeLocation.getRange().getStart().getLine() + sqlCodeContext.start.getLine() - 1,
              nodeLocation.getRange().getStart().getCharacter());
    }
    return start;
  }

  private static Position getEndPosition(
      ParserRuleContext sqlCodeContext, Location nodeLocation) {
    Position end;
    if (nodeLocation.getRange().getEnd().getLine() == 0) {
      end =
          new Position(
              nodeLocation.getRange().getEnd().getLine() + sqlCodeContext.start.getLine() - 1,
              nodeLocation.getRange().getEnd().getCharacter()
                  + sqlCodeContext.start.getCharPositionInLine());
    } else {
      end =
          new Position(
              nodeLocation.getRange().getEnd().getLine() + sqlCodeContext.start.getLine() - 1,
              nodeLocation.getRange().getEnd().getCharacter());
    }
    return end;
  }
}
