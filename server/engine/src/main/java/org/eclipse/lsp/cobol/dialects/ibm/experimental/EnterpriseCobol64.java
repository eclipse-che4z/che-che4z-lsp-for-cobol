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

import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.dialects.TrueCobolDialect;
import org.eclipse.lsp.cobol.dialects.ibm.*;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

/**
 * HP Cobol Dialect
 */
public class EnterpriseCobol64 implements TrueCobolDialect {

  private final CleanerPreprocessor preprocessor;
  private final Pipeline<AnalysisContext> pipeline;

  public EnterpriseCobol64(GrammarPreprocessor grammarPreprocessor,
                           MessageService messageService,
                           ParseTreeListener treeListener,
                           SubroutineService subroutineService,
                           CachingConfigurationService cachingConfigurationService,
                           DialectService dialectService,
                           AstProcessor astProcessor,
                           SymbolsRepository symbolsRepository,
                           CodeLayoutStore codeLayoutStore) {
    preprocessor = new IbmTextPreprocessor(messageService, codeLayoutStore);

    pipeline = new Pipeline<>();
    pipeline.add(new IbmCleanupStage(preprocessor));
    pipeline.add(new DialectCompilerDirectiveStage(dialectService));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService, preprocessor));
    pipeline.add(new PreprocessorStage(grammarPreprocessor, preprocessor));
    pipeline.add(new ImplicitDialectProcessingStage(dialectService));
    pipeline.add(new ExperimentalParserStage(messageService, treeListener));
    pipeline.add(
        new TransformTreeStage(
            symbolsRepository,
            messageService,
            subroutineService,
            cachingConfigurationService,
            dialectService,
            astProcessor,
            codeLayoutStore));
  }

  @Override
  public Pipeline<AnalysisContext> getPipeline() {
    return pipeline;
  }

  @Override
  public CleanerPreprocessor getPreprocessor() {
    return preprocessor;
  }
}
