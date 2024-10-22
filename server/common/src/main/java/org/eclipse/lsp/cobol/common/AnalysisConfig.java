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

package org.eclipse.lsp.cobol.common;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import java.util.*;
import lombok.Value;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;

/**
 * This dto class is used to hold config data for analysis, such as supported features, dialects and
 * copybook configuration
 */
@Value
public class AnalysisConfig {
  CopybookProcessingMode copybookProcessingMode;
  List<String> dialects;
  boolean isCicsTranslatorEnabled;
  boolean collectAstChanges;
  List<DialectRegistryItem> dialectRegistry;
  Map<String, JsonElement> dialectsSettings;
  List<String> compilerOptions = new ArrayList<>();

  /**
   * Create the default language features config, containing all features and the given copybook
   * processing mode
   *
   * @param mode the mode of copybook processing for this analysis
   * @return the analysis configuration
   */
  public static AnalysisConfig defaultConfig(CopybookProcessingMode mode) {
    return new AnalysisConfig(
            mode,
            ImmutableList.of(),
            true,
            false,
            ImmutableList.of(),
            ImmutableMap.of("target-sql-backend", new Gson().toJsonTree(SQLBackend.DB2_SERVER)));
  }
  public static AnalysisConfig defaultConfig(CopybookProcessingMode mode, boolean collectAstChanges) {
    return new AnalysisConfig(
            mode,
            ImmutableList.of(),
            true,
            collectAstChanges,
            ImmutableList.of(),
            ImmutableMap.of("target-sql-backend", new Gson().toJsonTree(SQLBackend.DB2_SERVER)));
  }
}
