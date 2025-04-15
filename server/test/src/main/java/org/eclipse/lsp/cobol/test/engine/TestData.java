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

package org.eclipse.lsp.cobol.test.engine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.common.symbols.ProcedureId;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;

/** This data class defines output of use-case text preprocessor */
@Value
@Builder(toBuilder = true)
public class TestData {
  String text;
  String copybookName;
  String dialectType;
  Map<String, List<Diagnostic>> diagnostics;
  Map<String, List<Location>> variableDefinitions;
  Map<String, List<Location>> variableUsages;
  Map<ProcedureId, List<Location>> procedureDefinitions;
  Map<ProcedureId, List<Location>> procedureUsages;
  Map<String, List<Location>> constantUsages;
  Map<String, List<Location>> copybookDefinitions;
  Map<String, List<Location>> copybookUsages;
  Map<String, List<Location>> subroutineDefinitions;
  Map<String, List<Location>> subroutineUsages;
  Map<String, List<Location>> functionDefinitions;
  Map<String, List<Location>> functionUsages;
  Map<String, String> copybookEnterSectionNames;

  Map<ProcedureId, List<Location>> getParagraphDefinitions() {
    Map<ProcedureId, List<Location>> result = new HashMap<>();
    for (Map.Entry<ProcedureId, List<Location>> en : procedureDefinitions.entrySet()) {
      if (!en.getKey().isSection()) {
        result.computeIfAbsent(en.getKey(), it -> new ArrayList<>()).addAll(en.getValue());
      }
    }
    return result;
  }

  Map<ProcedureId, List<Location>> getParagraphUsages() {
    return procedureUsages.entrySet().stream()
        .filter(en -> en.getKey().isParagraph())
        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
  }

  public Map<ProcedureId, List<Location>> getSectionUsages() {
    return procedureUsages.entrySet().stream()
        .filter(en -> en.getKey().isSection())
        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
  }

  public Map<ProcedureId, List<Location>> getSectionDefinitions() {
    return procedureDefinitions.entrySet().stream()
        .filter(en -> en.getKey().isSection())
        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
  }
}
