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
public class OutlineTreeBuilder {
  private List<DocumentSymbol> rootNodes = new ArrayList<>();
  private Map<ParserRuleContext, DocumentSymbol> nodesByContext = new HashMap<>();
  private Deque<VariableNode> variableNodes;
  private DocumentSymbol latestVariable;
  private String documentUri;
  private Map<Token, Locality> positionMapping;

  public OutlineTreeBuilder(String documentUri, Map<Token, Locality> positionMapping) {
    this.documentUri = documentUri;
    this.positionMapping = positionMapping;
  }

  public void addProgram(ParserRuleContext parserRuleContext) {
    constructNode("PROGRAM", NodeType.PROGRAM, parserRuleContext)
        .ifPresent(
            outlineNode -> {
              rootNodes.add(outlineNode);
              nodesByContext.put(parserRuleContext, outlineNode);
            });
  }

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

  public void initVariables() {
    variableNodes = new ArrayDeque<>();
    latestVariable = null;
  }

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

  public List<DocumentSymbol> build(Multimap<String, Location> copybookUsages) {
    rootNodes.forEach(this::recalculateStructRange);
    for (Map.Entry<String, Location> copybook : copybookUsages.entries()) {
      String name = copybook.getKey();
      Range range = copybook.getValue().getRange();
      DocumentSymbol outlineNode =
          new DocumentSymbol(
              "COPY " + name, NodeType.COPYBOOK.getSymbolKind(), range, range, "", List.of());
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
    outlineNodes.stream()
        .filter(it -> RangeUtils.isInsideRange(it, outlineNode))
        .findFirst()
        .ifPresentOrElse(
            it -> addOutlineNodeToTree(it.getChildren(), outlineNode),
            () -> outlineNodes.add(outlineNode));
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
  private class VariableNode {
    int level;
    DocumentSymbol outlineNode;
  }
}
