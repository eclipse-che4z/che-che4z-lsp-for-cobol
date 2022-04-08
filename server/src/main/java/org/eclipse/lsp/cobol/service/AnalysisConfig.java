/*
 * Copyright (c) 2021 Broadcom.
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
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;

import java.util.Arrays;
import java.util.List;

/**
 * This dto class is used to hold config data for analysis, such as supported features, dialects and
 * copybook configuration
 */
@Value
public class AnalysisConfig {
  CopybookConfig copybookConfig;
  List<EmbeddedCodeNode.Language> features;
  List<String> dialects;

  /**
   * Create the default language features config, containing all features and the given copybook
   * processing mode
   *
   * @param mode the mode of copybook processing for this analysis
   * @return the analysis configuration
   */
  public static AnalysisConfig defaultConfig(CopybookProcessingMode mode) {
    return new AnalysisConfig(
        new CopybookConfig(mode, SQLBackend.DB2_SERVER, ImmutableList.of()),
        Arrays.asList(EmbeddedCodeNode.Language.values()),
        ImmutableList.of());
  }

  /**
   * Create the analysis config based on the given copybook processing mode and the configuration
   * entity from the settings
   *
   * @param mode the mode of copybook processing for this analysis
   * @param entity the configuration from the settings file
   * @return the analysis configuration
   */
  public static AnalysisConfig fromConfigEntity(
      CopybookProcessingMode mode, ConfigurationService.ConfigurationEntity entity) {
    CopybookConfig copybookConfig = new CopybookConfig(mode, entity.getSqlBackend(), entity.getPredefinedLabels());

    return new AnalysisConfig(
        copybookConfig,
        entity.getFeatures(),
        entity.getDialects());
  }
}
