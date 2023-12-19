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
import com.google.common.collect.ImmutableSet;
import java.util.*;
import java.util.stream.Collectors;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
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
  public static Set<FoldingRange> getFoldingRange(Node rootNode, String uri) {
    if (Objects.isNull(rootNode)) return ImmutableSet.of();
    return rootNode
        .getDepthFirstStream()
        .filter(node -> node.getLocality().getUri().equals(uri))
        .filter(node -> NODES_FOR_FOLDING.contains(node.getNodeType()))
        .filter(
            node ->
                node.getLocality().getRange().getStart().getLine()
                    != node.getLocality().getRange().getEnd().getLine())
        .map(
            node ->
                new FoldingRange(
                    node.getLocality().getRange().getStart().getLine(),
                    node.getLocality().getRange().getEnd().getLine()))
        .collect(Collectors.toSet());
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
