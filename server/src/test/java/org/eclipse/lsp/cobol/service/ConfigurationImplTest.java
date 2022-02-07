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
package org.eclipse.lsp.cobol.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.when;

/** Test to check ConfigurationImpl */
class ConfigurationImplTest {

  ConfigurationImpl configuration;
  private SettingsService settingsService;

  @BeforeEach
  void setupMocks() {
    settingsService = spy(SettingsService.class);
    configuration = new ConfigurationImpl(settingsService);
  }

  @Test
  void testUpdateConfigurationFromSettings() {
    JsonArray featuresArray = new JsonArray();
    featuresArray.add("SQL");

    JsonArray flavorSettings = new JsonArray();
    flavorSettings.add("Flavour");

    List<Object> clientConfig =
        Arrays.asList(new JsonPrimitive("DATACOM_SERVER"), featuresArray, flavorSettings);

    when(settingsService.getConfigurations(
            Arrays.asList(TARGET_SQL_BACKEND.label, ANALYSIS_FEATURES.label, FLAVORS.label)))
        .thenReturn(supplyAsync(() -> clientConfig));
    configuration.updateConfigurationFromSettings();
    assertEquals(configuration.getSqlBackend(), SQLBackend.DATACOM_SERVER);
    assertEquals(configuration.getFeatures().contains(EmbeddedCodeNode.Language.SQL), true);
    assertEquals(configuration.getFlavors().contains("Flavour"), true);
  }
}
