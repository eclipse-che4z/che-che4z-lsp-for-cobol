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
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.model.NodeType.OPEN_STATEMENT;
import static org.eclipse.lsp.cobol.common.model.NodeType.PROGRAM;

/** File operation process */
@Slf4j
public class FileOperationProcess implements Processor<FileOperationStatementNode> {

  @Override
  public void accept(FileOperationStatementNode node, ProcessingContext ctx) {
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
    if (fileIsExternal(node)) {
      return;
    }
    checkFileOpenedBeforeOperation(
        node,
        node.getFilename().getName(),
        node.getFilename().getLocality(),
        expectedFileKind,
        ctx,
        messageTemplate);
  }

  private boolean fileIsExternal(FileOperationStatementNode node) {
    if (!node.getNearestParentByType(PROGRAM).isPresent()) return false;
    Optional<FileDescriptionNode> fileDescriptionNode =
        node.getNearestParentByType(PROGRAM)
            .get()
            .getDepthFirstStream()
            .filter(FileDescriptionNode.class::isInstance)
            .map(FileDescriptionNode.class::cast)
            .filter(fdNode -> fdNode.getName().equalsIgnoreCase(node.getFilename().getName()))
            .findFirst();
    return fileDescriptionNode.map(FileDescriptionNode::isExternal).orElse(false);
  }

  private void checkFileOpenedBeforeOperation(
      Node node,
      String filename,
      Locality errorLocality,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx,
      String messageTemplate) {
    node.getNearestParentByType(NodeType.PROGRAM)
        .ifPresent(
            pnode -> {
              boolean isFileOpened =
                  pnode
                      .getDepthFirstStream()
                      .filter(Node.hasType(OPEN_STATEMENT))
                      .map(OpenStatementNode.class::cast)
                      .anyMatch(
                          n ->
                              n.getFilename().getName().equalsIgnoreCase(filename)
                                  && expectedFileKind.contains(n.getFileOperationKind()));
              if (!isFileOpened && Objects.nonNull(errorLocality)) {
                ctx.getErrors()
                    .add(
                        SyntaxError.syntaxError()
                            .errorSource(ErrorSource.PARSING)
                            .severity(ErrorSeverity.WARNING)
                            .location(errorLocality.toOriginalLocation())
                            .messageTemplate(MessageTemplate.of(messageTemplate))
                            .build());
              }
            });
  }

  private void checkFileOpenedForWrite(
      FileOperationStatementNode node,
      List<FileOperationKind> expectedFileKind,
      ProcessingContext ctx,
      String messageTemplate) {
    List<QualifiedReferenceNode> listOfWriteVariables =
        node.getChildren().stream()
            .filter(n -> node.getFilename().getLocality().equals(n.getLocality()))
            .filter(Node.hasType(NodeType.QUALIFIED_REFERENCE_NODE))
            .map(QualifiedReferenceNode.class::cast)
            .collect(Collectors.toList());
    if (listOfWriteVariables.size() != 1) {
      return;
    }

    QualifiedReferenceNode writeVariable = listOfWriteVariables.get(0);

    writeVariable
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
      Optional<FileDescriptionNode> fileDescriptionNode =
          programNode
              .getDepthFirstStream()
              .filter(FileDescriptionNode.class::isInstance)
              .map(FileDescriptionNode.class::cast)
              .filter(
                  n ->
                      n.getChildren().stream()
                          .filter(VariableWithLevelNode.class::isInstance)
                          .map(VariableWithLevelNode.class::cast)
                          .collect(Collectors.toList())
                          .contains(defNode))
              .findFirst();

      fileDescriptionNode.ifPresent(
          node1 -> {
            if (!node1.isExternal())
              checkFileOpenedBeforeOperation(
                  node,
                  node1.getName(),
                  node.getFilename().getLocality(),
                  expectedFileKind,
                  ctx,
                  messageTemplate);
          });
    };
  }
}
