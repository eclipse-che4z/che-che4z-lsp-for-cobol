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

package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/** This test checks the predefined variables locations provider logic */
class ConstantLocationsTest {
  private static final Map<String, List<Location>> EXPECTED_LOCATIONS =
      Map.of(
          "expected1",
          List.of(new Location("uri", new Range(new Position(0, 1), new Position(2, 3)))),
          "expected2",
          List.of(new Location("uri", new Range(new Position(4, 5), new Position(6, 7)))));

  private static final CobolDocumentModel MODEL =
      new CobolDocumentModel(
          "",
          AnalysisResult.builder()
              .constantUsages(EXPECTED_LOCATIONS)
              .constantDefinitions(Map.of("non-expected", List.of(new Location())))
              .build());

  private ConstantLocations provider = new ConstantLocations();

  @Test
  void references() {
    Map<String, List<Location>> references = provider.references(MODEL);
    assertEquals(EXPECTED_LOCATIONS, references);
  }

  @Test
  void definitions() {
    Map<String, List<Location>> definitions = provider.definitions(MODEL);
    assertTrue(definitions.isEmpty());
  }

  @Test
  void containsToken() {
    assertTrue(provider.containsToken(MODEL, "non-expected"));
  }

  @Test
  void notContainsToken() {
    assertFalse(provider.containsToken(MODEL, "abc"));
  }
}
