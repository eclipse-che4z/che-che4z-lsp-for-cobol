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
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/** Test to check SubroutineLocations */
public class SubroutineLocationsTest {
  private CobolDocumentModel model;
  private SubroutineLocations provider;
  private Map<String, List<Location>> subroutineDefinitions;
  private Map<String, List<Location>> subroutineUsages;

  @BeforeEach
  void init() {
    subroutineDefinitions = new HashMap<>();
    subroutineUsages = new HashMap<>();

    AnalysisResult analysisResult = AnalysisResult.builder()
        .subroutineDefinitions(subroutineDefinitions)
        .subroutineUsages(subroutineUsages)
        .build();

    model = new CobolDocumentModel("", analysisResult);
    provider = new SubroutineLocations();
  }

  @Test
  void testReferences() {
    subroutineUsages.put("usages", List.of(new Location()));
    assertEquals(subroutineUsages, provider.references(model));
  }

  @Test
  void testDefinitions() {
    subroutineDefinitions.put("definition", List.of(new Location()));
    assertEquals(subroutineDefinitions, provider.definitions(model));
  }

  @Test
  void testContainsTokenPositive() {
    subroutineUsages.put("token", List.of(new Location()));
    assertTrue(provider.containsToken(model, "token"));
  }

  @Test
  void testContainsTokenNegative() {
    assertFalse(provider.containsToken(model, "token"));
  }
}
