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
package org.eclipse.lsp.cobol.common.mapping;

import lombok.experimental.UtilityClass;

/**
 * Maping helper class
 */
@UtilityClass
public class MappingHelper {
  public static final String SEPARATOR = "\\r?\\n";

  /**
   * Splits text into string array
   * @param text - text to split
   * @return an array of string objects
   */
  public String[] split(String text) {
    return text.split(SEPARATOR);
  }
}
