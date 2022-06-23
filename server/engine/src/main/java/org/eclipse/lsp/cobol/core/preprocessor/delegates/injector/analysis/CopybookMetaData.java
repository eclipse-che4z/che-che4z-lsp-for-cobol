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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis;

import lombok.Builder;
import lombok.Value;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/**
 * This value class represents the metadata of the analysing copybook that is retrieved from the
 * context
 */
@Value
@Builder
class CopybookMetaData {
  CopybookName copybookName;
  String copybookId;
  String documentUri;
  CopybookConfig config;
  ParserRuleContext context;
  Locality contextLocality;
  Locality nameLocality;

  /**
   * Build a copybook usage instance from the metadata
   *
   * @return according copybook usage
   */
  CopybookUsage toCopybookUsage() {
    return new CopybookUsage(copybookName, copybookId, nameLocality);
  }
}
