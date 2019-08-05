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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.lsp4j.Diagnostic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * This class performs validations for MyDocumentModel objects that contain a Cobol/Hlasm text.
 *
 * <p>Hard coded values is used in order to parse just the fixed format
 *
 * @author Sergiu Ilie, TEMAN02, ZACAN01
 */
public class Validation {
  private static final Logger LOG = LogManager.getLogger(Validation.class);
  private static final Map<String, LanguageEngineFacade> LANGUAGE_ENGINES = new HashMap<>();

  private Validation() {
    throw new AssertionError("Suppress default constructor for noninstantiability");
  }

  public static void registerEngine(String uri, String languageId) {
    LANGUAGE_ENGINES.put(uri, LanguageEngines.getLanguageEngineById(languageId));
  }

  public static void unregisterEngine(String uri) {
    LANGUAGE_ENGINES.remove(uri);
  }

  /**
   * @param uri: resource identifier of document opened in the editor
   * @param text: the content of the opened text document.
   * @return list of LSP4J diagnostic objects
   */
  public static List<Diagnostic> validate(String uri, String text) {
    LOG.info("Analyzed line [{}] has been put into the processing list", text);

    return LANGUAGE_ENGINES.get(uri).performValidation(text);
  }
}
