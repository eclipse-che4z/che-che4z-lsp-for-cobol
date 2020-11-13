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

package com.broadcom.lsp.cobol.service.delegates.formations;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.TextEdit;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Test {@link Formations} class */
class FormationsTest {

  private final Formation formation_1 = mock(Formation.class);
  private final Formation formation_2 = mock(Formation.class);
  private final Formations formations = new Formations(Set.of(formation_1, formation_2));

  @Test
  void WhenCobolDocumentModelNull_thenFormatReturnsEmptyList() {
    List<TextEdit> format = formations.format(null);
    assertEquals(0, format.size());
  }

  @Test
  void WhenCobolDocumentModelNonNull_thenFormatReturnsFormattedString() {
    CobolDocumentModel model = new CobolDocumentModel("SAMPLE TEXT FOR TEST");
    List<TextEdit> response_1 = List.of(new TextEdit());
    List<TextEdit> response_2 = List.of(new TextEdit(), new TextEdit());
    when(formation_1.format(anyList())).thenReturn(response_1);
    when(formation_2.format(anyList())).thenReturn(response_2);
    List<TextEdit> format = formations.format(model);
    // expect a flattened list of 2 responses.
    assertEquals(3, format.size());
  }
}
