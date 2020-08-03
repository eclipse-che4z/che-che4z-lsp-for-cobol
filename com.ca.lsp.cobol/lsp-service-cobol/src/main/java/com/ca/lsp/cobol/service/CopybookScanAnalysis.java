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
 *
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

/** This enum class used to track text synchronization type for the processed document. */
public enum CopybookScanAnalysis {
  ENABLED,
  DISABLED;

  /**
   * @param uri of the document opened in the editor by the client
   * @param textDocSyncType define the document sync mode that could be [{@link
   *     TextDocumentSyncType#DID_OPEN}|{@link TextDocumentSyncType#DID_CHANGE}]
   * @return A value of that could be [{@link CopybookScanAnalysis#ENABLED}|{@link
   *     CopybookScanAnalysis#DISABLED}]
   */
  public static CopybookScanAnalysis getCopybookScanAnalysis(String uri, String textDocSyncType) {
    // TODO: use NIO to check the library
    return (!(uri.contains(".c4z") && uri.contains(".extsrc")))
        ? getCopybookScanAnalysisByDocSync(textDocSyncType)
        : DISABLED;
  }

  private static CopybookScanAnalysis getCopybookScanAnalysisByDocSync(String textDocSyncType) {
    return textDocSyncType.equalsIgnoreCase("DID_OPEN") ? ENABLED : DISABLED;
  }
}
