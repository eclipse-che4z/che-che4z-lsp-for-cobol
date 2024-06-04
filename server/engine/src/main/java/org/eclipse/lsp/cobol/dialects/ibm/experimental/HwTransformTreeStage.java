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
package org.eclipse.lsp.cobol.dialects.ibm.experimental;

import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.visitors.HwCobolVisitor;
import org.eclipse.lsp.cobol.dialects.ibm.ParserStageResult;
import org.eclipse.lsp.cobol.dialects.ibm.ProcessingResult;
import org.eclipse.lsp.cobol.dialects.ibm.TransformTreeStage;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutUtil;

import java.util.*;

/**
 * Transform Tree Stage
 */
public class HwTransformTreeStage extends TransformTreeStage implements Stage<AnalysisContext, ProcessingResult, ParserStageResult> {

  public HwTransformTreeStage(SymbolsRepository symbolsRepository, MessageService messageService, SubroutineService subroutineService, CachingConfigurationService cachingConfigurationService, DialectService dialectService, AstProcessor astProcessor, CodeLayoutStore layoutStore) {
    super(symbolsRepository, messageService, subroutineService, cachingConfigurationService, dialectService, astProcessor, layoutStore);
  }

  @Override
  protected List<Node> transformAST(AnalysisContext ctx,
                                    CopybooksRepository copybooksRepository, CommonTokenStream tokens,
                                    CobolParser.StartRuleContext tree) {
    CobolProgramLayout cobolProgramLayout = layoutStore.getCodeLayout()
        .map(lay -> CodeLayoutUtil.mergeLayout(ctx.getLanguageId().getLayout(), lay))
        .orElse(ctx.getLanguageId().getLayout());
    HwCobolVisitor visitor =
        new HwCobolVisitor(copybooksRepository, tokens, ctx.getExtendedDocument(),
            messageService, subroutineService, cachingConfigurationService, cobolProgramLayout);
    List<Node> syntaxTree = visitor.visit(tree);
    ctx.getAccumulatedErrors().addAll(visitor.getErrors());
    return syntaxTree;
  }

}
