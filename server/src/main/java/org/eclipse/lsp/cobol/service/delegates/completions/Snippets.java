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

import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;

import java.io.InputStream;
import java.io.SequenceInputStream;
import java.util.List;

/** This class is a provider for Cobol Snippets */
@Singleton
public class Snippets extends CompletionStorage {
  private static final String SNIPPETS_FILE_PATH = "LanguageSnippets.txt";
  private static final String SNIPPETS_IDMS_FILE_PATH = "LanguageSnippetsIDMS.txt";
  private static final String SNIPPETS_DACO_FILE_PATH = "LanguageSnippetsDaCo.txt";

  @Override
  protected InputStream getInputStream(List<String> dialectList) {
    if (!dialectList.isEmpty()
        && dialectList.contains(IdmsDialect.NAME)
        && dialectList.contains(DaCoDialect.NAME)) {
      return new SequenceInputStream(
          Snippets.class.getResourceAsStream(SNIPPETS_FILE_PATH),
          new SequenceInputStream(
              Snippets.class.getResourceAsStream(SNIPPETS_IDMS_FILE_PATH),
              Snippets.class.getResourceAsStream(SNIPPETS_DACO_FILE_PATH)));
    } else if (!dialectList.isEmpty() && dialectList.contains(IdmsDialect.NAME)) {
      return new SequenceInputStream(
          Snippets.class.getResourceAsStream(SNIPPETS_FILE_PATH),
          Snippets.class.getResourceAsStream(SNIPPETS_IDMS_FILE_PATH));
    } else if (!dialectList.isEmpty() && dialectList.contains(DaCoDialect.NAME)) {
      return new SequenceInputStream(
          Snippets.class.getResourceAsStream(SNIPPETS_FILE_PATH),
          Snippets.class.getResourceAsStream(SNIPPETS_DACO_FILE_PATH));
    } else return Snippets.class.getResourceAsStream(SNIPPETS_FILE_PATH);
  }
}
