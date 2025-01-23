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
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.processors.utils.SectionNodeProcessorHelper;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;

import java.util.List;

import static org.eclipse.lsp.cobol.common.VariableConstants.FD_WITHOUT_FILE_CONTROL;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

/** FileDescriptionNode processor */
public class FileDescriptionProcess implements Processor<FileDescriptionNode> {
  private final SymbolAccumulator symbolAccumulator;

  public FileDescriptionProcess(SymbolAccumulator symbolAccumulator) {
    this.symbolAccumulator = symbolAccumulator;
  }

  @Override
  public void accept(FileDescriptionNode fileDescriptionNode, ProcessingContext ctx) {
    if (StringUtils.isBlank(fileDescriptionNode.getFileControlClause())) {
      SyntaxError error =
          fileDescriptionNode.getError(
              MessageTemplate.of(FD_WITHOUT_FILE_CONTROL, fileDescriptionNode.getName()), ErrorSeverity.ERROR);
      ctx.getErrors().add(error);
    }
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
    ctx.getErrors().addAll(SectionNodeProcessorHelper.processNodeWithVariableDefinitions(fileDescriptionNode,
            symbolAccumulator,
            ctx.getCurrentProgramNode()));
  }
}
