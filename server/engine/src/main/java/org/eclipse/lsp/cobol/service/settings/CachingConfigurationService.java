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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.service.utils.ServerTypeUtil;

import javax.inject.Inject;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;

/** This service fetches configuration settings from the client. */
@Slf4j
@Singleton
public class CachingConfigurationService implements ConfigurationService {
  private final SettingsService settingsService;
  private final DialectService dialectService;

  @Inject
  public CachingConfigurationService(SettingsService settingsService, DialectService dialectService) {
    this.settingsService = settingsService;
    this.dialectService = dialectService;
  }

  private CompletableFuture<ConfigurationEntity> createConfigFuture(String documentURI) {
    List<String> settingsList = new LinkedList<>(Arrays.asList(
        TARGET_SQL_BACKEND.label,
        ANALYSIS_FEATURES.label,
        DIALECTS.label,
        SUBROUTINE_LOCAL_PATHS.label,
        CICS_TRANSLATOR_ENABLED.label,
        DIALECT_REGISTRY.label));

    List<String> dialectsSections = dialectService.getSettingsSections();
    settingsList.addAll(dialectsSections);

    return Optional.ofNullable(settingsService.fetchConfigurations(documentURI, settingsList))
        .map(c -> c.thenApply(future ->
            Optional.ofNullable(future)
                .map(list -> parseConfig(list, dialectsSections))
                .orElse(new ConfigurationEntity()))
        ).orElse(CompletableFuture.completedFuture(new ConfigurationEntity()));
  }

  @Override
  @SuppressWarnings("java:S2142")
  public AnalysisConfig getConfig(String scopeURI, CopybookProcessingMode mode) {
    try {
      AnalysisConfig config = AnalysisConfigHelper.fromConfigEntity(mode, createConfigFuture(scopeURI).get());
      if (ServerTypeUtil.isNativeServerType()) {
        return config;
      }
      if (dialectService.updateDialects(config.getDialectRegistry())) {
        // if list of dialects were changed - request config one more time
        config = AnalysisConfigHelper.fromConfigEntity(mode, createConfigFuture(scopeURI).get());
      }
      return config;
    } catch (InterruptedException e) {
      LOG.error("Issue while resolving analysis configuration", e);
      Thread.currentThread().interrupt();
    } catch (ExecutionException e) {
      LOG.error("Issue while resolving analysis configuration", e);
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

  private ConfigurationEntity parseConfig(List<Object> clientConfig, List<String> dialectsSections) {
    return Optional.ofNullable(clientConfig)
        .map(cc -> this.parseSettings(cc, dialectsSections))
        .orElseGet(ConfigurationEntity::new);
  }

  private ConfigurationEntity parseSettings(List<Object> clientConfig, List<String> dialectsSections) {

    return new ConfigurationEntity(
            ConfigHelper.parseSQLBackend(clientConfig.subList(0, 1)),
            ConfigHelper.parseFeatures((JsonElement) clientConfig.get(1)),
            ConfigHelper.parseDialects((JsonArray) clientConfig.get(2)),
            ConfigHelper.parseSubroutineFolder((JsonElement) clientConfig.get(3)),
            ConfigHelper.parseCicsTranslatorOption((JsonElement) clientConfig.get(4)),
            ConfigHelper.parseDialectRegistry((JsonArray) clientConfig.get(5)),
        getDialectsSettings(clientConfig.subList(6, 6 + dialectsSections.size()).toArray(), dialectsSections.toArray())
        );
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
