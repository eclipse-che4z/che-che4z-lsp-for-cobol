/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.service.delegates.hover;

import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.annotation.Nullable;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.Describable;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.handlers.text.HoverHandler;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.*;

/** The class provides hover information for Procedures and Sections. */
public class DefinedAndUsedStructureHoverProvider implements HoverProvider {
  private static final int MAX_HOVER_LINE_COUNT = 20;
  private static final ImmutableList<NodeType> VARIABLE_DEFINITION_NODE_TYPES =
      ImmutableList.of(NodeType.VARIABLE_DEFINITION, NodeType.VARIABLE_DEFINITION_NAME);

  /**
   * @param document - document model that contains a semantic context
   * @param position - cursor position
   * @param documentGraph - workspace doc graph
   * @return
   */
  @Nullable
  @Override
  public Hover getHover(
      @Nullable CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      SourceUnitGraph documentGraph) {
    Optional<RootNode> rootNode =
        Optional.ofNullable(document)
            .map(CobolDocumentModel::getAnalysisResult)
            .map(AnalysisResult::getRootNode);

    Optional<Set<DefinedAndUsedStructure>> definedAndUsedStructures =
        rootNode
            .map(
                root1 ->
                    RangeUtils.findAllApplicableNodesByPosition(
                        root1, position.getTextDocument().getUri(), position.getPosition()))
            .map(
                nodeList ->
                    nodeList.stream()
                        .filter(DefinedAndUsedStructure.class::isInstance)
                        .map(DefinedAndUsedStructure.class::cast)
                        .collect(Collectors.toSet()))
            .filter(listOfNodes -> !listOfNodes.isEmpty());

    if (!definedAndUsedStructures.isPresent() || definedAndUsedStructures.get().isEmpty()) {
      return null;
    }

    Set<Location> defs =
        definedAndUsedStructures.get().stream()
            .map(DefinedAndUsedStructure::getDefinitions)
            .flatMap(List::stream)
            .collect(Collectors.toSet());

    Set<Node> nodeDefinitionLists =
        rootNode
            .get()
            .getDepthFirstStream()
            .filter(n -> defs.contains(n.getLocality().toLocation()))
            .filter(n -> !VARIABLE_DEFINITION_NODE_TYPES.contains(n.getNodeType()))
            .collect(Collectors.toSet());
    Stream<Hover> hoverStream = Stream.empty();
    for (DefinedAndUsedStructure definedAndUsedStructure : definedAndUsedStructures.get()) {
      hoverStream =
          Stream.concat(
              hoverStream,
              getHoverStream(
                  nodeDefinitionLists, definedAndUsedStructure, document.getLanguageId()));
    }
    if (nodeDefinitionLists.size() > 1) {
      hoverStream =
          Stream.concat(
              hoverStream,
              Stream.of(
                  new Hover(
                      new MarkupContent(
                          "text",
                          "_NOTE: multiple versions exist due to replac(e/ing) or multiple use of"
                              + " same copybook_"))));
    }
    return hoverStream.reduce(HoverHandler::mergeHovers).orElse(null);
  }

  private static Stream<Hover> getHoverStream(
      Set<Node> nodeDefinitionLists, DefinedAndUsedStructure node, String languageId) {
    if (node instanceof Describable) {
      return Stream.of(
          new Hover(
              new MarkupContent(
                  MarkupKind.MARKDOWN,
                  String.format(
                      "```%s\n%s\n```",
                      languageId.toLowerCase(), getHoverLines((Describable) node)))));
    }
    return nodeDefinitionLists.stream()
        .filter(DefinedAndUsedStructure.class::isInstance)
        .filter(n -> ((DefinedAndUsedStructure) n).getName().equals(node.getName()))
        .filter(Describable.class::isInstance)
        .map(Describable.class::cast)
        .map(
            element ->
                new Hover(
                    new MarkupContent(
                        MarkupKind.MARKDOWN,
                        String.format(
                            "```%s\n%s\n```", languageId.toLowerCase(), getHoverLines(element)))));
  }

  private static String getHoverLines(Describable describable) {
    String[] lines = describable.getFormattedDisplayString().split("\\r?\\n");
    int limit = Math.min(MAX_HOVER_LINE_COUNT, lines.length);
    StringBuilder trimmedHoverContent = new StringBuilder();
    for (int i = 0; i < limit; i++) {
      trimmedHoverContent.append(lines[i]).append("\n");
    }
    return trimmedHoverContent.toString();
  }
}
