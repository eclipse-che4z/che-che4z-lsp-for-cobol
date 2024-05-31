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
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.TrueDialectService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.dialects.hp.HpTrueCobolDialect;
import org.eclipse.lsp.cobol.dialects.ibm.*;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.EnterpriseCobol64;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Dialect Service provides available dialects pipeline for the given language od
 */
@Singleton
public class TrueDialectServiceImpl implements TrueDialectService<AnalysisContext> {

  private final Map<CobolLanguageId, TrueCobolDialect> dialects;

  @Inject
  public TrueDialectServiceImpl(
                            GrammarPreprocessor grammarPreprocessor,
                            MessageService messageService,
                            ParseTreeListener treeListener,
                            SubroutineService subroutineService,
                            CachingConfigurationService cachingConfigurationService,
                            DialectService dialectService,
                            AstProcessor astProcessor,
                            SymbolsRepository symbolsRepository,
                            CodeLayoutStore codeLayoutStore,
                            CopybookService copybookService) {
    dialects = new HashMap<>();
    dialects.put(CobolLanguageId.COBOL, new IbmTrueCobolDialect(grammarPreprocessor,
        messageService, treeListener, subroutineService, cachingConfigurationService, dialectService,
        astProcessor, symbolsRepository, codeLayoutStore));

    dialects.put(CobolLanguageId.EXPERIMENTAL_COBOL, new EnterpriseCobol64(grammarPreprocessor,
        messageService, treeListener, subroutineService, cachingConfigurationService, dialectService,
        astProcessor, symbolsRepository, codeLayoutStore));

    dialects.put(CobolLanguageId.HP_COBOL, new HpTrueCobolDialect(grammarPreprocessor,
        messageService, treeListener, subroutineService, cachingConfigurationService, dialectService,
        astProcessor, symbolsRepository, codeLayoutStore, copybookService));
  }

  /**
   * Returns the pipeline for a dialect based on a given language id
   * @param languageId a language id of a dialect
   * @return the pipeline for a dialect
   */
  public Pipeline<AnalysisContext> getPipeline(CobolLanguageId languageId) {
    return Optional.ofNullable(dialects.get(languageId))
        .map(TrueCobolDialect::getPipeline)
        .orElseThrow(() -> new RuntimeException("Dialect " + languageId.name() + "not found"));
  }

  /**
   * Returns the cleanup preprocessor for a dialect, based on a given language id
   * @param languageId a language id of a dialect
   * @return the cleanup preprocessor
   */
  public CleanerPreprocessor getPreprocessor(CobolLanguageId languageId) {
    return Optional.ofNullable(dialects.get(languageId))
        .map(TrueCobolDialect::getPreprocessor)
        .orElseThrow(() -> new RuntimeException("Dialect " + languageId.name() + "not found"));
  }
}
