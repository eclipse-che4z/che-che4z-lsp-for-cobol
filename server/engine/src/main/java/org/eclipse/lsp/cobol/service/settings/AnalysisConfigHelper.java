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

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;

/**
 * AnalysisConfig Helper class
 */
@UtilityClass
class AnalysisConfigHelper {
  /**
   * Create the analysis config based on the given copybook processing mode and the configuration
   * entity from the settings
   *
   * @param mode the mode of copybook processing for this analysis
   * @param entity the configuration from the settings file
   * @return the analysis configuration
   */
  public AnalysisConfig fromConfigEntity(
      CopybookProcessingMode mode, ConfigurationService.ConfigurationEntity entity) {

    AnalysisConfig analysisConfig = new AnalysisConfig(mode, entity.getDialects(),
            entity.isCicsTranslatorEnabled(),
            entity.getDialectRegistry(),
            entity.getDialectsSettings());
    analysisConfig.getCompilerOptions().addAll(entity.getCompilerOptions());
    return analysisConfig;
  }
}
