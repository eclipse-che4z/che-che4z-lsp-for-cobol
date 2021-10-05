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

package org.eclipse.lsp.cobol.service.delegates.completions;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.ImmutableMap.of;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** This class stores a model to assert the completion providers */
class MockCompletionModel {
  private static final List<Location> LOCATIONS = new ArrayList<>();
  private static final Variable VAR1 = mock(Variable.class);
  private static final Variable VAR2 = mock(Variable.class);
  private static final Variable VAR_NOT_EXPECTED = mock(Variable.class);
  static final AnalysisResult RESULT =
      AnalysisResult.builder()
          .paragraphDefinitions(of("parD1", LOCATIONS, "ParD2", LOCATIONS, "Not-parD", LOCATIONS))
          .paragraphUsages(of("parU1", LOCATIONS, "ParU2", LOCATIONS, "Not-parU", LOCATIONS))
          .sectionDefinitions(of("secD1", LOCATIONS, "SecD2", LOCATIONS, "Not-secD", LOCATIONS))
          .sectionUsages(of("secU1", LOCATIONS, "SecU2", LOCATIONS, "Not-secU", LOCATIONS))
          .constantDefinitions(
              of("constD1", LOCATIONS, "ConstD2", LOCATIONS, "Not-constD", LOCATIONS))
          .constantUsages(of("constU1", LOCATIONS, "ConstU2", LOCATIONS, "Not-constU", LOCATIONS))
          .copybookDefinitions(of("cpyD1", LOCATIONS, "CpyD2", LOCATIONS, "Not-cpyD", LOCATIONS))
          .copybookUsages(of("cpyU1", LOCATIONS, "CpyU2", LOCATIONS, "Not-cpyU", LOCATIONS))
          .subroutineDefinitions(of("subD1", LOCATIONS, "SubD2", LOCATIONS, "Not-subD", LOCATIONS))
          .subroutineUsages(of("subU1", LOCATIONS, "SubU2", LOCATIONS, "Not-subU", LOCATIONS))
          .variables(ImmutableList.of(VAR1, VAR2, VAR_NOT_EXPECTED))
          .build();
  static final CobolDocumentModel MODEL = new CobolDocumentModel("some text", RESULT);

  static {
    when(VAR1.getName()).thenReturn("var1");
    when(VAR1.getFormattedDisplayLine()).thenReturn("expected1");
    when(VAR2.getName()).thenReturn("VAR2");
    when(VAR2.getFormattedDisplayLine()).thenReturn("expected2");
    when(VAR_NOT_EXPECTED.getName()).thenReturn("Not-var");
    when(VAR_NOT_EXPECTED.getFormattedDisplayLine()).thenReturn("not-expected");
  }
}
