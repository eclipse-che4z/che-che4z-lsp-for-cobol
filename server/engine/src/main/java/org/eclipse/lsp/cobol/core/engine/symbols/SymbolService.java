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
package org.eclipse.lsp.cobol.core.engine.symbols;

import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.TextDocumentPositionParams;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.core.preprocessor.delegates.util.RangeUtils.findNodeByPosition;

/**
 * Service to handle symbol information and dependencies
 */
public class SymbolService {
  /**
   * Add the variable definition to that program context.
   *
   * @param programNode the program where this variable belongs to.
   * @param node the variable definition node
   */
  public static void addVariableDefinition(ProgramNode programNode, VariableNode node) {
    programNode.getVariables().put(node.getName(), node);
  }
  /**
   * Find element using a position
   *
   * @param document the document to search in
   * @param position the position to check
   * @return element at specified position
   */
  public Context findElementByPosition(
      CobolDocumentModel document, TextDocumentPositionParams position) {
    AnalysisResult result = document.getAnalysisResult();
    return Optional.ofNullable(result.getRootNode())
        .flatMap(
            rootNode ->
                findNodeByPosition(
                    rootNode, position.getTextDocument().getUri(), position.getPosition()))
        .filter(node -> node instanceof Context)
        .map(Context.class::cast)
        .map(this::constructElementsExcludingImplicits)
        .orElseGet(() -> new Element("", Collections.emptyList(), Collections.emptyList()));
  }

  private Context constructElementsExcludingImplicits(Context ctx) {
    List<Location> definitions =
        ctx.getDefinitions().stream().filter(uriNotImplicit()).collect(Collectors.toList());
    List<Location> usages =
        ctx.getUsages().stream().filter(uriNotImplicit()).collect(Collectors.toList());
    return new Element("", definitions, usages);
  }

  private static Predicate<Location> uriNotImplicit() {
    return i -> !ImplicitCodeUtils.isImplicit(i.getUri());
  }

  /**
   * * Register variable definitions into nearest ProgramNode
   *
   * @param node the node with VariableDefinitionNodes
   */
  public void registerVariablesInProgram(Node node) {
    // The variable can have nested variable definitions (like IndexItemNode), we need to
    // collect them
    List<VariableNode> variables =
        node.getChildren().stream()
            .flatMap(Node::getDepthFirstStream)
            .filter(hasType(NodeType.VARIABLE))
            .map(VariableNode.class::cast)
            .collect(Collectors.toList());
    node.getProgram()
        .ifPresent(programNode -> variables.forEach(v -> addVariableDefinition(programNode, v)));
  }

  @Value
  private static class Element implements Context {
    String name;
    List<Location> definitions;
    List<Location> usages;
  }
}
