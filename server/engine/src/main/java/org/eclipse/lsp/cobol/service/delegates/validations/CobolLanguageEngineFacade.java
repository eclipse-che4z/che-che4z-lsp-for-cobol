/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.service.delegates.validations;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp4j.Diagnostic;

/**
 * This class is a facade that maps the result of the syntax and semantic analysis to a model
 * consumed by the LSP, i.e. convert {@link org.eclipse.lsp.cobol.common.error.SyntaxError} to {@link Diagnostic} and adjust semantic
 * context.
 */
@Singleton
public class CobolLanguageEngineFacade implements LanguageEngineFacade {

  private final CobolLanguageEngine engine;

  @Inject
  CobolLanguageEngineFacade(CobolLanguageEngine engine) {
    this.engine = engine;
  }

  /**
   * Analyze the document using the COBOL language engine and find syntax/semantic errors,
   * variables, paragraphs etc.
   *
   * @param uri - URI of the processing document to define positions and errors properly
   * @param text of document opened in the client editor
   * @param analysisConfig contains analysis processing features info and copybook config with
   *     following information: target backend sql server, copybook processing mode which reflect
   *     the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return a model containing full analysis result, e.g. errors and semantic elements
   */
  @Override
  public AnalysisResult analyze(String uri, String text, AnalysisConfig analysisConfig) {
    return engine.run(uri, text, analysisConfig);
  }
}
