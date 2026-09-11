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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.utils;

import com.google.common.collect.ImmutableMap;
import java.io.*;
import java.net.URI;
import java.nio.file.FileSystemNotFoundException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

/** Read keywords from a resource stream */
@Slf4j
@UtilityClass
public class KeywordsUtils {

  /**
   * Reads keywords from resource file
   *
   * @param classLoader classLoader to load the resource from
   * @param fileName is a file name
   * @return key/value keywords with descriptions map
   */
  public Map<String, String> getKeywords(ClassLoader classLoader, String fileName) {
    try (InputStream stream = classLoader.getResourceAsStream(fileName)) {
      return readKeywords(stream);
    } catch (NullPointerException | IOException e) {
      LOG.error("Unable to load the Keywords file {}: {}", fileName, e.getMessage());
    }
    return ImmutableMap.of();
  }

  /**
   * Reads keywords from resource file
   *
   * @param fileName is a file name
   * @return key/value keywords with descriptions map
   */
  public Map<String, String> getKeywords(String fileName) {
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    return getKeywords(classLoader, fileName);
  }

  /**
   * Reads keywords from a file URI.
   *
   * @param uri the keywords file URI, or null if no keywords are provided
   * @return key/value keywords with descriptions map, or an empty map if the file cannot be loaded
   */
  public Map<String, String> getKeywords(URI uri) {
    if (uri == null) {
      return ImmutableMap.of();
    }
    try (InputStream stream = Files.newInputStream(Paths.get(uri))) {
      return readKeywords(stream);
    } catch (IOException | IllegalArgumentException | FileSystemNotFoundException e) {
      LOG.error("Unable to load the Keywords file {}: {}", uri, e.getMessage());
    }
    return ImmutableMap.of();
  }

  private Map<String, String> readKeywords(InputStream stream) throws IOException {
    Properties props = new Properties();
    props.load(stream);
    return props.entrySet().stream()
        .collect(
            Collectors.toMap(
                entry -> entry.getKey().toString(),
                entry -> processDescription(entry.getValue().toString())));
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
