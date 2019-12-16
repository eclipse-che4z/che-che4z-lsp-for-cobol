/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.validations;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * This class runs syntax and semantic analysis for a Cobol/Hlasm text.
 *
 * <p>Hard coded values is used in order to parse just the fixed format
 */
@Slf4j
@UtilityClass
public class Analysis {
  private static final Map<String, LanguageEngineFacade> LANGUAGE_ENGINES =
      Collections.synchronizedMap(new HashMap<>());

  public void registerEngine(String uri, String languageId) {
    LANGUAGE_ENGINES.put(uri, LanguageEngines.getLanguageEngineById(languageId));
  }

  public void unregisterEngine(String uri) {
    LANGUAGE_ENGINES.remove(uri);
  }

  /**
   * @param uri: resource identifier of document opened in the editor
   * @param text: the content of the opened text document.
   * @return list of LSP4J diagnostic objects
   */
  public AnalysisResult run(String uri, String text) {
    log.info("Analyzed line [{}] has been put into the processing list", text);

    return LANGUAGE_ENGINES.get(uri).analyze(text);
  }
}
