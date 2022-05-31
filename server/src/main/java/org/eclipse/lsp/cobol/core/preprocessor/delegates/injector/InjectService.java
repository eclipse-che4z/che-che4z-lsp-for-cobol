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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysis;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysisFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProvider;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProviderFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;

import java.util.List;

import static org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysisFactory.AnalysisTypes.*;
import static org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProviderFactory.InjectCodeContentType.*;

/**
 * Contains injectors that needs to be applied to different cobol program sections
 */
@Singleton
public class InjectService {
  private final InjectCodeAnalysisFactory analysisFactory;
  private final ContentProviderFactory contentProviderFactory;

  @Inject
  public InjectService(InjectCodeAnalysisFactory analysisFactory, ContentProviderFactory contentProviderFactory) {
    this.analysisFactory = analysisFactory;
    this.contentProviderFactory = contentProviderFactory;
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.LinkageSectionContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(IMPLICIT);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(FILE);
    return ImmutableList.of(new InjectDescriptor("DFHEIBLC", analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.ProcedureDivisionContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(IMPLICIT);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(GENERATED);
    return ImmutableList.of(new InjectDescriptor("PLABEL", analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.WorkingStorageSectionContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(IMPLICIT);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(FILE);
    return ImmutableList.of(new InjectDescriptor("SPECIALREGISTERS", analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.PlusplusIncludeStatementContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(PANVALET);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(RESOLVE_COPYBOOK);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.CopyStatementContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(COPYBOOK);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(RESOLVE_COPYBOOK);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.IncludeStatementContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(COPYBOOK);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(RESOLVE_COPYBOOK);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis, contentProvider));
  }

  private String retrieveCopybookName(ParserRuleContext ctx) {
    return PreprocessorStringUtils.trimQuotes(ctx.getText().toUpperCase());
  }

}
