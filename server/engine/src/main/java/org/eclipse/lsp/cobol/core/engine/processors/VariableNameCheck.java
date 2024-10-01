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
package org.eclipse.lsp.cobol.core.engine.processors;

import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

/**
 * perform semantics check on the name of a VariableNode. If a function is declared in the
 * repository, the same name can't be used as a variable name
 */
public class VariableNameCheck implements Processor<VariableWithLevelNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public VariableNameCheck(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(
      VariableWithLevelNode variableWithLevelNode, ProcessingContext processingContext) {
    if (!symbolAccumulatorService.isVariableNameAllowed(variableWithLevelNode.getName())) {
      processingContext
          .getErrors()
          .add(
              variableWithLevelNode.getError(
                  MessageTemplate.of(
                      "parsers.notAllowedVariableName", variableWithLevelNode.getName())));
    }
  }
}
