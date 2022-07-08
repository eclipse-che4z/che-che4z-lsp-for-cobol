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
import lombok.AllArgsConstructor;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;

import java.util.List;

/** This interface handles the request for configurations from the client settings */
public interface ConfigurationService {
  /** Update all the configurations from the client Settings */
  void updateConfigurationFromSettings();

  /**
   * Get a configuration for the analysis using the settings file and the given copybook processing
   * mode. Blocks the execution until the configuration is resolved.
   *
   * @param mode the mode of copybook processing for this analysis
   * @return the analysis configuration
   */
  AnalysisConfig getConfig(CopybookProcessingMode mode);

  /**
   *Get a Subroutine configuration for the analysis using the settings file
   * @return the list from the Subroutine directories defined in user settings
   */
  List<String> getSubroutineDirectories();

  /**
   * A value class to store the configuration. Reflects the required values from the settings.json
   * file
   */
  @Value
  @AllArgsConstructor
  class ConfigurationEntity {
    SQLBackend sqlBackend;
    List<EmbeddedCodeNode.Language> features;
    List<String> dialects;
    List<String> predefinedParagraphs;
    List<String> subroutines;

    public ConfigurationEntity() {
      sqlBackend = SQLBackend.DB2_SERVER;
      features = ImmutableList.of();
      dialects = ImmutableList.of();
      predefinedParagraphs = ImmutableList.of();
      subroutines = ImmutableList.of();
    }
  }
}
