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
import org.eclipse.lsp4j.TextDocumentItem;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Identifies a copybook based on the content. */
@Singleton
public class CopybookIdentificationServiceBasedOnContent implements CopybookIdentificationService {
  private Pattern detectCobolProgram =
      Pattern.compile(
          "(?i)^(?<sequence>.{0,6})(?<indicator>.?)(PROGRAM-ID)\\s*\\.\\s+(?<programName>.{1,30})\\s*\\.",
          Pattern.MULTILINE);
  /**
   * Identifies a copybook based on the content. If the text contains a valid program-id, we detect
   * it as a cobol program, else it's a copybook.
   *
   * @param doc copybook.
   * @return True if it's a copybook. False otherwise
   */
  @Override
  public boolean isCopybook(TextDocumentItem doc) throws UndeterminedDocumentException {
    String copybookContent = Optional.ofNullable(doc.getText()).orElse("");
    Matcher matcher = detectCobolProgram.matcher(copybookContent);
    while (matcher.find()) {
      if (!ImmutableList.of("*", "/").contains(matcher.group("indicator"))) {
        return false;
      }
    }
    return true;
  }
}
