/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.sql.processor;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.SqlHostVariable;

/** Process sql host variables */
public class SqlHostVariableProcessor implements Processor<SqlHostVariable> {
  private final MessageService messageService;

  public SqlHostVariableProcessor(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public void accept(SqlHostVariable sqlHostVariable, ProcessingContext processingContext) {
    Node parentNode = sqlHostVariable.getParent();
    if (parentNode instanceof CopyNode) {
      addHostVariableFromCopybook(sqlHostVariable, processingContext, parentNode);
      return;
    }
    addHostVariable(sqlHostVariable, processingContext);
  }

  private void addHostVariable(
      SqlHostVariable sqlHostVariable, ProcessingContext processingContext) {
    Optional<Node> nearestParentByType = sqlHostVariable.getNearestParentByType(NodeType.SECTION);
    if (!nearestParentByType.isPresent()) {
      addError(sqlHostVariable, processingContext);
    }
    nearestParentByType.ifPresent(
        sectionNode -> {
          SectionNode sn = (SectionNode) sectionNode;
          if (sn.getSectionType() == SectionType.WORKING_STORAGE
              || sn.getSectionType() == SectionType.LINKAGE) {
            VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
            ProgramNode programNode =
                sectionNode
                    .getProgram()
                    .orElseThrow(
                        () ->
                            new RuntimeException(
                                "Program for section " + sn.getSectionType() + " not found"));
            registerVariable(variableAccumulator, programNode, sqlHostVariable);
          } else {
            addError(sqlHostVariable, processingContext);
          }
        });
  }

  private void addHostVariableFromCopybook(
      SqlHostVariable sqlHostVariable, ProcessingContext processingContext, Node parentNode) {
    Locality localityOfHostNode = parentNode.getLocality();
    List<SectionNode> allowedSections =
        parentNode
            .getParent()
            .getDepthFirstStream()
            .filter(n -> n.getNodeType().equals(NodeType.SECTION))
            .map(SectionNode.class::cast)
            .filter(
                n ->
                    n.getSectionType().equals(SectionType.WORKING_STORAGE)
                        || n.getSectionType().equals(SectionType.LINKAGE))
            .collect(Collectors.toList());
    Optional<SectionNode> sectionNode =
        allowedSections.stream()
            .filter(
                node ->
                    RangeUtils.isInside(
                        localityOfHostNode.getRange(), node.getLocality().getRange()))
            .findFirst();
    if (sectionNode.isPresent()) {
      VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
      ProgramNode programNode =
          sectionNode
              .get()
              .getProgram()
              .orElseThrow(
                  () ->
                      new RuntimeException(
                          "Program for section "
                              + sectionNode.get().getSectionType()
                              + " not found"));
      registerVariable(variableAccumulator, programNode, sqlHostVariable);
    } else {
      addError(sqlHostVariable, processingContext);
    }
  }

  private void addError(SqlHostVariable sqlHostVariable, ProcessingContext processingContext) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.DIALECT)
                .location(sqlHostVariable.getLocality().toOriginalLocation())
                .suggestion(messageService.getMessage("db2Parser.validation.section"))
                .severity(ErrorSeverity.ERROR)
                .build());
  }

  private void registerVariable(
      VariableAccumulator variableAccumulator, ProgramNode programNode, VariableNode variable) {
    variableAccumulator.addVariableDefinition(programNode, variable);
    variable.getChildren().stream()
        .filter(VariableNode.class::isInstance)
        .map(VariableNode.class::cast)
        .forEach(c -> variableAccumulator.addVariableDefinition(programNode, c));
  }
}
