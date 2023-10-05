/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

/**
 * Utility class for LSP handlers
 */
@UtilityClass
@Slf4j
public class HandlerUtility {
  private static final String GIT_FS_URI = "gitfs:/";
  private static final String GIT_URI = "git:/";
  private static final String GITFS_URI_NOT_SUPPORTED = "GITFS URI not supported";

  /**
   * Check if we are interested in the document with provided uri.
   * @param uri - document uri.
   * @return true if we should continue the analysis of the document.
   */
  public boolean isUriSupported(String uri) {
    // git FS URIs are not currently supported
    if (uri.startsWith(GIT_FS_URI) || uri.startsWith(GIT_URI)) {
      LOG.warn(String.join(" ", GITFS_URI_NOT_SUPPORTED, uri));
      return false;
    }
    return true;
  }
}
