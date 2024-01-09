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

import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/**
 * Preprocessor stage
 */
@RequiredArgsConstructor
public class PreprocessorStage implements Stage<CopybooksRepository, DialectOutcome> {
  private final GrammarPreprocessor grammarPreprocessor;

  @Override
  public StageResult<CopybooksRepository> run(AnalysisContext context, StageResult<DialectOutcome> prevStageResult) {
    // Preprocessor (replacement, copybooks)
    CopybooksRepository copybooksRepository = runPreprocessor(context.getExtendedDocument().getUri(), context);
    applyDialectCopybooks(copybooksRepository, prevStageResult.getData().getDialectNodes());

    context.setDialectNodes(prevStageResult.getData().getDialectNodes());
    context.setCopybooksRepository(copybooksRepository);
    return new StageResult<>(copybooksRepository);
  }

  @Override
  public String getName() {
    return "Preprocessing";
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
    ExtendedDocument extendedDocument = ctx.getExtendedDocument();
    CopybooksRepository copybooks =
        grammarPreprocessor.preprocess(new PreprocessorContext(programDocumentUri, extendedDocument,
                ctx.getConfig().getCopybookProcessingMode(), new CopybookHierarchy(), new CopybooksRepository()))
            .unwrap(preprocessorErrors::addAll);
    extendedDocument.commitTransformations();

    ctx.getAccumulatedErrors().addAll(preprocessorErrors);
    return copybooks;
  }

}
