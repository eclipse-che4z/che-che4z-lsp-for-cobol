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
package org.eclipse.lsp.cobol.core.model.tree.statements;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.ObsoleteNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.common.model.tree.RemarksNode;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.core.engine.processors.ObsoleteNodeCheck;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Test {@link ObsoleteNode} */
class ObsoleteNodeTest {
  @Test
  public void testObsoleteNodeWarning() {
    Locality locality = Locality.builder().build();
    RootNode rootNode = new RootNode(locality);
    RemarksNode remarksNode = new RemarksNode(locality);
    AstProcessor astProcessor = new AstProcessor();
    List<SyntaxError> errors = new ArrayList<>();
    ProcessingContext ctx = new ProcessingContext(errors, new SymbolAccumulatorService(), ImmutableMap.of());
    ctx.register(
        new ProcessorDescription(
            ObsoleteNode.class, ProcessingPhase.TRANSFORMATION, new ObsoleteNodeCheck()));
    rootNode.addChild(remarksNode);
    astProcessor.process(ProcessingPhase.TRANSFORMATION, rootNode, ctx);

    assertEquals(
        errors,
        ImmutableList.of(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.WARNING)
                .location(locality.toOriginalLocation())
                .messageTemplate(MessageTemplate.of("cobolParser.ObsoleteCode"))
                .build()));
  }
}
