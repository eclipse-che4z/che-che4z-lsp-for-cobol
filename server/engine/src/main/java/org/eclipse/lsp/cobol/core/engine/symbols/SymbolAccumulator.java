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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureSectionNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramIdNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramSubtype;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.ParagraphNameNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNameNode;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/** Service to handle symbol information and dependencies */
public class SymbolAccumulator implements VariableAccumulator {
  private final Map<String, SymbolTable> programSymbols = new HashMap<>();

  private final Map<String, FunctionInfo> userDefinedFunctions = new HashMap<>();
  private final Map<String, FunctionInfo> implicitFunctions = getImplicitFunctions();

  /**
   * Add the variable definition to that program context.
   *
   * @param programNode the program where this variable belongs to.
   * @param node the variable definition node
   */
  public void addVariable(ProgramNode programNode, VariableNode node) {
    createOrGetSymbolTable(programNode).register(node);
  }

  /**
   * Add a paragraph defined in the program context.
   *
   * @param program - the program to register code block in
   * @param node - the paragraph node
   */
  public void registerCodeBlock(ProgramNode program, CodeBlockDefinitionNode node) {
    SymbolTable symbolTable = createOrGetSymbolTable(program);
    symbolTable.getCodeBlocks().add(node);
  }

  /**
   * Add the usage of a code block defined in this program. Returns an optional syntax error if the
   * paragraph is not defined.
   *
   * @param program the program to register block usage in
   * @param node the usage node to register
   * @return Optional error if the paragraph or section with the given name is not defined
   */
  public Optional<SyntaxError> registerCodeBlockUsage(
      ProgramNode program, CodeBlockUsageNode node) {
    SymbolTable symbolTable = createOrGetSymbolTable(program);

      List<CodeBlockDefinitionNode> definitions = new ArrayList<>();
      for (CodeBlockDefinitionNode codeBlockDefinitionNode : symbolTable.getCodeBlocks()) {
          if (filterNodes(codeBlockDefinitionNode, node)) {
              definitions.add(codeBlockDefinitionNode);
          }
      }

      if (definitions.isEmpty()) {
        return Optional.of(
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .messageTemplate(
                  MessageTemplate.of("semantics.paragraphNotDefined", node.getName()))
              .severity(ErrorSeverity.ERROR)
              .location(node.getLocality().toOriginalLocation())
              .build());
    }

    if (definitions.size() > 1) {
      // Try to resolve ambiguous reference.
      // If GO TO is in the same section as a paragraph - no errors
      String usageSectionName = getSectionName(node);

      List<CodeBlockDefinitionNode> inTheSameSection = definitions.stream()
              .filter(d -> getSectionName(d).equalsIgnoreCase(usageSectionName))
              .collect(Collectors.toList());
      if (inTheSameSection.size() == 1) {
        definitions = inTheSameSection;
      } else {
        return Optional.of(
                SyntaxError.syntaxError()
                        .errorSource(ErrorSource.PARSING)
                        .messageTemplate(
                                MessageTemplate.of("semantics.ambiguous", node.getName()))
                        .severity(ErrorSeverity.ERROR)
                        .location(node.getLocality().toOriginalLocation())
                        .build());
      }
    }

    CodeBlockDefinitionNode definition = definitions.get(0);
    definition.addUsage(node.getLocality());

    Collection<CodeBlockReference> codeBlockReferences = symbolTable.getParagraphMap().get(node.getName());
    codeBlockReferences.stream().filter(v -> v.getDefinitions().contains(definition.getDefinition().toLocation()))
            .forEach(v -> v.addUsage(node.getLocality().toLocation()));

    Optional.ofNullable(symbolTable.getSectionMap().get(node.getName()))
        .ifPresent(it -> it.addUsage(node.getLocality().toLocation()));

    return Optional.empty();
  }

  private boolean filterNodes(CodeBlockDefinitionNode definition, CodeBlockUsageNode usage) {
    if (!usage.getName().equalsIgnoreCase(definition.getName())) {
      return false;
    }

    //Filter nodes in case of section usage in the PERFORM or GO TO statements. i.e. GO TO PARAG1 OF SECTION-1.
    if (usage.getParent().getNodeType() == NodeType.PERFORM
        || usage.getParent().getNodeType() == NodeType.GO_TO
        || usage.getParent().getNodeType() == NodeType.SENTENCE) {
      int index = usage.getParent().getChildren().indexOf(usage);

      Optional<SectionNameNode> sectionNameNode = Optional.empty();
      if (index + 1 < usage.getParent().getChildren().size()) {
        sectionNameNode = Optional.ofNullable(usage.getParent().getChildren().get(index + 1))
            .filter(c -> c instanceof SectionNameNode)
            .map(SectionNameNode.class::cast);
      }
      return sectionNameNode
          .map(SectionNameNode::getName)
          .map(n -> n.equalsIgnoreCase(getSectionName(definition)))
          .orElse(true);
    }
    return true;
  }

  private String getSectionName(Node node) {
    Node parent = node.getParent();
    while (parent != null) {
      if (parent instanceof ProcedureSectionNode) {
        return ((ProcedureSectionNode) parent).getName();
      }
      node = parent;
      parent = node.getParent();
    }
    return "";
  }

  /**
   * Get the symbol table for the given program
   * @param program the program
   * @return the symbol table
   */
  public SymbolTable getSymbolTable(ProgramNode program) {
    return programSymbols.get(SymbolTable.generateKey(program));
  }
  private SymbolTable createOrGetSymbolTable(ProgramNode program) {
    String key = SymbolTable.generateKey(program);
    if (!programSymbols.containsKey(key)) {
      programSymbols.put(key, new SymbolTable(program.getProgram().map(this::createOrGetSymbolTable).orElse(null)));
    }
    return programSymbols.get(key);
  }

  /**
   * Add a section definition name node in the program context.
   *
   * @param program the program to register section in
   * @param node - the section definition node
   * @return syntax error if the code block duplicates
   */
  public Optional<SyntaxError> registerSectionNameNode(ProgramNode program, SectionNameNode node) {
    SymbolTable symbolTable = createOrGetSymbolTable(program);
    symbolTable
        .getSectionMap()
        .computeIfAbsent(node.getName(), n -> new CodeBlockReference())
        .addDefinition(node.getLocality().toLocation());
    return Optional.empty();
  }

  private Map<String, FunctionInfo> getImplicitFunctions() {
    return getAllImplicitFunctionNames().
            collect(Collectors.toMap(Function.identity(), this::createImplicitFunctionInfo));
  }

  public Stream<String> getAllImplicitFunctionNames() {
    return Stream.of(
            "ABS", "ACOS", "ANNUITY", "ASIN", "ATAN", "BIT-OF", "BIT-TO-CHAR", "BYTE-LENGTH",
            "CHAR", "COMBINED-DATETIME", "CONTENT-OF", "COS", "CURRENT-DATE", "DATE-OF-INTEGER",
            "DATE-TO-YYYYMMDD", "DAY-OF-INTEGER", "DAY-TO-YYYYDDD", "DISPLAY-OF", "E", "EXP", "EXP10",
            "FACTORIAL", "FORMATTED-CURRENT-DATE", "FORMATTED-DATE", "FORMATTED-DATETIME", "FORMATTED-TIME",
            "HEX-OF", "HEX-TO-CHAR", "INTEGER", "INTEGER-OF-DATE", "INTEGER-OF-DAY", "INTEGER-OF-FORMATTED-DATE",
            "INTEGER-PART", "LENGTH", "LOG", "LOG10", "LOWER-CASE", "MAX", "MEAN", "MEDIAN", "MIDRANGE", "MIN",
            "MOD", "NATIONAL-OF", "NUMVAL", "NUMVAL-C", "NUMVAL-F", "ORD", "ORD-MAX", "ORD-MIN", "PI",
            "PRESENT-VALUE", "RANDOM", "RANGE", "REM", "REVERSE", "SECONDS-FROM-FORMATTED-TIME",
            "SECONDS-PAST-MIDNIGHT", "SIGN", "SIN", "SQRT", "STANDARD-DEVIATION", "SUM", "TAN",
            "TEST-DATE-YYYYMMDD", "TEST-DAY-YYYYDDD", "TEST-FORMATTED-DATETIME", "TEST-NUMVAL", "TEST-NUMVAL-C",
            "TEST-NUMVAL-F", "TRIM", "ULENGTH", "UPOS", "UPPER-CASE", "USUBSTR", "USUPPLEMENTARY",
            "UUID4", "UVALID", "UWIDTH", "VARIANCE", "WHEN-COMPILED", "YEAR-TO-YYYY");
  }

  /**
   * Add function usage or definition to a program
   *
   * @param callingProgram  the program to register section in
   * @param function - the function reference node
   * @return syntax error if the function is not available
   */
  public Optional<SyntaxError> registerFunctionReferenceNode(ProgramNode callingProgram, FunctionReference function) {
    String functionName = function.getName().toUpperCase();
    Boolean isImplicit = getProgramContainingFunctionDeclaration(functionName, callingProgram)
            .map(ProgramNode::getRepository)
            .map(repo -> repo.get(functionName))
            .orElse(null);
    FunctionInfo fi = getFunctionInfo(functionName, isImplicit != null, isImplicit != null && isImplicit);
    fi.getReferences().add(function.getLocality().toLocation());
    function.setDefinitions(fi.getDefinition());
    if (fi.getProgramNode() == null || fi.getProgramNode().getOrdinal() > callingProgram.getOrdinal()) {
      return Optional.of(
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .messageTemplate(
                  MessageTemplate.of("semantics.functionExpected", functionName))
              .severity(ErrorSeverity.ERROR)
              .location(function.getLocality().toOriginalLocation())
              .build());
    }
    return Optional.empty();
  }

  /**
   * Add function definition
   *
   * @param function - the function node
   * @return syntax error if the function is redefined
   */
  public Optional<SyntaxError> registerFunctionNode(ProgramNode function) {
    assert function.getSubtype() == ProgramSubtype.Function;
    String functionName = function.getProgramName().toUpperCase();
    FunctionInfo fi = userDefinedFunctions.computeIfAbsent(functionName, (String) -> new FunctionInfo(function));
    if (fi.getProgramNode() != function) {
      return Optional.of(
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .messageTemplate(
                  MessageTemplate.of("semantics.functionRedefined", functionName))
              .severity(ErrorSeverity.WARNING)
              .location(function.getDepthFirstStream()
                  .filter(n -> n instanceof ProgramIdNode)
                  .filter(n -> ((ProgramIdNode) n).getSubtype() == ProgramSubtype.Function)
                  .findFirst()
                  .orElse(function)
                  .getLocality().toOriginalLocation())
              .build());
    }

    return Optional.empty();
  }

  /**
   * Search for a function reference
   * If a function is prefixed and not declared we try to look for user defined function
   * If not found, try to resolve as intrinsic function
   * Null if no reference is found.
   * In case a function is declared within program, try to resolve as per declaration
   * @param functionName the functionName of the function
   * @param programNode the program node
   * @param isFunctionPrefixed if the function is prefixed
   * @return the block reference or null if not found
   */
  public FunctionInfo getFunctionReference(String functionName, ProgramNode programNode, boolean isFunctionPrefixed) {
    Optional<ProgramNode> programContainingFunction = getProgramContainingFunctionDeclaration(functionName, programNode);

    if (!programContainingFunction.isPresent() && !isFunctionPrefixed) {
      return null;
    }

    String upperCaseFunctionName = functionName.toUpperCase(Locale.ROOT);
    boolean isDeclaredIntrinsic = programContainingFunction
            .map(ProgramNode::getRepository)
            .map(repo -> repo.get(upperCaseFunctionName))
            .orElse(false);

    if (isDeclaredIntrinsic) {
      return implicitFunctions.get(upperCaseFunctionName);
    }

    if (programContainingFunction.isPresent()) {
      return userDefinedFunctions.get(upperCaseFunctionName);
    }

    return userDefinedFunctions.getOrDefault(upperCaseFunctionName, implicitFunctions.get(upperCaseFunctionName));
  }

  /**
   * Search for a user defined function reference within a compilation unit
   *
   * @param functionName the name of the function
   * @return the block reference or null if not found
   */
  public FunctionInfo getUserDefinedFunctionReference(String functionName) {
    return userDefinedFunctions.get(functionName.toUpperCase());
  }

  private static Optional<ProgramNode> getProgramContainingFunctionDeclaration(String functionName, ProgramNode programNode) {
    while (!programNode.getRepository().containsKey(functionName.toUpperCase(Locale.ROOT))) {
      Optional<ProgramNode> nearestProgram = programNode.getProgram();
      if (nearestProgram.isPresent()) {
        programNode = nearestProgram.get();
        continue;
      }
      return Optional.empty();
    }
    return Optional.of(programNode);
  }

  /**
   * Add a paragraph definition name node in the program context.
   *
   * @param programNode the program to register in
   * @param node - the section definition node
   * @return syntax error if the code block duplicates
   */
  public Optional<SyntaxError> registerParagraphNameNode(ProgramNode programNode, ParagraphNameNode node) {
    SymbolTable symbolTable = createOrGetSymbolTable(programNode);
    CodeBlockReference value = new CodeBlockReference();
    value.addDefinition(node.getLocality().toLocation());
    symbolTable.getParagraphMap().put(node.getName(), value);
    return Optional.empty();
  }

  /**
   * Search for a block reference in a paragraph and then in a section map
   *
   * @param programNode the program to search block references in
   * @param name the name of the block
   * @return the block reference or null if not found
   */
  public CodeBlockReference getCodeBlockReference(ProgramNode programNode, String name) {
    SymbolTable symbolTable = createOrGetSymbolTable(programNode);
    if (!symbolTable.getParagraphMap().containsKey(name)) {
      CodeBlockReference value = symbolTable.getSectionMap().get(name);
      if (value == null) {
        return null;
      }
    }
    // FIXME
    return symbolTable.getParagraphMap().get(name).stream().findAny().orElse(null);
  }

  /**
   * Get Section locations
   *
   * @param node the section node
   * @param retrieveLocations location extract function
   * @return a list of locations
   */
  public List<Location> getSectionLocations(
      SectionNameNode node, Function<CodeBlockReference, List<Location>> retrieveLocations) {
    return node.getProgram()
        .map(this::createOrGetSymbolTable)
        .map(SymbolTable::getSectionMap)
        .map(it -> it.get(node.getName()))
        .map(retrieveLocations)
        .orElse(ImmutableList.of());
  }

  /**
   * Get Paragraph locations
   *
   * @param paragraphName               the paragraph paragraphName
   * @param retrieveLocations  location extract function
   * @param currentProgramNode the current program
   * @return a list of locations
   */
  public List<Location> getParagraphLocations(
          String paragraphName, Function<CodeBlockReference, List<Location>> retrieveLocations, ProgramNode currentProgramNode) {
    Multimap<String, CodeBlockReference> paragraphMap = createOrGetSymbolTable(currentProgramNode).getParagraphMap();
    ArrayList<Location> result = new ArrayList<>();
    for (CodeBlockReference ref: paragraphMap.get(paragraphName)) {
      result.addAll(retrieveLocations.apply(ref));
    }
    return result;
  }

  /**
   * Extract all accumulated symbols information
   *
   * @return Symbol Tables
   */
  public Map<String, SymbolTable> getProgramSymbols() {
    return Collections.unmodifiableMap(programSymbols);
  }

  private FunctionInfo createImplicitFunctionInfo(String implicitFunctionName) {
    ProgramNode implicitProgramName = new ProgramNode(Locality.builder().uri("implicit://" + implicitFunctionName).build(), ProgramSubtype.Function, 0);
    implicitProgramName.setProgramName(implicitFunctionName.toUpperCase());
    return new FunctionInfo(implicitProgramName, true);
  }

  private FunctionInfo getFunctionInfo(String functionName, boolean isDeclared, boolean isImplicit) {
    if (isDeclared) {
      return getDeclaredFunctionInfo(functionName, isImplicit);
    } else {
      return getUndeclaredFunctionInfo(functionName);
    }
  }

  private FunctionInfo getDeclaredFunctionInfo(String functionName, boolean isImplicit) {
    if (isImplicit) {
      return implicitFunctions.getOrDefault(functionName, new FunctionInfo());
    } else {
      return userDefinedFunctions.computeIfAbsent(functionName, k -> new FunctionInfo());
    }
  }

  private FunctionInfo getUndeclaredFunctionInfo(String functionName) {
    if (userDefinedFunctions.containsKey(functionName)) {
      return userDefinedFunctions.get(functionName);
    } else if (implicitFunctions.containsKey(functionName)) {
      return implicitFunctions.get(functionName);
    } else {
      return userDefinedFunctions.computeIfAbsent(functionName, k -> new FunctionInfo());
    }
  }
}
