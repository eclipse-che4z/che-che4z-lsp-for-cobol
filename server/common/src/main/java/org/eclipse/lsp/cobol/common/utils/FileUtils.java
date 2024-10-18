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
package org.eclipse.lsp.cobol.common.utils;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Uri;

import java.util.regex.Pattern;

/**
 * File utils
 */
@UtilityClass
public class FileUtils {
  Pattern UNDER_EXT_SRC_FOLDER = Pattern.compile("file://.*?\\.c4z/\\.extsrcs/.+");
  /**
   * This method validates an URI to verify if is defined as extended document, according to a
   * regex.
   *
   * @param uri document URI opened in the client
   * @return true if the document is an extended document, false otherwise
   */
  public boolean isFileUnderExtendedSourceFolder(Uri uri) {
    // the regex will match resources in the format [file://<FOLDER>/.c4z/.extsrcs/<DOCUMENT>]
    return UNDER_EXT_SRC_FOLDER.matcher(uri.toString()).matches();
  }
}
