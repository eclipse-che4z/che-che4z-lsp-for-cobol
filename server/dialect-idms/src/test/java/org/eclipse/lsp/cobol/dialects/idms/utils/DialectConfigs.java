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
package org.eclipse.lsp.cobol.dialects.idms.utils;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;

/** IDMS related config getter */
@UtilityClass
public class DialectConfigs {
  public AnalysisConfig getIDMSAnalysisConfig() {
    return new AnalysisConfig(
            CopybookProcessingMode.DISABLED,
        ImmutableList.of(IdmsDialect.NAME), true,
        ImmutableList.of(),
        ImmutableMap.of());
  }
}
