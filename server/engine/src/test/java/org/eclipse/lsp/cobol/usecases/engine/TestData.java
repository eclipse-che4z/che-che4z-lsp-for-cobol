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

package org.eclipse.lsp.cobol.usecases.engine;

import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.Map;

/** This data class defines output of use-case text preprocessor */
@Value
@Builder(toBuilder = true)
class TestData {
  String text;
  String copybookName;
  String dialectType;
  Map<String, List<Diagnostic>> diagnostics;
  Map<String, List<Location>> variableDefinitions;
  Map<String, List<Location>> variableUsages;
  Map<String, List<Location>> paragraphDefinitions;
  Map<String, List<Location>> paragraphUsages;
  Map<String, List<Location>> sectionDefinitions;
  Map<String, List<Location>> sectionUsages;
  Map<String, List<Location>> constantUsages;
  Map<String, List<Location>> copybookDefinitions;
  Map<String, List<Location>> copybookUsages;
  Map<String, List<Location>> subroutineDefinitions;
  Map<String, List<Location>> subroutineUsages;
}
