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
  private static final String SNIPPETS_FILE_PATH = "LanguageSnippetsCobol.json";
  private static final String SNIPPETS_IDMS_FILE_PATH = "LanguageSnippetsIDMS.json";
  private static final String SNIPPETS_DACO_FILE_PATH = "LanguageSnippetsDaCo.json";

  @Inject
  Snippets(SettingsService settingsService) {
    super(settingsService);
  }

  @Override
  protected Map<String, SnippetsModel> getInputStream(List<String> dialectList) {
    Gson gson = new Gson();
    Reader reader;
    Map<String, SnippetsModel> cobolSnippets = new HashMap<>();
    Map<String, SnippetsModel> idmsSnippets;
    try {
      reader = getReader(SNIPPETS_FILE_PATH);
      cobolSnippets = getCobolSnippets(gson, reader);
      reader.close();

      if (!dialectList.isEmpty()) {
        idmsSnippets = getMergedSnippetsModelMap(SNIPPETS_IDMS_FILE_PATH, cobolSnippets);
        if (dialectList.size() == 2
            || (dialectList.size() == 1 && dialectList.contains(DaCoDialect.NAME))) {
          return getMergedSnippetsModelMap(SNIPPETS_DACO_FILE_PATH, idmsSnippets);
        } else return idmsSnippets;
      } else return cobolSnippets;
    } catch (IOException e) {
      LOG.error(" Error reading snippets file {}", e.getMessage());
    }

    return cobolSnippets;
  }

  private Map<String, SnippetsModel> getMergedSnippetsModelMap(
      String snippetFileName, Map<String, SnippetsModel> mergeMap) throws IOException {
    Gson gson = new Gson();
    Reader reader = getReader(snippetFileName);
    Map<String, SnippetsModel> snippets = getCobolSnippets(gson, reader);
    Map<String, SnippetsModel> finalSnippets = new HashMap<>(mergeMap);

    snippets.forEach(
        (key, value) ->
            finalSnippets.merge(
                key,
                value,
                (v1, v2) ->
                    new SnippetsModel(
                        v1.getKey(),
                        v2.getPrefix(),
                        v2.getBody(),
                        v2.getDescription())));
    reader.close();
    return finalSnippets;
  }

  private BufferedReader getReader(String resourceFile) {
    return new BufferedReader(
        new InputStreamReader(
            Objects.requireNonNull(Snippets.class.getResourceAsStream(resourceFile)),
            StandardCharsets.UTF_8));
  }

  private Map<String, SnippetsModel> getCobolSnippets(Gson gson, Reader reader) {
    Map<String, SnippetsModel> snippetMaps =
        gson.fromJson(reader, new TypeToken<Map<String, SnippetsModel>>() {}.getType());
    snippetMaps.forEach((key, value) -> value.setKey(key));
    return snippetMaps;
  }
}
