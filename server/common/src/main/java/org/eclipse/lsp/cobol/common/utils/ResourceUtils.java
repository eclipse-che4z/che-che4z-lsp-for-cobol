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

import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Resource utils
 */
@UtilityClass
public class ResourceUtils {
  /**
   * Get input stream of resource file
   * @param filename is a name if a file
   * @return input stream
   * @throws FileNotFoundException otherwise
   */
  public InputStream getInputStream(String filename) throws FileNotFoundException {
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    return classLoader.getResourceAsStream(filename);
  }
}
