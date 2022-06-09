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

import com.google.common.collect.ImmutableMap;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;

import java.io.IOException;
import java.io.InputStream;
import java.io.SequenceInputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

/** This class is a provider for Cobol keywords and their descriptions */
@Singleton
@Slf4j
public class Keywords extends CompletionStorage<String> {
  private static final String KEYWORDS_FILE_PATH = "LanguageKeywords.txt";
  private static final String KEYWORDS_IDMS_FILE_PATH = "LanguageKeywordsIDMS.txt";
  private static final String KEYWORDS_DACO_FILE_PATH = "LanguageKeywordsDaCo.txt";

  @Override
  protected Map<String, String> getInputStream(List<String> dialectList) {
    Properties props = new Properties();
    InputStream stream;
    if (!dialectList.isEmpty()) {
      if (dialectList.size() == 2
          || (dialectList.size() == 1 && dialectList.contains(DaCoDialect.NAME))) {
        stream =
            new SequenceInputStream(
                Keywords.class.getResourceAsStream(KEYWORDS_FILE_PATH),
                new SequenceInputStream(
                    Keywords.class.getResourceAsStream(KEYWORDS_IDMS_FILE_PATH),
                    Keywords.class.getResourceAsStream(KEYWORDS_DACO_FILE_PATH)));
      } else {
        stream =
            new SequenceInputStream(
                Keywords.class.getResourceAsStream(KEYWORDS_FILE_PATH),
                Keywords.class.getResourceAsStream(KEYWORDS_IDMS_FILE_PATH));
      }
    } else {

      stream = Keywords.class.getResourceAsStream(KEYWORDS_FILE_PATH);
    }
    try {
      props.load(stream);
      return props.entrySet().stream()
          .collect(
              Collectors.toMap(
                  entry -> entry.getKey().toString(),
                  entry -> processDescription(entry.getValue().toString())));
    } catch (IOException e) {
      LOG.error("Unable to load the Keywords file {}", e.getMessage());
    }
    return ImmutableMap.of();
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
