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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.SettingsService;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;

/**
 * This class represents a storage for static completion content, e.g. keywords. It provides
 * elements as strings and documentation for them if provided.
 */
@Slf4j
public abstract class CompletionStorage<T> {
  private List<String> dialectType = ImmutableList.of();
  private Map<String, T> storage;
  private SettingsService settingsService;

  CompletionStorage(SettingsService settingsService) {
    this.settingsService = settingsService;
    resetStorage();
  }

  /** Updates the storage of keywords based on enabled dialects defined in user's settings */
  public void updateStorage() {
    this.settingsService.fetchTextConfiguration(DIALECTS.label).thenAccept(this::updateDialects);
  }

  protected abstract Map<String, T> getDataMap(List<String> dialectType);

  /**
   * Return a full set of the registered keywords
   *
   * @return A set of keywords
   */
  Set<String> getLabels() {
    resetStorage();
    return storage.keySet();
  }

  /**
   * Return a description for given keywords or null not found
   *
   * @param label - Keyword to find a description
   * @return description
   */
  String getInformationFor(String label) {
    return (String) storage.get(label);
  }

  private void fillInStorage(Map<String, T> props) {
    this.storage =
        props.entrySet().stream().collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
  }

  private void updateDialects(List<String> dialects) {
    this.dialectType = setDialect(dialects);
    resetStorage();
  }

  private List<String> setDialect(JsonArray dialectList) {
    return Streams.stream(dialectList).map(JsonElement::getAsString).collect(toList());
  }

  private void resetStorage() {
    Map<String, T> dataMap;
    dataMap = getDataMap(this.dialectType);
    fillInStorage(dataMap);
    LOG.info("The properties file has been loaded successfully");
  }
}
