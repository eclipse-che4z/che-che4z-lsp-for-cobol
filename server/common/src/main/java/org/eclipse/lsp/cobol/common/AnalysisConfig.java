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
 *    Broadcom - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.common;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import java.util.*;
import lombok.Setter;
import lombok.Value;
import lombok.experimental.NonFinal;
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
  SqlProcessing sqlProcessing;
  SqlDecimalComma sqlDecimalCommaAllowed;
  List<DialectRegistryItem> dialectRegistry;
  Map<String, JsonElement> dialectsSettings;
  List<String> compilerOptions = new ArrayList<>();
  // Map preprocessors name to list of directives
  Map<String, List<String>> preprocessorsDirectives = new HashMap<>();
  UnusedVariableSeverity unusedVariableSeverity = new UnusedVariableSeverity();
  @Setter @NonFinal AnalysisMode analysisMode;

  public AnalysisConfig(
      CopybookProcessingMode copybookProcessingMode,
      List<String> dialects,
      boolean isCicsTranslatorEnabled,
      boolean collectAstChanges,
      SqlProcessing sqlProcessing,
      SqlDecimalComma sqlDecimalCommaAllowed,
      List<DialectRegistryItem> dialectRegistry,
      Map<String, JsonElement> dialectsSettings) {
    this.copybookProcessingMode = copybookProcessingMode;
    this.dialects = dialects;
    this.isCicsTranslatorEnabled = isCicsTranslatorEnabled;
    this.collectAstChanges = collectAstChanges;
    this.sqlProcessing = sqlProcessing;
    this.sqlDecimalCommaAllowed = sqlDecimalCommaAllowed;
    this.dialectRegistry = dialectRegistry;
    this.dialectsSettings = dialectsSettings;
    this.analysisMode = AnalysisMode.ADVANCED;
  }

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
        SqlProcessing.ENABLED,
        SqlDecimalComma.DISABLED,
        ImmutableList.of(),
        ImmutableMap.of("target-sql-backend", new Gson().toJsonTree(SQLBackend.DB2_SERVER)));
  }

  public static AnalysisConfig defaultConfig(
      CopybookProcessingMode mode, boolean collectAstChanges) {
    return new AnalysisConfig(
        mode,
        ImmutableList.of(),
        true,
        collectAstChanges,
        SqlProcessing.ENABLED,
        SqlDecimalComma.DISABLED,
        ImmutableList.of(),
        ImmutableMap.of("target-sql-backend", new Gson().toJsonTree(SQLBackend.DB2_SERVER)));
  }
}
