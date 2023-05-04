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

package org.eclipse.lsp.cobol.service.delegates.formations;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.TextEdit;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Test {@link Formations} class */
class FormationsTest {

  private static final Formation FORMATION_1 = mock(Formation.class);
  private static final Formation FORMATION_2 = mock(Formation.class);
  private static final Formations FORMATIONS = new Formations(ImmutableSet.of(FORMATION_1, FORMATION_2));

  @Test
  void WhenCobolDocumentModelNull_thenFormatReturnsEmptyList() {
    List<TextEdit> format = FORMATIONS.format(null);
    assertEquals(0, format.size());
  }

  @Test
  void WhenCobolDocumentModelNonNull_thenFormatReturnsFormattedString() {
    CobolDocumentModel model = new CobolDocumentModel("", "SAMPLE TEXT FOR TEST");
    List<TextEdit> response1 = ImmutableList.of(new TextEdit());
    List<TextEdit> response2 = ImmutableList.of(new TextEdit(), new TextEdit());
    when(FORMATION_1.format(anyList())).thenReturn(response1);
    when(FORMATION_2.format(anyList())).thenReturn(response2);
    List<TextEdit> format = FORMATIONS.format(model);
    // expect a flattened list of 2 responses.
    assertEquals(3, format.size());
  }
}
