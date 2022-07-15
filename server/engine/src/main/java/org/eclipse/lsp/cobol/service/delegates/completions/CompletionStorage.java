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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.service.SettingsService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;

/**
 * This class represents a storage for static completion content, e.g. keywords. It provides
 * elements as strings and documentation for them if provided.
 */
@Slf4j
public abstract class CompletionStorage<T> {
  private Map<String, T> storage;
  private List<String> dialectList = new ArrayList<>();
  private SettingsService settingsService;
  private String dialectType = "COBOL";

  CompletionStorage(SettingsService settingsService) {
    this.settingsService = settingsService;
    resetStorage();
  }

  /**
   * Updates the storage of keywords and snippets based on enabled dialects defined in user's
   * settings
   */
  public void updateStorage() {
    this.settingsService.fetchConfiguration(DIALECTS.label).thenAccept(this::setDialects);
  }

  protected abstract Map<String, T> getDataMap(String dialectType);

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
   *
   */
  String getInformationFor(String label) {
    return (String) storage.get(label);
  }

  /**
   * Return a snippet for given label or null not found
   *
   * @param label - Keyword to find a description
   * @return description
   */
  SnippetsModel getSnippet(String label) {
    return (SnippetsModel) storage.get(label);
  }

  private void fillInStorage(Map<String, T> props) {
    this.storage =
            props.entrySet().stream().collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
  }

  private void setDialects(List<Object> dialectObject) {
    JsonArray jsonObj = (JsonArray) dialectObject.get(0);
    this.dialectList = Streams.stream(jsonObj).map(JsonElement::getAsString).collect(toList());
    if (!dialectList.isEmpty())
      this.dialectType = dialectList.contains(DaCoDialect.NAME) ? DaCoDialect.NAME : IdmsDialect.NAME;
    resetStorage();
  }

  private void resetStorage() {
    Map<String, T> dataMap;
    dataMap = getDataMap(this.dialectType);
    fillInStorage(dataMap);
    LOG.info("The properties file has been loaded successfully");
  }
}
