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
import com.google.common.collect.ImmutableMap;
import com.google.gson.JsonElement;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import lombok.AllArgsConstructor;
import lombok.Value;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;

/** This interface handles the request for configurations from the client settings */
public interface ConfigurationService {

  /**
   * Get a configuration for the analysis using the settings file and the given copybook processing
   * mode. Blocks the execution until the configuration is resolved.
   *
   * @param scopeURI scope URI
   * @param mode the mode of copybook processing for this analysis
   * @return the analysis configuration
   */
  AnalysisConfig getConfig(String scopeURI, CopybookProcessingMode mode);

  /**
   * Gets a client configuration for the Subroutine settings
   *
   * @return the list from the Subroutine directories defined in user settings
   */
  List<String> getSubroutineDirectories();

  /**
   * Get a list configuration for a document.
   * For example. "configuration-example" : ["setting1","setting2"]
   *
   * <p>NOTE: This method won't work for a single element setting like
   * "configuration-example" : "setting1"
   *
   * @param documentUri document URI for which configuration needs to be fetched.
   * @param section the required section in the client configuration.
   * @return the list from the copybook directories defined in user settings
   */
  CompletableFuture<List<String>> getListConfiguration(String documentUri, String section);

  /**
   * Get a list of watching folders for the provided dialects.
   *
   * @return List of watching folders for the provided dialects
   */
  List<String> getDialectWatchingFolders();

  /**
   * A value class to store the configuration. Reflects the required values from the settings.json
   * file
   */
  @Value
  @AllArgsConstructor
  class ConfigurationEntity {
    List<String> dialects;
    List<String> subroutines;
    boolean cicsTranslatorEnabled;
    List<DialectRegistryItem> dialectRegistry;
    List<String> compilerOptions;
//    CobolProgramLayout layout;
    Map<String, JsonElement> dialectsSettings;

    public ConfigurationEntity() {
      dialects = ImmutableList.of();
      subroutines = ImmutableList.of();
      cicsTranslatorEnabled = true;
      dialectRegistry = ImmutableList.of();
      compilerOptions = ImmutableList.of();
      dialectsSettings = ImmutableMap.of();
//      layout = new CobolProgramLayout();
    }
  }
}
