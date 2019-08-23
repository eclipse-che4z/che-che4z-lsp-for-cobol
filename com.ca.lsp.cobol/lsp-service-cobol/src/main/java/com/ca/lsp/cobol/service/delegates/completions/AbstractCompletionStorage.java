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
package com.ca.lsp.cobol.service.delegates.completions;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;

public abstract class AbstractCompletionStorage {
  private static final Logger LOG = LogManager.getLogger(AbstractCompletionStorage.class);
  private Map<String, String> storage = new HashMap<>();

  AbstractCompletionStorage() {
    Properties props = new Properties();
    try (InputStream propertiesStream = getInputStream()) {
      props.load(propertiesStream);
    } catch (IOException e) {
      LOG.error(e.getMessage());
    }
    fillInStorage(props);
    LOG.info("The properties file has been loaded successfully");
  }

  /**
   * Return a full set of the registered keywords
   *
   * @return A set of keywords
   */
  Set<String> getLabels() {
    return storage.keySet();
  }

  /**
   * Return a description for given keywords or null not found
   *
   * @param label - Keyword to find a description
   * @return description
   */
  String getInformationFor(String label) {
    return storage.get(label);
  }

  private void fillInStorage(Properties props) {
    this.storage =
        props.entrySet().stream()
            .collect(
                Collectors.toMap(
                    entry -> entry.getKey().toString(),
                    entry -> processDescription(entry.getValue().toString())));
  }
  /**
   * If description consist of several rows, then line breaks symbols should be replaced with actual
   * ones.
   *
   * @param desc - Raw description retrieved from storage
   * @return THe description properly split in lines
   */
  private String processDescription(String desc) {
    return desc.replace("<br>", "\r\n\r\n");
  }

  protected abstract InputStream getInputStream();
}
