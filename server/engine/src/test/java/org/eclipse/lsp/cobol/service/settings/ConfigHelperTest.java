/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.settings;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test for ConfigHelper
 */
class ConfigHelperTest {

  @Test
  void test_null() {
    Optional<String> result = ConfigHelper.getValueAsString(null);
    assertFalse(result.isPresent());
  }

  @Test
  void test_empty_list() {
    Optional<String> result = ConfigHelper.getValueAsString(ImmutableList.of());
    assertFalse(result.isPresent());
  }

  @Test
  void test_not_json() {
    Optional<String> result = ConfigHelper.getValueAsString(ImmutableList.of("test"));
    assertFalse(result.isPresent());
  }

  @Test
  void test_json() {
    Optional<String> result = ConfigHelper.getValueAsString(ImmutableList.of(new JsonPrimitive("test")));
    assertTrue(result.isPresent());
    assertEquals("test", result.get());
  }

}
