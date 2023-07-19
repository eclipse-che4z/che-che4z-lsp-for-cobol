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
package org.eclipse.lsp.cobol.service.delegates.communications;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.MessageType;

import java.util.List;
import java.util.Map;

public interface Communications {

  void publishDiagnostics(Map<String, List<Diagnostic>> diagnostics);

  void notifyThatDocumentAnalysed(String uri);

  void notifyGeneralMessage(MessageType messageType, String errorMessage);

  void notifyProgressBegin(String uri);

  void notifyProgressReport(String uri);

  void notifyProgressEnd(String uri);

  void registerExecuteCommandCapability(List<String> capabilities, String id);

  void unregisterExecuteCommandCapability(String id);
}
