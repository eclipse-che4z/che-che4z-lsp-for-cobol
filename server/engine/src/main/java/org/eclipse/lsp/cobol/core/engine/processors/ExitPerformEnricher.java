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

import org.eclipse.lsp.cobol.common.model.tree.ExitPerformNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.PerformNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

/**
 * Adds an information is EXIT PERFORM statement situated inside or outside inline perform block
 */
public class ExitPerformEnricher implements Processor<ExitPerformNode> {
  @Override
  public void accept(ExitPerformNode exitPerformNode, ProcessingContext processingContext) {
      Node parent = exitPerformNode.getParent();
      while (!(parent instanceof ProgramNode)) {
          if (parent instanceof PerformNode) {
              if (((PerformNode) parent).isInline()) {
                  exitPerformNode.setInsideInlinePerform(true);
                  break;
              }
          }
          parent = parent.getParent();
      }
  }
}
