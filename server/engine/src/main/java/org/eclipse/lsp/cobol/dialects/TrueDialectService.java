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
import com.google.inject.name.Named;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.*;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.dialects.hp.HpCleanupStage;
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

  private final Map<CobolLanguageId, CleanerPreprocessor> preprocessorMap;

  @Inject
  public TrueDialectService(@Named("hpcobol") CleanerPreprocessor hpPreprocessor,
                            @Named("cobol") CleanerPreprocessor ibmPreprocessor,
                            GrammarPreprocessor grammarPreprocessor,
                            MessageService messageService,
                            ParseTreeListener treeListener,
                            SubroutineService subroutineService,
                            CachingConfigurationService cachingConfigurationService,
                            DialectService dialectService,
                            AstProcessor astProcessor,
                            SymbolsRepository symbolsRepository,
                            CodeLayoutStore codeLayoutStore) {
    preprocessorMap = new HashMap<>();
    preprocessorMap.put(CobolLanguageId.COBOL, ibmPreprocessor);
    preprocessorMap.put(CobolLanguageId.HP_COBOL, hpPreprocessor);

    pipelineMap = new HashMap<>();

    Pipeline ibmPipeline = new Pipeline();
    ibmPipeline.add(new IbmCleanupStage(ibmPreprocessor));
    ibmPipeline.add(new DialectCompilerDirectiveStage(dialectService));
    ibmPipeline.add(new CompilerDirectivesStage(messageService));
    ibmPipeline.add(new DialectProcessingStage(dialectService, ibmPreprocessor));
    ibmPipeline.add(new PreprocessorStage(grammarPreprocessor, ibmPreprocessor));
    ibmPipeline.add(new ImplicitDialectProcessingStage(dialectService));
    ibmPipeline.add(new ParserStage(messageService, treeListener));
    ibmPipeline.add(
        new TransformTreeStage(
            symbolsRepository,
            messageService,
            subroutineService,
            cachingConfigurationService,
            dialectService,
            astProcessor,
            codeLayoutStore));

    pipelineMap.put(CobolLanguageId.COBOL, ibmPipeline);

    Pipeline hpPipeline = new Pipeline();
    hpPipeline.add(new HpCleanupStage(hpPreprocessor));
    hpPipeline.add(new DialectCompilerDirectiveStage(dialectService));
    hpPipeline.add(new CompilerDirectivesStage(messageService));
    hpPipeline.add(new DialectProcessingStage(dialectService, hpPreprocessor));
    hpPipeline.add(new PreprocessorStage(grammarPreprocessor, hpPreprocessor));
    hpPipeline.add(new ImplicitDialectProcessingStage(dialectService));
    hpPipeline.add(new ParserStage(messageService, treeListener));
    hpPipeline.add(
        new TransformTreeStage(
            symbolsRepository,
            messageService,
            subroutineService,
            cachingConfigurationService,
            dialectService,
            astProcessor,
            codeLayoutStore));

    pipelineMap.put(CobolLanguageId.HP_COBOL, hpPipeline);
  }

  /**
   * Returns the pipeline for a dialect based on a given language id
   * @param languageId a language id of a dialect
   * @return the pipeline for a dialect
   */
  public Pipeline getPipeline(CobolLanguageId languageId) {
    return pipelineMap.get(languageId);
  }

  /**
   * Returns the cleanup preprocessor for a dialect, based on a given language id
   * @param languageId a language id of a dialect
   * @return the cleanup preprocessor
   */
  public CleanerPreprocessor getPreprocessor(CobolLanguageId languageId) {
    return preprocessorMap.get(languageId);
  }
}
