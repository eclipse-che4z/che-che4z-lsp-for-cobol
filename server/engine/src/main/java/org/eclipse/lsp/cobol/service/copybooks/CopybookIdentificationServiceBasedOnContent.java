/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import com.google.inject.Singleton;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Identifies a copybook based on the content. */
@Singleton
public class CopybookIdentificationServiceBasedOnContent implements CopybookIdentificationService {

  private final List<Pattern> patterns = new LinkedList<>();
  public CopybookIdentificationServiceBasedOnContent() {
    patterns.add(Pattern.compile(
        "(?i)^(?<sequence>.{0,6})(?<indicator>.?)\\h*(PROGRAM-ID)\\s*\\.?\\s*(?<programName>.{1,30})\\s*\\.?$",
        Pattern.MULTILINE | Pattern.CASE_INSENSITIVE));
    patterns.add(Pattern.compile("(?i)^(?<sequence>.{0,6})(?<indicator>.?)\\s*((IDENTIFICATION|ID)\\s+DIVISION)\\s*\\.",
        Pattern.MULTILINE | Pattern.CASE_INSENSITIVE));
  }
  /**
   * Identifies a copybook based on the content. If the text contains a valid program-id, we detect
   * it as a cobol program, else it's a copybook.
   *
   * @param uri of the document
   * @param text of the document
   * @param config is a config
   * @return True if it's a copybook. False otherwise
   */
  @Override
  public boolean isCopybook(String uri, String text, List<String> config) throws UndeterminedDocumentException {
    String copybookContent = Optional.ofNullable(text).orElse("");
    for (Pattern pattern : patterns) {
      Matcher matcher = pattern.matcher(copybookContent);
      while (matcher.find()) {
        if (!ImmutableList.of("*", "/").contains(matcher.group("indicator"))) {
          return false;
        }
      }
    }
    return true;
  }
}
