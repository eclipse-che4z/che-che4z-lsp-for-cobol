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
package org.eclipse.lsp.cobol.dialects.daco.utils;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;

import java.util.List;
import java.util.Map;

/** DaCo related config utility */
@UtilityClass
public class DialectConfigs {

  /**
   * Provides DaCo dialect configuration
   *
   * @return DaCo dialect configuration
   */
  public AnalysisConfig getDaCoAnalysisConfig() {
    return new AnalysisConfig(
        new CopybookConfig(
            CopybookProcessingMode.DISABLED,
            SQLBackend.DATACOM_SERVER,
            ImmutableList.of("S930", "S940", "S950", "S990", "S991", "S997", "S999")),
        ImmutableList.of(),
        ImmutableList.of(DaCoDialect.NAME),
        true);
  }

  /**
   * Provides DaCo dialect configuration with specified copybook configuration
   *
   * @param copybookConfig a copybook configuration
   * @return DaCo dialect configuration
   */
  public AnalysisConfig getDaCoAnalysisConfig(CopybookConfig copybookConfig) {
    return new AnalysisConfig(
        copybookConfig,
        ImmutableList.of(),
        ImmutableList.of(DaCoDialect.NAME, IdmsDialect.NAME),
        true);
  }

  private Map<String, JsonElement> createPredefinedSectionsConfig(List<String> predefinedSections) {
    return ImmutableMap.of(
        DaCoDialect.DACO_PREDEFINED_SECTIONS, new Gson().toJsonTree(predefinedSections));
  }
}
