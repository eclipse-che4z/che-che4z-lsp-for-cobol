/*
 * Copyright (c) 2020 Broadcom.
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
package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;

/**
 * Provide API definition to search for copybooks files and define the workspace folder opened in
 * the client when the LSP server triggered.
 */
public interface CopybookService extends EventObserver<DataEvent> {
  /** Remove all the stored copybook names and URIs. */
  void invalidateURICache();
}
