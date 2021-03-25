/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine;

import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.core.visitor.VariableDefinitionDelegate;
import org.eclipse.lsp.cobol.core.visitor.VariableUsageDelegate;

import java.util.*;
import java.util.stream.Collectors;

/**
 * This class is responsible for processing the syntax tree.
 */
public class SyntaxTreeEngine {
  private final Node rootNode;
  private final Map<Token, Locality> positionMapping;
  private final MessageService messageService;

  public SyntaxTreeEngine(Node rootNode, Map<Token, Locality> positionMapping, MessageService messageService) {
    this.rootNode = rootNode;
    this.positionMapping = positionMapping;
    this.messageService = messageService;
  }

  /**
   * Run the process under the syntax tree.
   *
   * @return the list of syntax errors.
   */
  public List<SyntaxError> processTree() {
    return rootNode.getDepthFirstStream()
        .filter(it -> it.getNodeType() == NodeType.PROGRAM)
        .map(it -> processProgram((ProgramNode) it))
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  private List<SyntaxError> processProgram(ProgramNode programNode) {
    VariableDefinitionDelegate variablesDelegate = new VariableDefinitionDelegate(positionMapping, messageService);
    VariableUsageDelegate variableUsageDelegate = new VariableUsageDelegate(positionMapping, messageService);
    programNode.getDepthFirstStream()
        .forEach(node -> {
          if (node.getNodeType() == NodeType.SECTION) {
            variablesDelegate.notifySectionChanged();
          }
          if (node.getNodeType() == NodeType.ANTLR_VARIABLE_DEFINITION) {
            AntlrVariableDefinitionNode definitionNode = (AntlrVariableDefinitionNode) node;
            Optional.ofNullable(definitionNode.getFormat1Context()).ifPresent(variablesDelegate::defineVariable);
            Optional.ofNullable(definitionNode.getFormat1Level77Context()).ifPresent(variablesDelegate::defineVariable);
            Optional.ofNullable(definitionNode.getFormat2Context()).ifPresent(variablesDelegate::defineVariable);
            Optional.ofNullable(definitionNode.getFormat3Context()).ifPresent(variablesDelegate::defineVariable);
            Optional.ofNullable(definitionNode.getSwitchNameClauseContext()).ifPresent(variablesDelegate::defineVariable);
          }
        });
    programNode.getDepthFirstStream()
        .filter(it -> it.getNodeType() == NodeType.VARIABLE_USAGE)
        .forEach(node -> {
          VariableUsageNode variableUsage = (VariableUsageNode) node;
          switch (variableUsage.getVariableUsageType()) {
            case DATA_NAME:
              variableUsageDelegate.handleDataName(variableUsage.getDataName(), variableUsage.getLocality(),
                  variableUsage.getDataNameFormat1Context());
              break;
            case TABLE_CALL:
              variableUsageDelegate.handleTableCall(variableUsage.getDataName(), variableUsage.getLocality());
              break;
            case CONDITION_CALL:
              variableUsageDelegate.handleConditionCall(variableUsage.getDataName(), variableUsage.getLocality(),
                  variableUsage.getNameReferenceContext());
              break;
            default:
              // No other variable usage types exist, this is unreachable, but just in case.
              break;
          }
        });
    List<SyntaxError> errors = new ArrayList<>();
    Collection<Variable> definedVariables = variablesDelegate.finishDefinitionAnalysis().unwrap(errors::addAll);
    errors.addAll(variableUsageDelegate.updateUsageAndGenerateErrors(definedVariables));
    return errors;
  }
}
