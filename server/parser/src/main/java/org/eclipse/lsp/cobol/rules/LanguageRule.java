/*
 * Copyright (c) 2024 Broadcom.
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
 */
package org.eclipse.lsp.cobol.rules;

import org.eclipse.lsp.cobol.parser.hw.ParsingContext;

import java.util.Optional;

/**
 * Language grammar rule.
 */
public interface LanguageRule {
  /**
   * Parse the rule.
   *
   * @param ctx      parsing relater api.
   * @param language language description.
   */
  void parse(ParsingContext ctx, CobolLanguage language);

  /**
   * Is the next sequence of tokens can be this rule.
   *
   * @param ctx      parsing relater api.
   * @param language language description.
   * @return true if rule matches.
   */
  boolean tryMatch(ParsingContext ctx, CobolLanguage language);

  /**
   * Parse the rule if it matches. A combination of tryMatch and parse method calls.
   *
   * @param ctx      parsing relater api.
   * @param language language description.
   * @return optional true if rule matched even if parsing had errors.
   */
  default Optional<Boolean> tryParse(ParsingContext ctx, CobolLanguage language) {
    if (tryMatch(ctx, language)) {
      parse(ctx, language);
      return Optional.of(true);
    }
    return Optional.empty();
  }
}
