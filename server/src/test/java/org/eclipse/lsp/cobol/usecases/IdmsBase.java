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
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;

/** IDMS related getter */
@UtilityClass
public class IdmsBase {
  AnalysisConfig getAnalysisConfig() {
    return new AnalysisConfig(
        new CopybookConfig(CopybookProcessingMode.DISABLED, SQLBackend.DATACOM_SERVER, ImmutableList.of()),
        ImmutableList.of(),
        ImmutableList.of(IdmsDialect.NAME));
  }

  AnalysisConfig getAnalysisConfigWithCopybooks() {
    return new AnalysisConfig(
        new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DATACOM_SERVER, ImmutableList.of()),
        ImmutableList.of(),
        ImmutableList.of(IdmsDialect.NAME));
  }
}
