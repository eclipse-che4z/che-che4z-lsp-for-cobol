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

import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;

import java.util.*;

/**
 * This class represents a semantic context of the analysed document. It contains a map of {@link
 * Diagnostic} grouped by related documents, all the
 */
@Value
@Builder(toBuilder = true)
public class AnalysisResult {
  @Builder.Default Map<String, List<Diagnostic>> diagnostics = new HashMap<>();
  @Builder.Default Map<String, List<Location>> variableDefinitions = new HashMap<>();
  @Builder.Default Map<String, List<Location>> variableUsages = new HashMap<>();
  @Builder.Default Map<String, List<Location>> paragraphDefinitions = new HashMap<>();
  @Builder.Default Map<String, List<Location>> paragraphUsages = new HashMap<>();
  @Builder.Default Map<String, List<Location>> paragraphRange = new HashMap<>();
  @Builder.Default Map<String, List<Location>> sectionDefinitions = new HashMap<>();
  @Builder.Default Map<String, List<Location>> sectionUsages = new HashMap<>();
  @Builder.Default Map<String, List<Location>> sectionRange = new HashMap<>();
  @Builder.Default Map<String, List<Location>> constantDefinitions = new HashMap<>();
  @Builder.Default Map<String, List<Location>> constantUsages = new HashMap<>();
  @Builder.Default Map<String, List<Location>> copybookDefinitions = new HashMap<>();
  @Builder.Default Map<String, List<Location>> copybookUsages = new HashMap<>();
  @Builder.Default Map<String, List<Location>> subroutineDefinitions = new HashMap<>();
  @Builder.Default Map<String, List<Location>> subroutineUsages = new HashMap<>();
  @Builder.Default List<DocumentSymbol> outlineTree = new ArrayList<>();

  /**
   * Construct empty AnalysisResult.
   *
   * @return an empty analysis result
   */
  public static AnalysisResult empty() {
    return AnalysisResult.builder().build();
  }

  public Set<String> getVariables() {
    return variableDefinitions.keySet();
  }

  public Set<String> getConstants() {
    return constantDefinitions.keySet();
  }

  public Set<String> getParagraphs() {
    return paragraphDefinitions.keySet();
  }

  public Set<String> getSections() {
    return sectionDefinitions.keySet();
  }
}
