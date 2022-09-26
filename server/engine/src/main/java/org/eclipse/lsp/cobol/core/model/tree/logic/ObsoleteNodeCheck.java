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
package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.statements.ObsoleteNode;

/** ObsoleteNode processor */
public class ObsoleteNodeCheck implements Processor<ObsoleteNode> {
  @Override
  public void accept(ObsoleteNode node, ProcessingContext ctx) {
    ctx.getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.WARNING)
                .locality(node.getLocality())
                .messageTemplate(MessageTemplate.of("cobolParser.ObsoleteCode"))
                .build());
  }
}
