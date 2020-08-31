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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.validations;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.Map;
import java.util.Set;

import static java.util.Collections.emptyMap;

@Value
@AllArgsConstructor
@Builder(toBuilder = true)
public class AnalysisResult {
  private Map<String, List<Diagnostic>> diagnostics;
  private Map<String, List<Location>> variableDefinitions;
  private Map<String, List<Location>> variableUsages;
  private Map<String, List<Location>> paragraphDefinitions;
  private Map<String, List<Location>> paragraphUsages;
  private Map<String, List<Location>> copybookDefinitions;
  private Map<String, List<Location>> copybookUsages;
  private List<DocumentSymbol> outlineTree;

  public static AnalysisResult empty() {
    return new AnalysisResult(
        emptyMap(),
        emptyMap(),
        emptyMap(),
        emptyMap(),
        emptyMap(),
        emptyMap(),
        emptyMap(),
        List.of());
  }

  public Set<String> getVariables() {
    return variableDefinitions.keySet();
  }

  public Set<String> getParagraphs() {
    return paragraphDefinitions.keySet();
  }
}
