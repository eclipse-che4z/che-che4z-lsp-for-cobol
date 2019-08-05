/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.strategy;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

@Slf4j
public class Messages {
  private Map<String, String> customMessages = new HashMap<>();
  private static final String MESSAGES_FILE_PATH = "Messages.txt";

  public String getValueForKey(String key) {
    return customMessages.get(key);
  }

  Messages() {
    Properties props = new Properties();
    try (InputStream propertiesStream = Messages.class.getResourceAsStream(MESSAGES_FILE_PATH)) {
      props.load(propertiesStream);
    } catch (IOException e) {
      LOG.error(e.getMessage());
    }
    fillMap(props);
  }

  private void fillMap(Properties props) {
    this.customMessages =
        props
            .entrySet()
            .stream()
            .collect(
                Collectors.toMap(
                    entry -> entry.getKey().toString(), entry -> entry.getValue().toString()));
  }
}
