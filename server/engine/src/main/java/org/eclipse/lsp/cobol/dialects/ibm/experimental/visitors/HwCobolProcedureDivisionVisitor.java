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

package org.eclipse.lsp.cobol.dialects.ibm.experimental.visitors;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;

import java.util.*;

import static org.eclipse.lsp.cobol.core.CobolProcedureDivisionParser.*;

/**
 * Visitor for Procedure Division ANTLR parser results
 */
@Slf4j
public class HwCobolProcedureDivisionVisitor extends CobolProcedureDivisionVisitor {
  public HwCobolProcedureDivisionVisitor(@NonNull CopybooksRepository copybooks, @NonNull CommonTokenStream tokenStream, @NonNull ExtendedDocument extendedDocument, MessageService messageService, SubroutineService subroutineService, CachingConfigurationService cachingConfigurationService, CobolProgramLayout programLayout) {
    super(copybooks, tokenStream, extendedDocument, messageService, subroutineService, cachingConfigurationService, programLayout);
  }

  @Override
  public List<Node> visitStatement(StatementContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }
}
