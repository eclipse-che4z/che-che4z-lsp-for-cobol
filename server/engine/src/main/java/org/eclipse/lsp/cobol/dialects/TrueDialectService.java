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
package org.eclipse.lsp.cobol.dialects;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.*;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.dialects.ibm.IbmCleanupStage;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

import java.util.HashMap;
import java.util.Map;

/**
 * Dialect Service provides available dialects pipeline for the given language od
 */
@Singleton
public class TrueDialectService {

  private final Map<CobolLanguageId, Pipeline> pipelineMap;
  @Inject
  public TrueDialectService(TextPreprocessor preprocessor,
                            GrammarPreprocessor grammarPreprocessor,
                            MessageService messageService,
                            ParseTreeListener treeListener,
                            SubroutineService subroutineService,
                            CachingConfigurationService cachingConfigurationService,
                            DialectService dialectService,
                            AstProcessor astProcessor,
                            SymbolsRepository symbolsRepository,
                            CodeLayoutStore codeLayoutStore) {
    pipelineMap = new HashMap<>();

    Pipeline pipeline = new Pipeline();
    pipeline.add(new IbmCleanupStage(preprocessor));
    pipeline.add(new DialectCompilerDirectiveStage(dialectService));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService));
    pipeline.add(new PreprocessorStage(grammarPreprocessor));
    pipeline.add(new ImplicitDialectProcessingStage(dialectService));
    pipeline.add(new ParserStage(messageService, treeListener));
    pipeline.add(
        new TransformTreeStage(
            symbolsRepository,
            messageService,
            subroutineService,
            cachingConfigurationService,
            dialectService,
            astProcessor,
            codeLayoutStore));

    pipelineMap.put(CobolLanguageId.COBOL, pipeline);
    pipelineMap.put(CobolLanguageId.HP_COBOL, pipeline);
  }

  /**
   * Returns the pipeline for a dialect based on a given language id
   * @param languageId a language id of a dialect
   * @return the pipeline for a dialect
   */
  public Pipeline getPipeline(CobolLanguageId languageId) {
    return pipelineMap.get(languageId);
  }
}
