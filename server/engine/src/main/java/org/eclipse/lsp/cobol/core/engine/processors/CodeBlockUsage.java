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

import java.util.Optional;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

/** CodeBlockUsageNode processor */
public class CodeBlockUsage implements Processor<CodeBlockUsageNode> {
  private final SymbolAccumulator symbolAccumulator;

  public CodeBlockUsage(SymbolAccumulator symbolAccumulator) {
    this.symbolAccumulator = symbolAccumulator;
  }

  @Override
  public void accept(CodeBlockUsageNode node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
    Optional<SyntaxError> syntaxError =
        symbolAccumulator.registerCodeBlockUsage(ctx.getCurrentProgramNode(), node);
    syntaxError.ifPresent(error -> ctx.getErrors().add(error));
  }
}
