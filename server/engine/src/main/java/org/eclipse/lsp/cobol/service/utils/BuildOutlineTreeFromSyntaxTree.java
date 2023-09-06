/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.service.utils;

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.NodeSymbolType;
import org.eclipse.lsp4j.DocumentSymbol;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/** This class is used for converting nodes from Syntax tree to outline tree */
@UtilityClass
public class BuildOutlineTreeFromSyntaxTree {
  /**
   * Converts the node from Syntax Tree to outline tree based on NodeType
   *
   * @param node a rootNode
   * @param uri uri of the node
   * @return the outline tree view
   */
  public List<DocumentSymbol> convert(Node node, String uri) {
    List<DocumentSymbol> childrenSymbols =
        node.getChildren().stream()
            .map(it -> convert(it, uri))
            .flatMap(List::stream)
            .collect(Collectors.toList());
    Optional<DocumentSymbol> convertedNode = convertNode(node, uri);
    if (convertedNode.isPresent()) {
      DocumentSymbol resultNode = convertedNode.get();
      resultNode.setChildren(childrenSymbols);
      return ImmutableList.of(resultNode);
    }

    return childrenSymbols;
  }

  private Optional<DocumentSymbol> convertNode(Node node, String uri) {
    if (!node.getLocality().getUri().equals(uri)) {
      return Optional.empty();
    }
    switch (node.getNodeType()) {
      case PROGRAM:
        return Optional.of(convertProgram((ProgramNode) node));
      case PROGRAM_ID:
        return Optional.of(convertProgramId((ProgramIdNode) node));
      case DIVISION:
        return Optional.of(convertDivision((DivisionNode) node));
      case FILE_CONTROL_ENTRY:
        return Optional.of(convertFileEntry((FileEntryNode) node));
      case PROCEDURE_SECTION:
        return Optional.of(convertProcedureSection((ProcedureSectionNode) node));
      case PARAGRAPH:
        return Optional.of(convertParagraph((ParagraphNode) node));
      case SECTION:
        return Optional.of(convertSection((SectionNode) node));
      case VARIABLE:
        return Optional.of(covertVariable((VariableNode) node));
      case COPY:
        return Optional.of(covertCopyNode((CopyNode) node));
      default:
        return Optional.empty();
    }
  }

  private DocumentSymbol covertCopyNode(CopyNode node) {
    return createDocumentSymbol("COPY " + node.getName(), NodeSymbolType.COPYBOOK, node);
  }

  private DocumentSymbol convertSection(SectionNode node) {
    return createDocumentSymbol(
        node.getSectionType().getType() + " SECTION", NodeSymbolType.SECTION, node);
  }

  private DocumentSymbol convertFileEntry(FileEntryNode node) {
    node.getLocality().getUri();
    return createDocumentSymbol(node.getFileName(), NodeSymbolType.FILE, node);
  }

  private DocumentSymbol convertProcedureSection(ProcedureSectionNode node) {
    return createDocumentSymbol(node.getName(), NodeSymbolType.PROCEDURE_SECTION, node);
  }

  private DocumentSymbol convertParagraph(ParagraphNode node) {
    return createDocumentSymbol(node.getName(), NodeSymbolType.PROGRAM_ID, node);
  }

  private DocumentSymbol convertProgramId(ProgramIdNode node) {
    return createDocumentSymbol("PROGRAM-ID " + node.getProgramId(), NodeSymbolType.PROGRAM_ID, node);
  }

  private DocumentSymbol convertDivision(DivisionNode node) {
    return createDocumentSymbol(node.getDivisionType().getDivName(), NodeSymbolType.DIVISION, node);
  }

  private DocumentSymbol covertVariable(VariableNode node) {
    switch (node.getVariableType()) {
      case GROUP_ITEM:
      case MULTI_TABLE_DATA_NAME:
        return createDocumentSymbol(node.getName(), NodeSymbolType.STRUCT, node);
      case FD:
        return createDocumentSymbol(node.getName(), NodeSymbolType.FILE, node);
      case CONDITION_DATA_NAME:
        return createDocumentSymbol(node.getName(), NodeSymbolType.FIELD_88, node);
      default:
        return createDocumentSymbol(node.getName(), NodeSymbolType.FIELD, node);
    }
  }

  private DocumentSymbol convertProgram(ProgramNode node) {
    String programName = "PROGRAM";
    if (node.getProgramName() != null) programName += ": " + node.getProgramName();
    return createDocumentSymbol(programName, NodeSymbolType.PROGRAM, node);
  }

  private DocumentSymbol createDocumentSymbol(String name, NodeSymbolType type, Node treeNode) {
    return new DocumentSymbol(
        name,
        type.getSymbolKind(),
        treeNode.getLocality().getRange(),
        treeNode.getLocality().getRange(),
        "",
        ImmutableList.of());
  }
}
