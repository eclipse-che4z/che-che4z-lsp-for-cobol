/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.strategy;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

/**
 * This class encapsulates the logic of retrieving the special tokens from the
 * SpecialTokenHandling.properties file
 */
@Slf4j
@UtilityClass
class SpecialTokenReplacing {

  private static final String SPECIAL_TOKEN_HANDLING_FILEPATH = "SpecialTokenHandling.properties";

  /**
   * Load the mapping of replacing for the special tokens
   *
   * @return map of tokens and their replacement
   */
  Map<String, String> loadSpecialTokenMapping() {
    Properties props = new Properties();
    try (InputStream ins =
        SpecialTokenReplacing.class.getResourceAsStream(SPECIAL_TOKEN_HANDLING_FILEPATH)) {
      props.load(new InputStreamReader(ins, StandardCharsets.UTF_8));
    } catch (IOException exception) {
      LOG.error("SpecialTokenHandling didn't load.", exception);
    }
    return props.entrySet().stream()
        .collect(Collectors.toMap(it -> it.getKey().toString(), it -> it.getValue().toString()));
  }
}
