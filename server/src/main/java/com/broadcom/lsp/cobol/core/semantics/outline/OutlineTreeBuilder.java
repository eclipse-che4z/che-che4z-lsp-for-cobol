/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.core.semantics.outline;

import com.broadcom.lsp.cobol.core.model.Locality;
import com.google.common.collect.Multimap;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

import static java.util.Optional.ofNullable;

/**
 * The builder for constructing outline tree.
 *
 * <p>Uses ParserRuleContext for finding the element's parent.
 */
@Slf4j
@RequiredArgsConstructor
public class OutlineTreeBuilder {
  private Deque<VariableNode> variableNodes;
  private DocumentSymbol latestVariable;

  private final List<DocumentSymbol> rootNodes = new ArrayList<>();
  private final Map<ParserRuleContext, DocumentSymbol> nodesByContext = new HashMap<>();

  private final String documentUri;
  private final Map<Token, Locality> positionMapping;

  /**
   * Add program node to outline tree.
   *
   * @param parserRuleContext the ANTLR parser context
   */
  public void addProgram(ParserRuleContext parserRuleContext) {
    constructNode("PROGRAM", NodeType.PROGRAM, parserRuleContext)
        .ifPresent(
            outlineNode -> {
              rootNodes.add(outlineNode);
              nodesByContext.put(parserRuleContext, outlineNode);
            });
  }

  /**
   * Add a node to outline tree.
   *
   * @param name the node name
   * @param nodeType the node type
   * @param parserRuleContext the ANTLR parser context
   */
  public void addNode(String name, NodeType nodeType, ParserRuleContext parserRuleContext) {
    constructNode(name, nodeType, parserRuleContext)
        .ifPresent(outlineNode -> addNodeToParent(outlineNode, parserRuleContext));
  }

  private void addNodeToParent(DocumentSymbol outlineNode, ParserRuleContext parserRuleContext) {
    nodesByContext.put(parserRuleContext, outlineNode);
    ParserRuleContext parent = parserRuleContext.getParent();
    while (parent != null) {
      DocumentSymbol parentNode = nodesByContext.get(parent);
      if (parentNode != null) {
        parentNode.getChildren().add(outlineNode);
        return;
      }
      parent = parent.getParent();
    }
    rootNodes.add(outlineNode);
  }

  /**
   * Rename the program node in outline tree.
   *
   * @param name the new name of the program node
   * @param parserRuleContext the ANTLR parser context
   */
  public void renameProgram(String name, ParserRuleContext parserRuleContext) {
    ParserRuleContext parent = parserRuleContext.getParent();
    while (parent != null) {
      DocumentSymbol parentNode = nodesByContext.get(parent);
      if (parentNode != null && parentNode.getKind() == NodeType.PROGRAM.getSymbolKind()) {
        parentNode.setName("PROGRAM: " + name);
        return;
      }
      parent = parent.getParent();
    }
    LOG.warn("Can't rename program '{}'. Program node is not found.", name);
  }

  /**
   * Initialize internal variable state. Should be running in after new section starts.
   */
  public void initVariables() {
    variableNodes = new ArrayDeque<>();
    latestVariable = null;
  }

  /**
   * Add a variable into the outline tree.
   *
   * @param level the variable level
   * @param name the variable name
   * @param nodeType the node type
   * @param parserRuleContext the ANTLR parser context
   */
  public void addVariable(
      int level, String name, NodeType nodeType, ParserRuleContext parserRuleContext) {
    constructNode(name, nodeType, parserRuleContext)
        .ifPresent(outlineNode -> addVariable(level, outlineNode, parserRuleContext));
  }

  private void addVariable(
      int level, DocumentSymbol outlineNode, ParserRuleContext parserRuleContext) {
    while (!variableNodes.isEmpty() && variableNodes.peekLast().level >= level) {
      variableNodes.removeLast();
    }
    VariableNode groupItem = variableNodes.peekLast();
    if (level == 88) {
      if (latestVariable == null) {
        addNodeToParent(outlineNode, parserRuleContext);
      } else {
        latestVariable.getChildren().add(outlineNode);
      }
      return;
    }
    latestVariable = outlineNode;
    if (groupItem != null) {
      groupItem.outlineNode.getChildren().add(outlineNode);
    } else {
      addNodeToParent(outlineNode, parserRuleContext);
    }
    if (NodeType.STRUCT.getSymbolKind() == outlineNode.getKind()
        || NodeType.REDEFINES.getSymbolKind() == outlineNode.getKind()) {
      variableNodes.addLast(new VariableNode(level, outlineNode));
    }
  }

  /**
   * Build an outline tree view.
   *
   * @param copybookUsages copybooks that must be added into the final outline tree view
   * @return the outline tree view in LSP4J format
   */
  public List<DocumentSymbol> build(Multimap<String, Location> copybookUsages) {
    rootNodes.forEach(this::recalculateStructRange);
    for (Map.Entry<String, Location> copybook : copybookUsages.entries()) {
      String name = copybook.getKey();
      Range range = copybook.getValue().getRange();
      DocumentSymbol outlineNode =
          new DocumentSymbol(
              "COPY " + name, NodeType.COPYBOOK.getSymbolKind(), range, range, "", Collections.emptyList());
      addOutlineNodeToTree(rootNodes, outlineNode);
    }
    return rootNodes;
  }

  private void recalculateStructRange(DocumentSymbol node) {
    node.getChildren().forEach(this::recalculateStructRange);
    if (node.getKind() == NodeType.STRUCT.getSymbolKind()) {
      node.getRange()
          .setEnd(
              node.getChildren().stream()
                  .map(DocumentSymbol::getRange)
                  .map(Range::getEnd)
                  .max(
                      Comparator.comparingInt(Position::getLine)
                          .thenComparingInt(Position::getCharacter))
                  .orElse(node.getRange().getEnd()));
    }
  }

  private void addOutlineNodeToTree(List<DocumentSymbol> outlineNodes, DocumentSymbol outlineNode) {
    Optional<DocumentSymbol> document = outlineNodes.stream()
        .filter(it -> RangeUtils.isInsideRange(it, outlineNode))
        .findFirst();
    if (document.isPresent()) {
      addOutlineNodeToTree(document.get().getChildren(), outlineNode);
    } else {
      outlineNodes.add(outlineNode);
    }
  }

  private Optional<DocumentSymbol> constructNode(
      String name, NodeType type, ParserRuleContext parserRuleContext) {
    return extractRange(parserRuleContext)
        .map(
            range ->
                new DocumentSymbol(
                    name, type.getSymbolKind(), range, range, "", new ArrayList<>()));
  }

  private Optional<Range> extractRange(ParserRuleContext parserRuleContext) {
    return extractPosition(parserRuleContext.start)
        .flatMap(
            start -> extractPosition(parserRuleContext.stop).map(stop -> new Range(start, stop)));
  }

  private Optional<Position> extractPosition(Token token) {
    return ofNullable(positionMapping.get(token))
        // Filter positions only for the current document and ignore tokens from copybooks.
        .filter(locality -> locality.getUri().equals(documentUri))
        .map(locality -> locality.getRange().getStart());
  }

  @Value
  private static class VariableNode {
    int level;
    DocumentSymbol outlineNode;
  }
}
