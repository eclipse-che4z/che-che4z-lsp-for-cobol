/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

/**
 * Test for DiagnosticRepo
 */
class DiagnosticRepoTest {
  private DiagnosticRepo diagnosticRepo;

  @BeforeEach
  void init() {
    diagnosticRepo = new DiagnosticRepo();
  }

  @Test
  void testGet() {
    Map<String, List<Diagnostic>> map = ImmutableMap.of("uri1", ImmutableList.of(new Diagnostic()),
        "uri2", ImmutableList.of(new Diagnostic(), new Diagnostic()));

    diagnosticRepo.put(map);
    assertEquals(1, diagnosticRepo.get("uri1").size());
    assertEquals(2, diagnosticRepo.get("uri2").size());
  }

  @Test
  void testDelete() {
    Map<String, List<Diagnostic>> map = ImmutableMap.of("uri1", ImmutableList.of(new Diagnostic()),
        "uri2", ImmutableList.of(new Diagnostic(), new Diagnostic()));

    diagnosticRepo.put(map);
    diagnosticRepo.delete("uri1");

    assertNull(diagnosticRepo.get("uri1"));
    assertEquals(2, diagnosticRepo.get("uri2").size());
  }

}
