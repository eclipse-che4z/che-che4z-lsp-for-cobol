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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.service.SettingsService;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/** This class is a provider for Cobol Snippets */
@Slf4j
@Singleton
public class Snippets extends CompletionStorage<SnippetsModel> {
  private static final String SNIPPETS_FILE_PATH = "LanguageSnippets.json";
  private static final String SNIPPETS_IDMS_FILE_PATH = "LanguageSnippetsIDMS.json";
  private static final String SNIPPETS_DACO_FILE_PATH = "LanguageSnippetsDaCo.json";

  private Map<String, SnippetsModel> cobolSnippets = new HashMap<>();
  private Map<String, SnippetsModel> idmsSnippets = new HashMap<>();

  @Inject
  Snippets(SettingsService settingsService) {
    super(settingsService);
  }

  @Override
  protected Map<String, SnippetsModel> getInputStream(List<String> dialectList) {
    Gson gson = new Gson();
    Reader reader;
    try {
      reader =
              new BufferedReader(
                      new InputStreamReader(
                              Objects.requireNonNull(Snippets.class.getResourceAsStream(SNIPPETS_FILE_PATH)),
                              StandardCharsets.UTF_8));
      cobolSnippets =
              gson.fromJson(reader, new TypeToken<Map<String, SnippetsModel>>() {}.getType());
      reader.close();
      if (!dialectList.isEmpty()) {
        idmsSnippets = getSnippetsModelMap(SNIPPETS_IDMS_FILE_PATH, cobolSnippets);
        if (dialectList.size() == 2
                || (dialectList.size() == 1 && dialectList.contains(DaCoDialect.NAME))) {
          return getSnippetsModelMap(SNIPPETS_DACO_FILE_PATH, idmsSnippets);
        } else return idmsSnippets;
      } else return cobolSnippets;
    } catch (IOException e) {
      LOG.error(" Error reading snippets file {}", e.getMessage());
    }

    return cobolSnippets;
  }

  private Map<String, SnippetsModel> getSnippetsModelMap(
          String snippetFileName, Map<String, SnippetsModel> mergeMap) throws IOException {
    Gson gson = new Gson();
    Reader reader =
            new BufferedReader(
                    new InputStreamReader(
                            Objects.requireNonNull(Snippets.class.getResourceAsStream(snippetFileName)),
                            StandardCharsets.UTF_8));
    Map<String, SnippetsModel> snippets =
            gson.fromJson(reader, new TypeToken<Map<String, SnippetsModel>>() {}.getType());
    Map<String, SnippetsModel> finalSnippets = new HashMap<>(mergeMap);
    snippets.forEach(
            (key, value) ->
                    finalSnippets.merge(
                            key,
                            value,
                            (v1, v2) ->
                                    new SnippetsModel(
                                            v1.getPrefix(), v2.getBody(), v2.getDescription(), v2.getScope())));
    reader.close();
    return finalSnippets;
  }
}
