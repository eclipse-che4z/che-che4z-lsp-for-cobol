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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysis;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysisFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;

import java.util.List;

import static org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysisFactory.AnalysisTypes.*;

/**
 * Contains injectors that needs to be applied to different cobol program sections
 */
@Singleton
public class InjectService {
  private final CopybookAnalysisFactory analysisFactory;

  @Inject
  public InjectService(CopybookAnalysisFactory analysisFactory) {
    this.analysisFactory = analysisFactory;
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.LinkageSectionContext ctx) {
    CopybookAnalysis analysis = analysisFactory.getInstanceFor(PREDEFINED);
    return ImmutableList.of(new InjectDescriptor("DFHEIBLC", analysis));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.ProcedureDivisionContext ctx) {
    CopybookAnalysis analysis = analysisFactory.getInstanceFor(GENERATED);
    return ImmutableList.of(new InjectDescriptor("PLABEL", analysis));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.WorkingStorageSectionContext ctx) {
    CopybookAnalysis analysis = analysisFactory.getInstanceFor(PREDEFINED);
    return ImmutableList.of(new InjectDescriptor("SPECIALREGISTERS", analysis));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.PlusplusIncludeStatementContext ctx) {
    CopybookAnalysis analysis = analysisFactory.getInstanceFor(PANVALET);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.CopyStatementContext ctx) {
    CopybookAnalysis analysis = analysisFactory.getInstanceFor(COBOL);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.IncludeStatementContext ctx) {
    CopybookAnalysis analysis = analysisFactory.getInstanceFor(COBOL);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis));
  }

  private String retrieveCopybookName(ParserRuleContext ctx) {
    return PreprocessorStringUtils.trimQuotes(ctx.getText().toUpperCase());
  }

}
