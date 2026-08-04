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

import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.lsp.DialectItemDTO;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;

/** This service fetches configuration settings from the client. */
@Slf4j
@Singleton
public class CachingConfigurationService implements ConfigurationService {
  private final SettingsService settingsService;
  private final DialectService dialectService;
  private final Provider<CobolLanguageClient> clientProvider;

  @Inject
  public CachingConfigurationService(
      SettingsService settingsService,
      DialectService dialectService,
      final Provider<CobolLanguageClient> clientProvider) {
    this.settingsService = settingsService;
    this.dialectService = dialectService;
    this.clientProvider = clientProvider;
  }

  private CompletableFuture<ConfigurationEntity> createConfigFuture(String documentURI) {
    List<String> settingsList =
        new LinkedList<>(
            Arrays.asList(
                DIALECTS.label,
                SUBROUTINE_LOCAL_PATHS.label,
                CICS_TRANSLATOR_ENABLED.label,
                SQL_PROCESSING_ENABLED_SETTING.label,
                SQL_DECIMAL_COMMA_ALLOWED.label,
                COMPILER_OPTIONS.label,
                UNUSED_VARIABLE_SEVERITY.label,
                ANALYSIS_MODE.label));

    List<String> dialectsSections =
        Stream.concat(
                dialectService.getSettingsSections().stream(),
                dialectService.getImplicitDialectSettingsSections().stream())
            .collect(Collectors.toList());

    settingsList.addAll(dialectsSections);

    final CompletableFuture<List<Object>> configFuture =
        settingsService.fetchConfigurations(documentURI, settingsList);
    if (configFuture == null) {
      // FIXME: Tests should be adjusted instead of testing for null
      return CompletableFuture.completedFuture(new ConfigurationEntity());
    }

    final CompletableFuture<List<DialectItemDTO>> dialectsFuture =
        clientProvider.get().availableDialects();

    return configFuture.thenCombine(
        dialectsFuture,
        (config, dialects) -> {
          return parseConfig(config, dialectsSections, ConfigHelper.parseDialectRegistry(dialects));
        });
  }

  @Override
  @SuppressWarnings("java:S2142")
  public AnalysisConfig getConfig(String scopeURI, CopybookProcessingMode mode) {
    try {
      AnalysisConfig config =
          AnalysisConfigHelper.fromConfigEntity(mode, createConfigFuture(scopeURI).get());
      if (dialectService.updateDialects(config.getDialectRegistry())) {
        // if list of dialects were changed - request config one more time
        config = AnalysisConfigHelper.fromConfigEntity(mode, createConfigFuture(scopeURI).get());
      }
      return config;
    } catch (InterruptedException e) {
      LOG.error("Issue while resolving analysis configuration for {}", scopeURI, e);
      Thread.currentThread().interrupt();
    } catch (ExecutionException e) {
      LOG.error("Issue while resolving analysis configuration for {}", scopeURI, e);
    }
    return AnalysisConfig.defaultConfig(mode);
  }

  @Override
  public List<String> getSubroutineDirectories() {
    try {
      return createConfigFuture(null).get().getSubroutines();
    } catch (InterruptedException e) {
      LOG.error("Issue while resolving subroutine configuration", e);
      Thread.currentThread().interrupt();
    } catch (ExecutionException e) {
      LOG.error("Issue while resolving subroutine configuration", e);
    }
    return ImmutableList.of();
  }

  @Override
  public CompletableFuture<List<String>> getListConfiguration(String documentUri, String section) {
    return settingsService.fetchTextConfigurationWithScope(documentUri, section);
  }

  @Override
  public List<String> getDialectWatchingFolders() {
    return dialectService.getWatchingFolderSettings();
  }

  private ConfigurationEntity parseConfig(
      List<Object> clientConfig,
      List<String> dialectsSections,
      List<DialectRegistryItem> dialects) {
    return Optional.ofNullable(clientConfig)
        .map(cc -> this.parseSettings(cc, dialectsSections, dialects))
        .orElseGet(ConfigurationEntity::new);
  }

  private ConfigurationEntity parseSettings(
      List<Object> clientConfig,
      List<String> dialectsSections,
      List<DialectRegistryItem> dialects) {

    return new ConfigurationEntity(
        ConfigHelper.parseDialects((JsonArray) clientConfig.get(0)),
        ConfigHelper.parseSubroutineFolder((JsonElement) clientConfig.get(1)),
        ConfigHelper.parseCicsTranslatorOption((JsonElement) clientConfig.get(2)),
        dialects,
        ConfigHelper.parseSQLProcessingEnabled((JsonElement) clientConfig.get(3)),
        ConfigHelper.parseSQLDecimalCommaAllowed((JsonElement) clientConfig.get(4)),
        ConfigHelper.parseCompilerOptions(clientConfig.get(5)),
        ConfigHelper.parseUnusedVariableSeverity((JsonElement) clientConfig.get(6)),
        ConfigHelper.parseAnalysisMode((JsonElement) clientConfig.get(7)),
        getDialectsSettings(
            clientConfig.subList(8, 8 + dialectsSections.size()).toArray(),
            dialectsSections.toArray()));
  }

  private Map<String, JsonElement> getDialectsSettings(Object[] config, Object[] dialectsSections) {
    if (config.length != dialectsSections.length) {
      throw new RuntimeException("Dialect configuration is invalid");
    }
    Map<String, JsonElement> result = new HashMap<>();
    for (int i = 0; i < dialectsSections.length; i++) {
      result.put(dialectsSections[i].toString(), (JsonElement) config[i]);
    }
    return result;
  }
}
