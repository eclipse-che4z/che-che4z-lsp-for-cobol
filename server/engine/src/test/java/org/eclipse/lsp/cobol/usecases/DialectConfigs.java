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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.Gson;
import java.util.List;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;

/** IDMS and MAID related getter */
@UtilityClass
public class DialectConfigs {
  public AnalysisConfig getIDMSAnalysisConfig() {
    return new AnalysisConfig(
            CopybookProcessingMode.DISABLED,
        ImmutableList.of("IDMS"), true,
        ImmutableList.of(),
        ImmutableMap.of());
  }

  /**
   * Provides DaCo dialect configuration
   * @return DaCo dialect configuration
   */
  public AnalysisConfig getDaCoAnalysisConfig() {
    List<String> list = ImmutableList.of("S930", "S940", "S950", "S990", "S991", "S997", "S999");

    return new AnalysisConfig(
            CopybookProcessingMode.DISABLED,
            ImmutableList.of("DaCo", "IDMS"), true,
            ImmutableList.of(),
            ImmutableMap.of("daco.predefined-sections", new Gson().toJsonTree(list),
                    "target-sql-backend", new Gson().toJsonTree(SQLBackend.DB2_SERVER)));
  }
}
