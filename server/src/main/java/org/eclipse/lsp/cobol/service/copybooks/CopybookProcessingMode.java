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
package org.eclipse.lsp.cobol.service.copybooks;

import static org.eclipse.lsp.cobol.service.utils.WorkspaceFileService.isFileUnderExtendedSourceFolder;

/** This enum class used to allow or not the copybook analysis for the processed document. */
public enum CopybookProcessingMode {
  ENABLED(true, true, false),
  DISABLED(false, false, false),
  ENABLED_VERBOSE(true, true, true),
  SKIP(true, false, false);

  public final boolean analyze;
  public final boolean download;
  public final boolean userInteraction;

  CopybookProcessingMode(boolean analyze, boolean download, boolean userInteraction) {
    this.analyze = analyze;
    this.download = download;
    this.userInteraction = userInteraction;
  }

  /**
   * This method disables copybook management if the file is an extended source file. Otherwise it
   * will return provided processing mode.
   *
   * @param uri of the document opened in the editor by the client
   * @param copybookProcessingMode desired processing mode
   * @return a final copybook processing mode based on the file type.
   */
  public static CopybookProcessingMode getCopybookProcessingMode(
      String uri, CopybookProcessingMode copybookProcessingMode) {
    return isFileUnderExtendedSourceFolder(uri) ? DISABLED : copybookProcessingMode;
  }

}
