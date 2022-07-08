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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers;

import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

import java.util.Optional;

/**
 * Interface for predefined copybook's content providers
 */
public interface ContentProvider {
  /**
   * Read injected code content
   * @param copybookConfig is a copybook config
   * @param copybookName for injected code name
   * @param programDocumentUri for program document uri
   * @param documentUri for current document uri
   * @return an optional copybook model
   */
  Optional<CopybookModel> read(CopybookConfig copybookConfig, CopybookName copybookName,
                               String programDocumentUri, String documentUri);
}
