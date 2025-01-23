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

package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FileOperationStatementNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.OpenStatementNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.model.FileOperationKind;

import java.util.List;
import java.util.Optional;

import static org.eclipse.lsp.cobol.common.model.FileOperationKind.*;

/** File operation process */
@Slf4j
public class FileOperationProcess implements Processor<FileOperationStatementNode> {
  @Override
  public void accept(FileOperationStatementNode node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
      switch (node.getNodeType()) {
        case WRITE_STATEMENT: checkFileOpenedForWrite(node, ImmutableList.of(I_O, OUTPUT, EXTEND), ctx); break;
        case REWRITE_STATEMENT: checkFileOpenedForWrite(node, ImmutableList.of(I_O), ctx); break;
        case DELETE_STATEMENT: checkFileOpenedBeforeOperation(findFileDescriptionNode(node.getFilename().getName(), ctx), node, ImmutableList.of(I_O), ctx); break;
        case READ_STATEMENT:
        case START_STATEMENT:
            checkFileOpenedBeforeOperation(findFileDescriptionNode(node.getFilename().getName(), ctx), node, ImmutableList.of(I_O, INPUT), ctx); break;
        default:
            break;
    }
  }

  private void checkFileOpenedBeforeOperation(
      FileDescriptionNode fd,
      FileOperationStatementNode node,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx) {
    VariableNameAndLocality filename = node.getFilename();
    if (fd == null) {
      reportMissingFileDescription(node, ctx);
      return;
    }
    if (fd.isExternal()) {
      return;
    }
    checkFileOpenedBeforeOperation(
            filename.getName(),
            filename.getLocality(),
            expectedFileKind,
            ctx.getCurrentProgramNode(),
            getErrorMessageTemplateId(node.getNodeType())).ifPresent(ctx.getErrors()::add);
  }

    private static Optional<SyntaxError> checkFileOpenedBeforeOperation(
      String filename,
      Locality errorLocality,
      List<FileOperationKind> expectedFileKind,
      ProgramNode programNode,
      String messageTemplate) {

    if (errorLocality == null) {
      return Optional.empty();
    }

    if (!isFileOpen(programNode, filename, expectedFileKind)) {
      return Optional.of(
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .severity(ErrorSeverity.WARNING)
              .location(errorLocality.toOriginalLocation())
              .messageTemplate(MessageTemplate.of(messageTemplate))
              .build());
    }
    return Optional.empty();
  }

  private static boolean isFileOpen(ProgramNode programNode, String filename, List<FileOperationKind> expectedFileKind) {
    return null != programNode.findFirstNodeInSubtree(n -> {
        if (n.getNodeType() != NodeType.OPEN_STATEMENT) {
          return false;
        }
        OpenStatementNode osn = (OpenStatementNode) n;
        if (!expectedFileKind.contains(osn.getFileOperationKind())) {
          return false;
        }
        return osn.getFilename().getName().equalsIgnoreCase(filename);
    });
  }

  private void checkFileOpenedForWrite(
      FileOperationStatementNode opNode,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx) {
      QualifiedReferenceNode qrn = null;
      for (Node child : opNode.getChildren()) {
          if (child.getNodeType() == NodeType.QUALIFIED_REFERENCE_NODE
                  && opNode.getFilename().getLocality().equals(child.getLocality())) {
              qrn = (QualifiedReferenceNode) child;
              break;
          }
      }
      if (qrn == null) {
          return;
      }
      qrn
        .getVariableDefinitionNode()
        .ifPresent(
            defNode ->
                Optional.ofNullable(ctx.getCurrentProgramNode()).ifPresent(program ->
                        checkFileOpenedForWrite(program, opNode, expectedFileKind, ctx, defNode)));
  }

  private static void checkFileOpenedForWrite(
          Node programNode,
          FileOperationStatementNode opNode,
          List<FileOperationKind> expectedFileKind,
          ProcessingContext ctx,
          VariableNode defNode) {

      FileDescriptionNode fileDescriptionNode = (FileDescriptionNode) programNode.findFirstNodeInSubtree(n -> {
          if (!(n instanceof FileDescriptionNode)) {
              return false;
          }
          return n.getChildren().contains(defNode);
      });
      if (fileDescriptionNode == null || fileDescriptionNode.isExternal()) {
          return;
      }
      checkFileOpenedBeforeOperation(
              fileDescriptionNode.getName(),
              opNode.getFilename().getLocality(),
              expectedFileKind, ctx.getCurrentProgramNode(), getErrorMessageTemplateId(opNode.getNodeType()))
                .ifPresent(ctx.getErrors()::add);
  }

  private static void reportMissingFileDescription(FileOperationStatementNode node, ProcessingContext ctx) {
    ctx.getErrors().add(SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .severity(ErrorSeverity.WARNING)
            .location(node.getFilename().getLocality().toOriginalLocation())
            .messageTemplate(MessageTemplate.of(getErrorMessageTemplateId(node.getNodeType())))
            .build());
  }

  private static String getErrorMessageTemplateId(NodeType nodeType) {
    switch (nodeType) {
      case READ_STATEMENT: return "readFileOperation.notOpened";
      case WRITE_STATEMENT: return "writeFileOperation.notOpened";
      case REWRITE_STATEMENT: return "rewriteFileOperation.notOpened";
      case DELETE_STATEMENT: return "deleteFileOperation.notOpened";
      case START_STATEMENT: return "startFileOperation.notOpened";
      default: return null;
    }
  }

  private static FileDescriptionNode findFileDescriptionNode(String filename, ProcessingContext ctx) {
    SymbolTable symTable = ctx.getVariableAccumulator().getSymbolTable(ctx.getCurrentProgramNode());
    while (symTable != null) {
      for (VariableNode variableNode : symTable.findVariables(filename)) {
        if (variableNode instanceof FileDescriptionNode) {
          return (FileDescriptionNode) variableNode;
        }
      }
      symTable = symTable.getParent();
    }
    return null;
  }
}
