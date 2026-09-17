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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.settings;

import static org.junit.jupiter.api.Assertions.*;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import java.net.URI;
import java.util.List;
import java.util.Optional;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.lsp.DialectItemDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.NullSource;
import org.junit.jupiter.params.provider.ValueSource;

/** Test for ConfigHelper */
class ConfigHelperTest {

  @Test
  void parsesKeywordsUriWithoutJarUri() {
    URI keywords = URI.create("file:///dialect%20with%20spaces/keywords.txt");
    DialectItemDTO dto =
        new DialectItemDTO(2, "dialect", "", "extensionId", null, keywords.toString());

    List<DialectRegistryItem> registry = ConfigHelper.parseDialectRegistry(ImmutableList.of(dto));

    assertEquals(1, registry.size());
    assertNull(registry.get(0).getUri());
    assertEquals(keywords, registry.get(0).getKeywords());
  }

  @ParameterizedTest
  @NullSource
  @ValueSource(strings = {"invalid uri"})
  void keepsDialectWithoutValidKeywordsUri(String keywords) {
    DialectItemDTO dto = new DialectItemDTO(2, "dialect", "", "extensionId", null, keywords);

    List<DialectRegistryItem> registry = ConfigHelper.parseDialectRegistry(ImmutableList.of(dto));

    assertEquals(1, registry.size());
    assertNull(registry.get(0).getKeywords());
  }

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
    Optional<String> result =
        ConfigHelper.getValueAsString(ImmutableList.of(new JsonPrimitive("test")));
    assertTrue(result.isPresent());
    assertEquals("test", result.get());
  }
}
