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
package com.ca.lsp.cobol.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * THis class is a provider for Cobol keywords and their descriptions
 *
 * @author teman02
 */
public class Keywords {
  private static final String KEYWORDS_FILE_PATH = "LanguageKeywords.txt";
  private static final Logger LOG = LogManager.getLogger(Keywords.class);
  private Map<String, String> keywordsToDescriptions = new HashMap<>();

  /**
   * Constructor that fills the Properties with content of LanguageKeywords file. Keep it
   * package-private to allow instantiation only on the server layer
   */
  Keywords() {
    Properties props = new Properties();
    try (InputStream propertiesStream = Keywords.class.getResourceAsStream(KEYWORDS_FILE_PATH)) {
      props.load(propertiesStream);
    } catch (IOException e) {
      LOG.error(e.getMessage());
    }
    fillInKeywords(props);
    LOG.info("The COBOL keywords has been loaded succesfully");
  }
  /**
   * Return a full set of the registered keywords
   *
   * @return A set of keywords
   */
  public Set<String> getKeywords() {
    return keywordsToDescriptions.keySet();
  }
  /**
   * Return a description for given keywords or null not found
   *
   * @param keyword - Keyword to find a description
   * @return description
   */
  public String getDescriptionFor(String keyword) {
    return keywordsToDescriptions.get(keyword);
  }

  private void fillInKeywords(Properties props) {
    this.keywordsToDescriptions =
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
}
