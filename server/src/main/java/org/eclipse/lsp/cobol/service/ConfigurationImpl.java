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
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;

import javax.inject.Inject;
import java.util.*;

import static java.util.Collections.unmodifiableList;
import static java.util.Collections.unmodifiableSet;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;

/** This service fetches configuration settings from the client. */
@Slf4j
@Singleton
public class ConfigurationImpl implements Configuration {
  SQLBackend sqlBackend;
  Set<EmbeddedCodeNode.Language> features = new HashSet<>();
  List<String> dialects = ImmutableList.of();

  private SettingsService settingsService;

  @Inject
  public ConfigurationImpl(SettingsService settingsService) {
    this.settingsService = settingsService;
  }

  @Override
  public void updateConfigurationFromSettings() {
    settingsService
        .getConfigurations(
            Arrays.asList(TARGET_SQL_BACKEND.label, ANALYSIS_FEATURES.label, DIALECTS.label))
        .thenAccept(this::updateConfigs);
  }

  public Set<EmbeddedCodeNode.Language> getFeatures() {
    return unmodifiableSet(features);
  }

  public List<String> getDialects() {
    return unmodifiableList(dialects);
  }

  public SQLBackend getSqlBackend() {
    return sqlBackend;
  }

  private void updateConfigs(List<Object> clientConfig) {
    if (Objects.nonNull(clientConfig)) {
      List<Object> targetSQLBackend = clientConfig.subList(0, 1);

      updateTargetSQL(targetSQLBackend);

      JsonArray analysisFeatures = (JsonArray) clientConfig.get(1);
      updateFeatures(analysisFeatures);

      JsonElement dialects = (JsonElement) clientConfig.get(2);
      updateDialects(dialects);
    }
  }

  private void updateTargetSQL(List<Object> objects) {
    sqlBackend =
        SettingsService.getValueAsString(objects)
            .map(SQLBackend::valueOf)
            .orElse(SQLBackend.DB2_SERVER);
  }

  private void updateFeatures(JsonArray featuresArray) {
    for (JsonElement element : featuresArray) {
      String feature = element.getAsString();
      features.add(EmbeddedCodeNode.Language.valueOf(feature));
    }
  }

  private void updateDialects(JsonElement dialectsSettings) {
    if (dialectsSettings.isJsonArray())
      dialects =
          Streams.stream((JsonArray) dialectsSettings)
              .map(JsonElement::getAsString)
              .collect(toList());
  }
}
