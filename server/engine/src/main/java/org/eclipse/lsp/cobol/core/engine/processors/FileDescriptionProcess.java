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
package org.eclipse.lsp.cobol.core.engine.processors;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;

import static org.eclipse.lsp.cobol.common.VariableConstants.FD_WITHOUT_FILE_CONTROL;

/** FileDescriptionNode processor */
public class FileDescriptionProcess implements Processor<FileDescriptionNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public FileDescriptionProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(FileDescriptionNode node, ProcessingContext ctx) {
    if (StringUtils.isBlank(node.getFileControlClause())) {
      SyntaxError error =
          node.getError(
              MessageTemplate.of(FD_WITHOUT_FILE_CONTROL, node.getName()), ErrorSeverity.ERROR);
      ctx.getErrors().add(error);
    }
    ctx.getErrors().addAll(SectionNodeProcessorHelper.processNodeWithVariableDefinitions(node));
    symbolAccumulatorService.registerVariablesInProgram(node);
  }
}
