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
import lombok.Value;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Value
@AllArgsConstructor
public class AnalysisResult {
  private List<Diagnostic> diagnostics;
  private Map<String, List<Location>> variableDefinitions;
  private Map<String, List<Location>> variableUsages;
  private Map<String, List<Location>> paragraphDefinitions;
  private Map<String, List<Location>> paragraphUsages;
  private Map<String, List<Location>> copybookDefinitions;
  private Map<String, List<Location>> copybookUsages;

  public static AnalysisResult empty() {
    return new AnalysisResult(
        Collections.emptyList(),
        Collections.emptyMap(),
        Collections.emptyMap(),
        Collections.emptyMap(),
        Collections.emptyMap(),
        Collections.emptyMap(),
        Collections.emptyMap());
  }

  public Set<String> getVariables() {
    return variableDefinitions.keySet();
  }

  public Set<String> getParagraphs() {
    return paragraphDefinitions.keySet();
  }
}
