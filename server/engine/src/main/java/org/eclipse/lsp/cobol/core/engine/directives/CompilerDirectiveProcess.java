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

package org.eclipse.lsp.cobol.core.engine.directives;

import org.eclipse.lsp.cobol.common.processor.*;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;

/** Compiler Directives processor */
@Deprecated
public class CompilerDirectiveProcess implements Processor<CompilerDirectiveNode> {
  /**
   * Set up the compiler directive context which can be used later in any stage of processing the
   * documents.
   *
   * @param compilerDirectiveNode @{@link CompilerDirectiveNode}
   * @param processingContext @{@link ProcessingContext}
   */
  @Override
  public void accept(
      CompilerDirectiveNode compilerDirectiveNode, ProcessingContext processingContext) {
    String directiveText =
            compilerDirectiveNode
            .getDirectiveText()
            .replaceAll("\\s+", "")
            .toUpperCase(Locale.ROOT);
    List<CompilerDirectiveOption> directiveOptionsList =
        Arrays.stream(CompilerDirectiveName.values())
            .map(val -> val.getDirectiveOption(directiveText))
            .filter(Optional::isPresent)
            .map(Optional::get)
            .collect(Collectors.toList());
    processingContext.getCompilerDirectiveContext().updateDirectiveOptions(directiveOptionsList);
  }
}
