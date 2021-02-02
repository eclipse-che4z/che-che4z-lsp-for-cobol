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

package com.broadcom.lsp.cobol.core.model.variables;

import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;

import static java.util.stream.Collectors.toMap;

/**
 * This enum class represents all the supported usage formats. UNDEFINED means that the usage format
 * cannot be determined.
 */
public enum UsageFormat {
  BINARY,
  COMP,
  COMP_1,
  COMP_2,
  COMP_3,
  COMP_4,
  COMP_5,
  COMPUTATIONAL,
  COMPUTATIONAL_1,
  COMPUTATIONAL_2,
  COMPUTATIONAL_3,
  COMPUTATIONAL_4,
  COMPUTATIONAL_5,
  DISPLAY,
  DISPLAY_1,
  INDEX,
  NATIONAL,
  UTF_8,
  OBJECT_REFERENCE,
  PACKED_DECIMAL,
  POINTER,
  POINTER_32,
  PROCEDURE_POINTER,
  FUNCTION_POINTER,
  UNDEFINED;

  private static final Map<String, UsageFormat> MAP;

  static {
    MAP =
        Arrays.stream(values())
            .collect(toMap(it -> it.toString().replace("_", "-"), Function.identity()));
  }

  /**
   * Determine the usage format by the given text. Return UNDEFINED if the value cannot be found.
   *
   * @param text - string describing the required usage format
   * @return an {@link UsageFormat} instance of required type or UNDEFINED
   */
  public static UsageFormat of(String text) {
    return MAP.getOrDefault(text.toUpperCase(), UNDEFINED);
  }
}
