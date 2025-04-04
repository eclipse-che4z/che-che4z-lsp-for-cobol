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
package org.eclipse.lsp.cobol.dialects.daco.processors;

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.dialects.daco.nodes.SortTableNode;

/** ObsoleteNode processor */
public class DaCoObsoleteNodeCheck implements Processor<SortTableNode> {
  @Override
  public void accept(SortTableNode node, ProcessingContext ctx) {
    ctx.getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.WARNING)
                .location(node.getLocality().toOriginalLocation())
                .messageTemplate(MessageTemplate.of("cobolParser.ObsoleteCode"))
                .build());
  }
}
