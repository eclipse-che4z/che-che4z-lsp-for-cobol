/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 *
 */
package com.ca.lsp.cobol.service.delegates.communications;

import org.eclipse.lsp4j.Diagnostic;

import java.util.List;
import java.util.Map;

public interface Communications {
  void notifyThatLoadingInProgress(String uri);

  void notifyThatEngineNotFound(String languageType);

  void publishDiagnostics(Map<String, List<Diagnostic>> diagnostics);

  void cancelProgressNotification(String uri);

  void notifyThatDocumentAnalysed(String uri);

  void notifyThatExtensionIsUnsupported(String extension);
}
