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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Java Independent COBOL dialect * */
@Slf4j
class CobolDialectV2 implements CobolDialect {
  private static final int DIALECT_TIMEOUT = 20;

  private final String name;
  private final DialectProcessingManager dialectManager;

  CobolDialectV2(String name, DialectProcessingManager dialectManager) {
    this.name = name;
    this.dialectManager = dialectManager;
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
        CompletableFuture.supplyAsync(() -> dialectManager.processDialect(getName(), context, errorList));
    boolean processed = true;
    List<Node> dialectNodes = new ArrayList<>();
    try {
      dialectNodes = future.get(DIALECT_TIMEOUT, TimeUnit.SECONDS);
    } catch (Exception e) {
      LOG.warn("Error during dialect processing: {}", e.getMessage());
      processed = false;
    }
    if (!processed) {
      LOG.warn("Dialect {} stopped due to error or timeout", this.getName());
      errorList.add(errorDialectTimeout(context, getName()));
    }
    return new ResultWithErrors<>(new DialectOutcome(dialectNodes, context), errorList);
  }

  private static SyntaxError errorDialectTimeout(
      DialectProcessingContext context, String dialectName) {
    return SyntaxError.syntaxError()
        .messageTemplate(
            MessageTemplate.of(
                "dialects.processingTimeout", dialectName, context.getExtendedDocument().getUri()))
        .severity(ErrorSeverity.ERROR)
        .location(
            new OriginalLocation(
                new Location(
                    context.getProgramDocumentUri(),
                    new Range(new Position(0, 0), new Position(0, 0))),
                null))
        .errorSource(ErrorSource.DIALECT)
        .build();
  }
}
