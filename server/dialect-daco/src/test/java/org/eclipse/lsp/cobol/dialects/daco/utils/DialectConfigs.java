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
import java.util.List;
import java.util.Map;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;

/** DaCo related config utility */
@UtilityClass
public class DialectConfigs {

  /**
   * Provides DaCo dialect configuration
   * @return DaCo dialect configuration
   */
  public AnalysisConfig getDaCoAnalysisConfig() {
    return new AnalysisConfig(
            CopybookProcessingMode.DISABLED,
            ImmutableList.of(DaCoDialect.NAME, IdmsDialect.NAME), true,
            ImmutableList.of(),
            createPredefinedSectionsConfig(ImmutableList.of("S930", "S940", "S950",
                "S990", "S991", "S997", "S999")));
  }

  /**
   * Provides DaCo dialect configuration with specified copybook configuration
   * @param copybookProcessingMode a copybook configuration
   * @param predefinedSections a predefined sections list
   * @return DaCo dialect configuration
   */
  public AnalysisConfig getDaCoAnalysisConfig(CopybookProcessingMode copybookProcessingMode, List<String> predefinedSections) {
    return new AnalysisConfig(copybookProcessingMode, ImmutableList.of(DaCoDialect.NAME, IdmsDialect.NAME),
        true, ImmutableList.of(), createPredefinedSectionsConfig(predefinedSections));
  }

  private Map<String, JsonElement> createPredefinedSectionsConfig(List<String> predefinedSections) {
    return ImmutableMap.of(DaCoDialect.DACO_PREDEFINED_SECTIONS, new Gson().toJsonTree(predefinedSections));
  }
}
