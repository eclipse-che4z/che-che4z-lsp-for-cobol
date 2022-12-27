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
package org.eclipse.lsp.cobol.service.settings;

import com.google.gson.JsonPrimitive;
import lombok.experimental.UtilityClass;

import java.util.List;
import java.util.Optional;

/**
 * Config helper class
 */
@UtilityClass
public class ConfigHelper {

  /**
   * Get config data as optional string
   *
   * @param data config response
   * @return optional string value
   */
  public Optional<String> getValueAsString(List<Object> data) {
    if (data == null || data.isEmpty()) return Optional.empty();
    Object obj = data.get(0);
    if (!(obj instanceof JsonPrimitive)) return Optional.empty();

    return Optional.of(((JsonPrimitive) obj).getAsString()).filter(it -> !it.isEmpty());
  }

}
