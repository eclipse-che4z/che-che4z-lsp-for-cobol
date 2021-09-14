/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.strategy;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.CICSParser;
import org.eclipse.lsp.cobol.core.CobolParser;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toMap;
import static java.util.stream.Collectors.toSet;

/**
 * This class encapsulates the tokens of identifier rules that should be replaced in the error
 * messages
 */
@UtilityClass
class IdentifierReplacing {

  private static final String KEYWORD_PATTERN = "[A-Z0-9_]+";
  private static final Map<Class<? extends Parser>, List<Class<? extends ParserRuleContext>>>
      PARSER_IDENTIFIER_RULES =
          ImmutableMap.of(
              CobolParser.class,
              ImmutableList.of(
                  CobolParser.CobolCompilerDirectivesKeywordsContext.class,
                  CobolParser.Idms_only_wordsContext.class,
                  CobolParser.CobolKeywordsContext.class),
              CICSParser.class,
              ImmutableList.of(CICSParser.CicsWordsContext.class));

  /**
   * Retrieve all the tokens from the rules that represent identifiers
   *
   * @return map of token name sets by parser
   */
  Map<Class<? extends Parser>, Set<String>> retrieveTokenToRemove() {
    return PARSER_IDENTIFIER_RULES.entrySet().stream()
        .collect(toMap(Map.Entry::getKey, IdentifierReplacing::collectTokens));
  }

  private Set<String> collectTokens(
      Map.Entry<Class<? extends Parser>, List<Class<? extends ParserRuleContext>>> rules) {
    return rules.getValue().stream().flatMap(IdentifierReplacing::retrieveTokens).collect(toSet());
  }

  private Stream<String> retrieveTokens(Class<? extends ParserRuleContext> identifierRule) {
    return Arrays.stream(identifierRule.getDeclaredMethods())
        .map(Method::getName)
        .filter(it -> it.matches(KEYWORD_PATTERN));
  }
}
