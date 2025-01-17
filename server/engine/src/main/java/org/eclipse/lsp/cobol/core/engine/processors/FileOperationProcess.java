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
import org.eclipse.lsp.cobol.common.model.FileOperationKind;
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

import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;

import static org.eclipse.lsp.cobol.common.model.NodeType.OPEN_STATEMENT;
import static org.eclipse.lsp.cobol.common.model.NodeType.QUALIFIED_REFERENCE_NODE;

/** File operation process */
@Slf4j
public class FileOperationProcess implements Processor<FileOperationStatementNode> {

  @Override
  public void accept(FileOperationStatementNode node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
    if (node.getNodeType() == NodeType.READ_STATEMENT) {
      checkFileOpenedBeforeOperation(
          node,
          ImmutableList.of(FileOperationKind.I_O, FileOperationKind.INPUT),
          ctx,
          "readFileOperation.notOpened");
    }

    if (node.getNodeType() == NodeType.WRITE_STATEMENT) {
      checkFileOpenedForWrite(
          node,
          ImmutableList.of(
              FileOperationKind.I_O, FileOperationKind.OUTPUT, FileOperationKind.EXTEND),
          ctx,
          "writeFileOperation.notOpened");
    }

    if (node.getNodeType() == NodeType.REWRITE_STATEMENT) {
      checkFileOpenedForWrite(
          node, ImmutableList.of(FileOperationKind.I_O), ctx, "rewriteFileOperation.notOpened");
    }

    if (node.getNodeType() == NodeType.DELETE_STATEMENT) {
      checkFileOpenedBeforeOperation(
          node, ImmutableList.of(FileOperationKind.I_O), ctx, "deleteFileOperation.notOpened");
    }

    if (node.getNodeType() == NodeType.START_STATEMENT) {
      checkFileOpenedBeforeOperation(
          node,
          ImmutableList.of(FileOperationKind.I_O, FileOperationKind.INPUT),
          ctx,
          "startFileOperation.notOpened");
    }
  }

  private void checkFileOpenedBeforeOperation(
      FileOperationStatementNode node,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx,
      String messageTemplate) {
    VariableNameAndLocality filename = node.getFilename();
    if (fileIsExternal(filename.getName(), ctx.getCurrentProgramNode())) {
      return;
    }
    checkFileOpenedBeforeOperation(
            filename.getName(),
            filename.getLocality(),
            expectedFileKind,
            ctx.getCurrentProgramNode(),
            messageTemplate).ifPresent(ctx.getErrors()::add);
  }

  private boolean fileIsExternal(String fileName, ProgramNode programNode) {
      return null != programNode.findFirstNodeInSubtree(n -> {
        if (n.getClass() != FileDescriptionNode.class) {
          return false;
        }
        FileDescriptionNode fdNode = (FileDescriptionNode) n;
        if (!fdNode.isExternal()) {
            return false;
        }
        return fdNode.getName().equalsIgnoreCase(fileName);
      });
  }

  private Optional<SyntaxError> checkFileOpenedBeforeOperation(
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
        if (n.getNodeType() != OPEN_STATEMENT) {
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
      FileOperationStatementNode node,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx,
      String messageTemplate) {
      QualifiedReferenceNode qrn = null;
      for (Node child : node.getChildren()) {
          if (child.getNodeType() == QUALIFIED_REFERENCE_NODE
                  && node.getFilename().getLocality().equals(child.getLocality())) {
              if (qrn != null) {
                  return;
              } else {
                  qrn = (QualifiedReferenceNode) child;
              }
          }
      }
      if (qrn == null) {
          return;
      }
      qrn
        .getVariableDefinitionNode()
        .ifPresent(
            defNode ->
                node.getNearestParentByType(NodeType.PROGRAM)
                    .ifPresent(
                        checkFileOpenedForWrite(
                            node, expectedFileKind, ctx, messageTemplate, defNode)));
  }

  private Consumer<Node> checkFileOpenedForWrite(
      FileOperationStatementNode node,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx,
      String messageTemplate,
      VariableNode defNode) {
    return programNode -> {
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
              node.getFilename().getLocality(),
              expectedFileKind, ctx.getCurrentProgramNode(), messageTemplate)
                .ifPresent(ctx.getErrors()::add);
    };
  }
}
