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
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.service.SettingsService;

import java.io.IOException;
import java.io.InputStream;
import java.io.SequenceInputStream;
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
  private InputStream finalStream;

  @Inject
  Keywords(SettingsService settingsService) {
    super(settingsService);
  }


  @Override
  protected Map<String, String> getDataMap(String dialectType) {
    Properties props = new Properties();
    try {
      props.load(getDataStream(dialectType));
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

  private InputStream getDataStream(String dialectType) {
    InputStream cobolStream = getInputStream(KEYWORDS_FILE_PATH);
    if (dialectType.equalsIgnoreCase(DaCoDialect.NAME)) {
      InputStream idmsStream = getSequenceStream(cobolStream, getInputStream(KEYWORDS_IDMS_FILE_PATH));
      finalStream = getSequenceStream(idmsStream, getInputStream(KEYWORDS_DACO_FILE_PATH));
    } else if (dialectType.equalsIgnoreCase(IdmsDialect.NAME)) {
      finalStream = getSequenceStream(cobolStream, getInputStream(KEYWORDS_IDMS_FILE_PATH));
    } else
      finalStream = cobolStream;

    return finalStream;
  }

  private InputStream getInputStream(String keywordFile) {
    return Keywords.class.getResourceAsStream(keywordFile);
  }

  private InputStream getSequenceStream(InputStream first, InputStream second) {
    return new SequenceInputStream(first, second);
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
