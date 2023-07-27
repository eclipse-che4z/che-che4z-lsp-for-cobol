/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.inject.Singleton;
import org.eclipse.lsp4j.Diagnostic;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Diagnostic repository
 */
@Singleton
class DiagnosticRepo {
  private final Map<String, List<Diagnostic>> map = new ConcurrentHashMap<>();

  /**
   * Put diagnostics
   * @param diagnosticMap - map of diagnostic where key is a document url
   */
  public void put(Map<String, List<Diagnostic>> diagnosticMap) {
    map.putAll(diagnosticMap);
  }

  /**
   * Get diagnostic for the document
   * @param uri - document uri
   * @return diagnostic list
   */
  public List<Diagnostic> get(String uri) {
    return map.get(uri);
  }

  /**
   * Removes diagnostic for the document
   * @param uri - document uri
   */
  public void delete(String uri) {
    map.remove(uri);
  }
}
