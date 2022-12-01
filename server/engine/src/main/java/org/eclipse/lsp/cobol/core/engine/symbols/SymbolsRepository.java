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

import com.google.common.annotations.VisibleForTesting;
import com.google.common.collect.Multimap;
import com.google.inject.Singleton;
import lombok.Synchronized;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.Context;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.TextDocumentPositionParams;

import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.utils.RangeUtils.findNodeByPosition;

/** This class is a repository for symbols */
@Singleton
public class SymbolsRepository {
  private final Map<String, SymbolTable> programSymbols;

  public SymbolsRepository() {
    programSymbols = Collections.synchronizedMap(new HashMap<>());
  }

  @VisibleForTesting
  public SymbolsRepository(Map<String, SymbolTable> symbols) {
    programSymbols = symbols;
  }

  /**
   * Updates the symbol
   *
   * @param symbols updated symbols upon analysis
   */
  @Synchronized
  public void updateSymbols(Map<String, SymbolTable> symbols) {
    programSymbols.putAll(symbols);
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

//  /**
//   * Remove program related symbols
//   *
//   * @param documentUri the program uri
//   */
//  public void reset(String documentUri) {
//    programSymbols.keySet().stream()
//        .filter(k -> k.endsWith("%" + documentUri))
//        .collect(Collectors.toList())
//        .forEach(programSymbols::remove);
//    programSymbols.remove(documentUri);
//  }

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

  @Synchronized
  private SymbolTable getSymbolTable(ProgramNode program) {
    return programSymbols.computeIfAbsent(
        SymbolTable.generateKey(program), p -> new SymbolTable());
  }

  @Value
  private static class Element implements Context {
    String name;
    List<Location> definitions;
    List<Location> usages;
  }
}
