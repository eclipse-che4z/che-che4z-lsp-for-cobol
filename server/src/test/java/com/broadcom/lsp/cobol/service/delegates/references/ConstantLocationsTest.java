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

import org.eclipse.lsp4j.Location;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** This test checks the predefined variables locations provider logic */
class ConstantLocationsTest extends AbstractReferenceTest {

  @BeforeEach
  void setup() {
    this.provider = new ConstantLocations();
  }

  @Override
  @Test
  void definitions() {
    Map<String, List<Location>> definitions = provider.definitions(MODEL);
    assertTrue(definitions.isEmpty());
  }
}
