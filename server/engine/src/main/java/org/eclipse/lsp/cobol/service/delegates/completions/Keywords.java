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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.utils.KeywordsUtils;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.service.settings.SettingsService;

import java.util.*;

/** This class is a provider for Cobol keywords and their descriptions */
@Singleton
@Slf4j
public class Keywords extends CompletionStorage<String> {
  private static final String KEYWORDS_FILE_PATH = "LanguageKeywords.txt";

  private final DialectService dialectService;

  @Inject
  Keywords(SettingsService settingsService, DialectService dialectService) {
    super(settingsService);
    this.dialectService = dialectService;
  }

  @Override
  protected Map<String, String> getDataMap(List<String> dialectTypes) {
    Map<String, String> result = new HashMap<>(KeywordsUtils.getKeywords(KEYWORDS_FILE_PATH));

    dialectTypes.forEach(
        dialectType -> result.putAll(dialectService.getDialectByName(dialectType)
                .map(CobolDialect::getKeywords).orElse(Collections.emptyMap()))
    );

    return result;
  }

}
