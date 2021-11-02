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

import lombok.NonNull;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;

import java.util.Arrays;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * This dto class is used to hold config data for analysis features processing (SQL, CICS, etc.)
 */
@Value
public class AnalysisConfig {
  Set<EmbeddedCodeNode.Language> features;
  @NonNull CopybookConfig copybookConfig;

  /**
   * Creates the default language features config, containing all features and specified copybook config
   * @param copybookConfig contains copybook config information
   * @return the language config object
   */
  public static AnalysisConfig defaultConfig(CopybookConfig copybookConfig) {
    return new AnalysisConfig(Arrays.stream(EmbeddedCodeNode.Language.values()).collect(Collectors.toSet()), copybookConfig);
  }

}
