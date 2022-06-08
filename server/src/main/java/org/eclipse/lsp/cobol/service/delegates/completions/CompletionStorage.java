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
package org.eclipse.lsp.cobol.service.delegates.completions;

import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.SettingsService;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;

/**
 * This class represents a storage for static completion content, e.g. keywords. It provides
 * elements as strings and documentation for them if provided.
 */
@Slf4j
public abstract class CompletionStorage {
  private Map<String, String> storage = new HashMap<>();
  private List<String> dialectList = new ArrayList<>();
  @Inject private SettingsService settingsService;

  CompletionStorage() {
    resetStorage();
  }

  /**
   * Updates the storage of keywords and snippets based on enabled dialects defined in user's
   * settings
   */
  public void updateStorage() {
    settingsService.getConfiguration(DIALECTS.label).thenAccept(this::getDialects);
  }

  protected abstract InputStream getInputStream(List<String> dialectList);

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
   * Replace line break tags with actual line breaks
   *
   * @param desc - raw description retrieved from storage
   * @return the description properly split in lines
   */
  private String processDescription(String desc) {
    return desc.replace("<br>", "\r\n\r\n");
  }

  private void getDialects(List<Object> dialectObject) {
    JsonArray jsonObj = (JsonArray) dialectObject.get(0);
    this.dialectList = Streams.stream(jsonObj).map(JsonElement::getAsString).collect(toList());
    resetStorage();
  }

  private void resetStorage() {
    Properties props = new Properties();
    try (InputStream propertiesStream = getInputStream(dialectList)) {
      props.load(propertiesStream);
    } catch (IOException e) {
      LOG.error(e.getMessage());
    }
    fillInStorage(props);
    LOG.info("The properties file has been loaded successfully");
  }
}
