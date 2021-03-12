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

package org.eclipse.lsp.cobol.core.visitor;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Set;

/** This class provides keywords that are used for suggestions during the syntax check. */
@Slf4j
class KeywordSuggestions {

  @Getter private Set<String> suggestions;

  KeywordSuggestions() {
    Properties props = new Properties();
    try (InputStream keywords =
        KeywordSuggestions.class.getResourceAsStream(
            "/org/eclipse/lsp/cobol/service/delegates/completions/LanguageKeywords.txt")) {
      props.load(keywords);
      suggestions = props.stringPropertyNames();
    } catch (IOException e) {
      LOG.error("Cannot load list of the suggested keywords", e);
    }
  }
}
