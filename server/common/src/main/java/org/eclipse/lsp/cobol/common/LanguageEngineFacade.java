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
package org.eclipse.lsp.cobol.common;

/**
 * Language Engine Facade interface
 */
public interface LanguageEngineFacade {
  /**
   * @param uri - URI of the processing document to define positions and errors properly
   * @param text of document opened in the client editor
   * @param analysisConfig contains analysis processing features info and copybook config with following information:
   *                       target backend sql server, copybook processing mode which
   *                       reflect the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return list of LSP diagnostic object used to display errors in the editor
   */
  AnalysisResult analyze(String uri, String text, AnalysisConfig analysisConfig);

  /**
   * Analyze the document for a specific cobol dialect (language id)
   * and find syntax/semantic errors, variables, paragraphs etc.
   *
   * @param uri - URI of the processing document to define positions and errors properly
   * @param text of document opened in the client editor
   * @param analysisConfig contains analysis processing features info and copybook config with
   *     following information: target backend sql server, copybook processing mode which reflect
   *     the sync status of the document (DID_OPEN|DID_CHANGE)
   * @param languageId
   * @return a model containing full analysis result, e.g. errors and semantic elements
   */
  AnalysisResult analyze(String uri, String text, AnalysisConfig analysisConfig, String languageId);
}
