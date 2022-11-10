/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/NCLE
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.symbols;

import com.google.common.collect.Multimap;
import com.google.inject.Singleton;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.Context;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.TextDocumentPositionParams;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.utils.RangeUtils.findNodeByPosition;

/** This class is a repository for symbols */
@Singleton
public class SymbolsRepository {
  private volatile Map<String, SymbolTable> programSymbols;

  public SymbolsRepository(Map<String, SymbolTable> symbols) {
    programSymbols = symbols;
  }

  public SymbolsRepository() {
    programSymbols = Collections.synchronizedMap(new HashMap<>());
  }

  /**
   * Updates the symbol
   *
   * @param symbols updated symbols upon analysis
   */
  public void updateSymbols(Map<String, SymbolTable> symbols) {
    programSymbols = symbols;
  }

  /**
   * Get variable data
   *
   * @param program the program node
   * @return map of variables
   */
  public Multimap<String, VariableNode> getVariables(ProgramNode program) {
    return getSymbolTable(program).getVariables();
  }

  /**
   * Get paragraphs data
   *
   * @param program the program node
   * @return map of paragraphs
   */
  public Map<String, CodeBlockReference> getParagraphMap(ProgramNode program) {
    return getSymbolTable(program).getParagraphMap();
  }
  /**
   * Get section data
   *
   * @param program the program node
   * @return map of sections
   */
  public Map<String, CodeBlockReference> getSectionMap(ProgramNode program) {
    return getSymbolTable(program).getSectionMap();
  }

  /**
   * Find element using a position
   *
   * @param document the document to search in
   * @param position the position to check
   * @return element at specified position
   */
  public Optional<Context> findElementByPosition(
      CobolDocumentModel document, TextDocumentPositionParams position) {
    AnalysisResult result = document.getAnalysisResult();
    if (result.getRootNode() == null) {
      return Optional.empty();
    }
    Optional<Node> node =
        findNodeByPosition(
            result.getRootNode(), position.getTextDocument().getUri(), position.getPosition());
    return node.filter(Context.class::isInstance)
        .map(Context.class::cast)
        .map(this::constructElementsExcludingImplicits);
  }

  private Context constructElementsExcludingImplicits(Context ctx) {
    List<Location> definitions =
        ctx.getDefinitions().stream().filter(uriNotImplicit()).collect(Collectors.toList());
    List<Location> usages =
        ctx.getUsages().stream().filter(uriNotImplicit()).collect(Collectors.toList());
    return new SymbolsRepository.Element("", definitions, usages);
  }

  private static Predicate<Location> uriNotImplicit() {
    return i -> !ImplicitCodeUtils.isImplicit(i.getUri());
  }

  private SymbolTable getSymbolTable(ProgramNode program) {
    return programSymbols.computeIfAbsent(
        program.getProgramName() + "%" + program.getLocality().getUri(), p -> new SymbolTable());
  }

  @Value
  private static class Element implements Context {
    String name;
    List<Location> definitions;
    List<Location> usages;
  }
}
