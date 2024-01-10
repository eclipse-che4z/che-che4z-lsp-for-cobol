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
package org.eclipse.lsp.cobol.service;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.NodeType.*;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.EvaluateNode;
import org.eclipse.lsp.cobol.common.model.tree.EvaluateWhenNode;
import org.eclipse.lsp.cobol.common.model.tree.EvaluateWhenOtherNode;
import org.eclipse.lsp.cobol.common.model.tree.IfElseNode;
import org.eclipse.lsp.cobol.common.model.tree.IfNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp4j.FoldingRange;

/** FoldingRange helper */
@UtilityClass
public class DocumentServiceHelper {

  private static final ImmutableList<NodeType> NODES_FOR_FOLDING =
      ImmutableList.of(
          DIVISION,
          EVALUATE,
          FILE_CONTROL_ENTRY,
          IF,
          IF_ELSE,
          PARAGRAPH,
          PERFORM,
          PROCEDURE_SECTION,
          PROGRAM,
          SECTION,
          VARIABLE);

  /**
   * Creates folding ranges for given document symbol table
   *
   * @param rootNode root node
   * @param uri
   * @return Set of folding ranges
   */
  public static Set<FoldingRange> getFoldingRange(@NonNull Node rootNode, @NonNull String uri) {
    return rootNode
        .getDepthFirstStream()
        .filter(node -> node.getLocality().getUri().equals(uri))
        .filter(node -> NODES_FOR_FOLDING.contains(node.getNodeType()))
        .filter(
            node ->
                node.getLocality().getRange().getStart().getLine()
                    != node.getLocality().getRange().getEnd().getLine())
        .map(DocumentServiceHelper::getFoldingRange)
        .flatMap(List::stream)
        .collect(Collectors.toSet());
  }

  private static FoldingRange getFoldingRange(List<Node> node) {
    IntSummaryStatistics start =
        node.stream()
            .map(n -> n.getLocality().getRange().getStart().getLine())
            .collect(Collectors.summarizingInt(Integer::intValue));
    IntSummaryStatistics end =
        node.stream()
            .map(n -> n.getLocality().getRange().getEnd().getLine())
            .collect(Collectors.summarizingInt(Integer::intValue));
    return new FoldingRange(start.getMin(), end.getMax());
  }

  private static List<FoldingRange> getFoldingRange(IfNode node) {
    List<Node> ifThenStatements =
        node.getChildren().stream().filter(n -> !(n instanceof IfElseNode)).collect(toList());
    return ImmutableList.of(getFoldingRange(ifThenStatements));
  }

  private static List<FoldingRange> getFoldingRange(EvaluateNode node) {
    Map<Node, List<Node>> accumulator = new HashMap<>();
    Node lastEvaluateNode = null;
    for (Node child : node.getChildren()) {
      if (child instanceof EvaluateWhenNode || child instanceof EvaluateWhenOtherNode) {
        lastEvaluateNode =  child;
        accumulator.putIfAbsent(lastEvaluateNode, new ArrayList<>());
      }
      if (lastEvaluateNode == null) continue;
      accumulator.get(lastEvaluateNode).add(child);
    }
    return accumulator.values().stream()
        .map(DocumentServiceHelper::getFoldingRange)
        .collect(toList());
  }

  private static List<FoldingRange> getFoldingRange(Node node) {
    if (node instanceof IfNode) {
      return getFoldingRange((IfNode) node);
    }
    if (node instanceof EvaluateNode) {
      List<FoldingRange> foldingRange = getFoldingRange((EvaluateNode) node);
      foldingRange.add(getFoldingRangeFromNode(node));
      return foldingRange;
    }
    return ImmutableList.of(getFoldingRangeFromNode(node));
  }

  private static FoldingRange getFoldingRangeFromNode(Node node) {
    return new FoldingRange(
        node.getLocality().getRange().getStart().getLine(),
        node.getLocality().getRange().getEnd().getLine());
  }

  /**
   * Extracts copybook uris from analysis result
   *
   * @param result - analysis result
   * @return - list of copybook uris
   */
  public List<String> extractCopybookUris(AnalysisResult result) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(COPY))
        .map(CopyNode.class::cast)
        .map(CopyNode::getUri)
        .filter(def -> !StringUtils.isEmpty(def))
        .collect(toList());
  }
}
