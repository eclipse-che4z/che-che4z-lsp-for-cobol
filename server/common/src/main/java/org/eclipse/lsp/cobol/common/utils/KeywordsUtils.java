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

import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

/**
 * Read keywords from a resource stream
 */
@Slf4j
@UtilityClass
public class KeywordsUtils {

  /**
   * Reads keywords from resource file
   * @param classLoader classLoader to load the resource from
   * @param fileName is a file name
   * @return key/value keywords with descriptions map
   */
  public Map<String, String> getKeywords(ClassLoader classLoader, String fileName) {
    Properties props = new Properties();
    try {
      props.load(classLoader.getResourceAsStream(fileName));
      return props.entrySet().stream()
          .collect(
              Collectors.toMap(
                  entry -> entry.getKey().toString(),
                  entry -> processDescription(entry.getValue().toString())));
    } catch (NullPointerException | IOException e) {
      LOG.error("Unable to load the Keywords file {}: {}", fileName, e.getMessage());
    }
    return ImmutableMap.of();
  }

  /**
   * Reads keywords from resource file
   * @param fileName is a file name
   * @return key/value keywords with descriptions map
   */
  public Map<String, String> getKeywords(String fileName) {
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    return getKeywords(classLoader,  fileName);
  }

  /**
   * Replace line break tags with actual line breaks
   *
   * @param desc - raw description retrieved from storage
   * @return the description properly split in lines
   */
  private String processDescription(String desc) {
    return desc.replace("<br>", "\r\n\r\n");
  }

}
