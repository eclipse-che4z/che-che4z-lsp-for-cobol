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
package org.eclipse.lsp.cobol.common.symbols;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp4j.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * A container for symbol information
 */
public class SymbolTable {
  private final Multimap<String, Symbol> symbols = ArrayListMultimap.create();
  private final Map<Symbol, List<OriginalLocation>> definitions = new HashMap<>();
  private final Map<Symbol, List<OriginalLocation>> usages = new HashMap<>();

  Map<OriginalLocation, Symbol> symbolMap = new HashMap<>();

  private final List<CodeBlockDefinitionNode> codeBlocks = new ArrayList<>();
  private final Map<String, CodeBlockReference> paragraphMap = new HashMap<>();
  private final Map<String, CodeBlockReference> sectionMap = new HashMap<>();
  private final Multimap<String, VariableNode> variables = ArrayListMultimap.create();

  public List<OriginalLocation> getDefinitions(Symbol symbol) {
    return definitions.getOrDefault(symbol, ImmutableList.of());
  }

  /**
   * Generates unique key for the program
   *
   * @param program node
   * @return string value of a generated key
   */
  public static String generateKey(ProgramNode program) {
    return program.getProgramName() + "%" + program.getLocality().getUri() + "%" + program.getLocality().getRange();
  }

  public Optional<Symbol> findSymbol(TextDocumentPositionParams checkPos) {
    for (Map.Entry<OriginalLocation, Symbol> entry : symbolMap.entrySet()) {
      if (Objects.equals(entry.getKey().getLocation().getUri(), checkPos.getTextDocument().getUri())) {
        Range symRange = entry.getKey().getLocation().getRange();
        if (isInside(symRange, checkPos.getPosition())) {
          return Optional.of(entry.getValue());
        }
      }
    }
    return Optional.empty();
  }

  private boolean isInside(Range symRange, Position position) {
    Position start = symRange.getStart();
    Position end = symRange.getEnd();
    if (start.getLine() > position.getLine()) {
      return false;
    }
    if (end.getLine() < position.getLine()) {
      return false;
    }
    if (start.getLine() == position.getLine() && start.getCharacter() > position.getCharacter()) {
        return false;

    }
    if (end.getLine() == position.getLine() && end.getCharacter() < position.getCharacter()) {
        return false;
    }
    return true;
  }

  public Multimap<String, VariableNode> getVariables() {
    return variables;
  }

  public Map<String, CodeBlockReference> getParagraphMap() {
    return paragraphMap;
  }

  public Map<String, CodeBlockReference> getSectionMap() {
    return sectionMap;
  }

  public List<CodeBlockDefinitionNode> getCodeBlocks() {
    return codeBlocks;
  }

  public void addVariable(VariableNode node) {
    String symbolName = node.getName().toUpperCase(Locale.ROOT);
    variables.put(symbolName, node);
    registerSymbol(new Symbol(symbolName, /* TODO: get root */ null, SymbolType.VARIABLE),
            node.getLocality().toOriginalLocation());
  }

  public Optional<CodeBlockReference> getSection(String name) {
    return Optional.ofNullable(paragraphMap.get(name));
  }

  public void addParagraph(ParagraphNameNode node) {
    CodeBlockReference codeBlockReference = new CodeBlockReference();
    codeBlockReference.addDefinition(node.getLocality().toLocation());
    String symbolName = node.getName();
    paragraphMap.put(symbolName, codeBlockReference);
    registerSymbol(new Symbol(symbolName,
                    extractParentSymbol(node),
                    SymbolType.PARAGRAPH),
            node.getLocality().toOriginalLocation());
  }

  // TODO move to symbol table service
  private Symbol extractParentSymbol(Node node) {
    Optional<Node> sectionNode = node.getNearestParentByType(NodeType.PROCEDURE_SECTION);
    return sectionNode.map(s -> {
      TextDocumentIdentifier textId = new TextDocumentIdentifier(s.getLocality().getUri());
      Position position = s.getLocality().getRange().getStart();
      return findSymbol(new TextDocumentPositionParams(textId, position)).orElse(null);
    }).orElse(null);
  }

  public void addSection(SectionNameNode node) {
    CodeBlockReference codeBlockReference = new CodeBlockReference();
    codeBlockReference.addDefinition(node.getLocality().toLocation());
    String symbolName = node.getName();
    paragraphMap.put(symbolName, codeBlockReference);
    registerSymbol(new Symbol(symbolName, /* TODO: get root */ null, SymbolType.SECTION),
            node.getLocality().toOriginalLocation());
  }

  private void registerSymbol(Symbol symbol, OriginalLocation originalLocation) {
    symbols.put(symbol.getName(), symbol);
    symbolMap.put(originalLocation, symbol);
  }

  public List<CodeBlockReference> findParagraphs(String name) {
    return symbols.get(name).stream().filter(s -> s.getType() == SymbolType.PARAGRAPH).map(s ->
            new CodeBlockReference(definitions.get(s), usages.get(s))
    ).collect(Collectors.toList());
  }

  public List<Location> listDefinitions(SymbolType symbolType) {
    return definitions.entrySet().stream()
            .filter(e -> e.getKey().getType() == symbolType).map(Map.Entry::getValue)
            .flatMap(Collection::stream)
            .map(OriginalLocation::getLocation)
            .collect(Collectors.toList());
  }
}
