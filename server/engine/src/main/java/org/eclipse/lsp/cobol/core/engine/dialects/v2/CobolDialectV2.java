/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.Node;

/** Java Independent COBOL dialect * */
@Slf4j
public class CobolDialectV2 implements CobolDialect {
  private final String name;
  private final DialectProcessingService dialectProcessingService;

  public CobolDialectV2(String name, DialectProcessingService dialectProcessingService) {
    this.name = name;
    this.dialectProcessingService = dialectProcessingService;
  }

  @Override
  public String getName() {
    return name;
  }

  /**
   * Processing the text
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    List<SyntaxError> errorList = new ArrayList<>();
    CompletableFuture<List<Node>> future =
        CompletableFuture.supplyAsync(
            () ->
                dialectProcessingService.processDialect(
                    context.getPreprocessor(), getName(), context, errorList));
    List<Node> dialectNodes = new ArrayList<>();
    try {
      dialectNodes = future.get();
    } catch (Exception e) {
      LOG.warn("Dialect {} was stopped due to internal error {}", this.getName(), e.getMessage());
      errorList.add(DialectErrorHelper.processingError(context, getName()));
    }
    return new ResultWithErrors<>(new DialectOutcome(dialectNodes, context), errorList);
  }
}
