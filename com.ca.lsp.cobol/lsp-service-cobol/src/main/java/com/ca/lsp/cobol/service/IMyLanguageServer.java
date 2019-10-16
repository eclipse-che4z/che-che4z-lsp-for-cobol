/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;

/** @author zacan01 */
public interface IMyLanguageServer extends LanguageServer {
  LanguageClient getClient();

  Runnable setSocketRemoteProxy(LanguageClient client);

  void setPipeRemoteProxy(LanguageClient client);

  String getCopybookURIList();

  String getURIByCopybookName(String copybookName);
}
