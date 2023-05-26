/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.pipeline.stages;

import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext.Activity.PREPROCESSOR;

/**
 * Preprocessor stage
 */
@RequiredArgsConstructor
public class PreprocessorStage implements Stage<CopybooksRepository, DialectOutcome> {
  private final GrammarPreprocessor grammarPreprocessor;

  @Override
  public PipelineResult<CopybooksRepository> run(AnalysisContext context, PipelineResult<DialectOutcome> prevPipelineResult) {
    // Preprocessor (replacement, copybooks)
    CopybooksRepository copybooksRepository = context.measure(PREPROCESSOR, () -> runPreprocessor(context.getDocumentUri(), context));
    applyDialectCopybooks(copybooksRepository, prevPipelineResult.getData().getDialectNodes());

    context.setDialectNodes(prevPipelineResult.getData().getDialectNodes());
    context.setCopybooksRepository(copybooksRepository);
    return new PipelineResult<>(copybooksRepository);
  }

  private void applyDialectCopybooks(CopybooksRepository copybooksRepository, List<Node> dialectNodes) {
    dialectNodes.stream()
        .filter(n -> n instanceof CopyNode)
        .map(CopyNode.class::cast)
        .filter(n -> n.getUri() != null)
        .forEach(n -> {
          copybooksRepository.addStatement(n.getName(), n.getDialect(), n.getLocality());
          copybooksRepository.define(n.getName(), n.getDialect(), n.getNameLocation().getUri(), n.getUri());
        });
  }

  private CopybooksRepository runPreprocessor(String programDocumentUri, AnalysisContext ctx) {
    List<SyntaxError> preprocessorErrors = new ArrayList<>();
    ExtendedSource extendedSource = ctx.getExtendedSource();
    CopybooksRepository copybooks =
        grammarPreprocessor.preprocess(new PreprocessorContext(programDocumentUri, extendedSource, extendedSource.getMainMap(),
                ctx.getConfig().getCopybookConfig(), new CopybookHierarchy(), new CopybooksRepository()))
            .unwrap(preprocessorErrors::addAll);
    extendedSource.commitTransformations();

    ctx.getAccumulatedErrors().addAll(preprocessorErrors);
    return copybooks;
  }

}
