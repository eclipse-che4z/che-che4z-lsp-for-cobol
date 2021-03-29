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
package org.eclipse.lsp.cobol.core.model.tree;

import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.core.visitor.VariableDefinitionDelegate;
import org.eclipse.lsp.cobol.core.visitor.VariableUsageDelegate;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * This class represents program context in COBOL.
 */
public class ProgramNode extends Node {
  private VariableDefinitionDelegate variableDefinitionDelegate;
  private VariableUsageDelegate variableUsageDelegate;
  private String programName;

  /**
   * Use for testing.
   *
   * @param location the node location.
   */
  ProgramNode(Location location) {
    super(location, NodeType.PROGRAM);
  }

  public ProgramNode(Location location, Map<Token, Locality> positionMapping, MessageService messageService) {
    super(location, NodeType.PROGRAM);
    variableDefinitionDelegate = new VariableDefinitionDelegate(positionMapping, messageService);
    variableUsageDelegate = new VariableUsageDelegate(positionMapping, messageService);
  }

  public VariableDefinitionDelegate getVariableDefinitionDelegate() {
    return variableDefinitionDelegate;
  }

  public VariableUsageDelegate getVariableUsageDelegate() {
    return variableUsageDelegate;
  }

  public String getProgramName() {
    return programName;
  }

  public void setProgramName(String programName) {
    this.programName = programName;
  }

  @Override
  public List<SyntaxError> getErrors() {
    List<SyntaxError> errors = new ArrayList<>();
    Collection<Variable> definedVariables = variableDefinitionDelegate.finishDefinitionAnalysis().unwrap(errors::addAll);
    errors.addAll(variableUsageDelegate.updateUsageAndGenerateErrors(definedVariables));
    return errors;
  }
}
