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
import org.antlr.v4.runtime.tree.RuleNode;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;

import java.util.*;
import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.checkInterruption;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser}. It requires a semantic context with defined
 * elements to add the usages or throw a warning on an invalid definition. If there is a misspelled
 * keyword, the visitor finds it and throws a warning.
 */
@Slf4j
public class HwCobolVisitor extends CobolVisitor {

  public HwCobolVisitor(@NonNull CopybooksRepository copybooks, @NonNull CommonTokenStream tokenStream, @NonNull ExtendedDocument extendedDocument, MessageService messageService, SubroutineService subroutineService, CachingConfigurationService cachingConfigurationService, CobolProgramLayout programLayout) {
    super(copybooks, tokenStream, extendedDocument, messageService, subroutineService, cachingConfigurationService, programLayout);
  }

  @Override
  public List<Node> visitStatement(StatementContext ctx) {

    if (expectedInAriaA(ctx)) {
      areaBWarning(ctx);
    }
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitChildren(RuleNode node) {
    checkInterruption();
    if (node.getClass().getEnclosingClass() == CobolIdentificationDivisionParser.class) {
      CobolIdentificationDivisionVisitor cobolIdentificationDivisionVisitor = new CobolIdentificationDivisionVisitor(extendedDocument, copybooks);
      List<Node> nodes = cobolIdentificationDivisionVisitor.visit(node);
      errors.addAll(cobolIdentificationDivisionVisitor.getErrors());
      return nodes;
    }
    if (node.getClass().getEnclosingClass() == CobolDataDivisionParser.class) {
      CobolDataDivisionVisitor cobolDataDivisionVisitor = new CobolDataDivisionVisitor(extendedDocument, copybooks, messageService, fileControls);
      List<Node> nodes = cobolDataDivisionVisitor.visit(node);
      errors.addAll(cobolDataDivisionVisitor.getErrors());
      return nodes;
    }
    if (node.getClass().getEnclosingClass() == CobolProcedureDivisionParser.class) {
      HwCobolProcedureDivisionVisitor cobolProcedureDivisionVisitor = new HwCobolProcedureDivisionVisitor(
          copybooks,
          tokenStream,
          extendedDocument,
          messageService,
          subroutineService,
          cachingConfigurationService,
          programLayout
      );
      List<Node> nodes = cobolProcedureDivisionVisitor.visit(node);
      errors.addAll(cobolProcedureDivisionVisitor.getErrors());
      return nodes;
    }
    return super.visitChildren(node);
  }

}
