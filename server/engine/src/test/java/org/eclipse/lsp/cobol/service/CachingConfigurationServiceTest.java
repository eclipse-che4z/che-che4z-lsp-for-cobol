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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

/** Test to check CachingConfigurationServiceTest */
class CachingConfigurationServiceTest {

  @Test
  void testInitialLoading() {
    SettingsService settingsService = spy(SettingsService.class);
    when(settingsService.fetchConfigurations(anyList())).thenReturn(CompletableFuture.completedFuture(null));

    DialectService dialectService = mock(DialectService.class);
    when(dialectService.getSettingsSections()).thenReturn(ImmutableList.of("dialect"));

    CachingConfigurationService configuration = new CachingConfigurationService(settingsService, dialectService);

    assertEquals(
        new AnalysisConfig(
            new CopybookConfig(
                CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER),
            ImmutableList.of(),
            ImmutableList.of(),
            true, ImmutableList.of(), ImmutableMap.of()),
        configuration.getConfig(null, CopybookProcessingMode.ENABLED));
  }

  @Test
  void testUpdatingConfiguration() {
    SettingsService settingsService = spy(SettingsService.class);
    JsonArray featuresArray = new JsonArray();
    featuresArray.add("SQL");

    DialectService dialectService = mock(DialectService.class);
    when(dialectService.getSettingsSections()).thenReturn(ImmutableList.of("dialect"));

    JsonArray dialectSettings = new JsonArray();
    dialectSettings.add("Dialect");

    JsonArray predefinedParagraphs = new JsonArray();
    JsonArray subroutines = new JsonArray();

    List<Object> clientConfig =
        Arrays.asList(
            new JsonPrimitive("DATACOM_SERVER"),
            featuresArray,
            dialectSettings,
            subroutines,
            new JsonPrimitive("true"),
            new JsonArray(),
            new JsonArray(),
            predefinedParagraphs);

    when(settingsService.fetchConfigurations("",
            Arrays.asList(
                TARGET_SQL_BACKEND.label,
                ANALYSIS_FEATURES.label,
                DIALECTS.label,
                SUBROUTINE_LOCAL_PATHS.label,
                CICS_TRANSLATOR_ENABLED.label,
                DIALECT_REGISTRY.label,
                COMPILER_OPTIONS.label,
                "dialect")))
        .thenReturn(supplyAsync(() -> clientConfig));

    CachingConfigurationService configuration = new CachingConfigurationService(settingsService, dialectService);

    assertEquals(
        new AnalysisConfig(
            new CopybookConfig(
                CopybookProcessingMode.DISABLED, SQLBackend.DATACOM_SERVER),
            ImmutableList.of(EmbeddedLanguage.SQL),
            ImmutableList.of("Dialect"),
            true, ImmutableList.of(),
            ImmutableMap.of("dialect", predefinedParagraphs)),
        configuration.getConfig("", CopybookProcessingMode.DISABLED));
  }

  @Test
  void testUpdatingConfigurationWithNullFeatures() {
    SettingsService settingsService = spy(SettingsService.class);

    DialectService dialectService = mock(DialectService.class);
    when(dialectService.getSettingsSections()).thenReturn(ImmutableList.of("dialect"));
    JsonArray dialectsSettings = new JsonArray();
    dialectsSettings.add("test");

    JsonArray dialectSettings = new JsonArray();
    JsonArray subroutineSettings = new JsonArray();
    dialectSettings.add("Dialect");
    List<Object> clientConfig =
        Arrays.asList(
            new JsonPrimitive("DATACOM_SERVER"),
            new JsonNull(),
            dialectSettings,
            subroutineSettings,
            new JsonNull(),
            new JsonArray(),
             new JsonArray(),
            dialectsSettings);
    when(settingsService.fetchConfigurations("",
            Arrays.asList(
                TARGET_SQL_BACKEND.label,
                ANALYSIS_FEATURES.label,
                DIALECTS.label,
                SUBROUTINE_LOCAL_PATHS.label,
                CICS_TRANSLATOR_ENABLED.label,
                DIALECT_REGISTRY.label,
                COMPILER_OPTIONS.label,
                "dialect")))
        .thenReturn(supplyAsync(() -> clientConfig));

    CachingConfigurationService configuration = new CachingConfigurationService(settingsService, dialectService);

    assertEquals(
        new AnalysisConfig(
            new CopybookConfig(
                CopybookProcessingMode.DISABLED, SQLBackend.DATACOM_SERVER),
            ImmutableList.of(EmbeddedLanguage.SQL, EmbeddedLanguage.CICS),
            ImmutableList.of("Dialect"),
            false,
            ImmutableList.of(),
            ImmutableMap.of("dialect", dialectsSettings)),
        configuration.getConfig("", CopybookProcessingMode.DISABLED));
  }

  @Test
  void testFetchingListConfiguration() {
    String expectedValue = "list-of-some-values-from-client";
    String documentUri = "documentUri";
    String section = "settings-section";
    SettingsService settingsService = mock(SettingsService.class);
    when(settingsService.fetchTextConfigurationWithScope(documentUri, section))
            .thenReturn(CompletableFuture.completedFuture(ImmutableList.of(expectedValue)));
    DialectService dialectService = mock(DialectService.class);
    CachingConfigurationService configuration = new CachingConfigurationService(settingsService, dialectService);
    configuration.getListConfiguration(documentUri, section)
            .whenComplete((result, ex) -> {
              assertEquals(result.size(), 1);
              assertEquals(result.get(0), expectedValue);
            });
  }

  @Test
  void testGetDialectWatchingFolders() {
    SettingsService settingsService = mock(SettingsService.class);
    DialectService dialectService = mock(DialectService.class);
    String expectedResult = "dialect-watch-folders";
    when(dialectService.getWatchingFolderSettings()).thenReturn(ImmutableList.of(expectedResult));
    CachingConfigurationService configuration = new CachingConfigurationService(settingsService, dialectService);
    assertEquals(configuration.getDialectWatchingFolders().get(0), expectedResult);
  }
}
