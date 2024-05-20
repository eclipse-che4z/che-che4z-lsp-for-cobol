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
import org.eclipse.lsp.cobol.rules.data.DataDivisionRule;
import org.eclipse.lsp.cobol.rules.environment.EnvironmentDivisionRule;
import org.eclipse.lsp.cobol.rules.identification.IdentificationDivisionRule;
import org.eclipse.lsp.cobol.rules.procedure.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * A container for COBOL language grammar rules.
 */
public class CobolLanguage {
  private final Map<Class<? extends LanguageRule>, LanguageRule> languageRules = new HashMap<>();

  public CobolLanguage() {
    languageRules.put(SourceUnitRule.class, new SourceUnitRule());
    languageRules.put(ProgramRule.class, new ProgramRule());

    languageRules.put(EnvironmentDivisionRule.class, new EnvironmentDivisionRule());
    languageRules.put(DataDivisionRule.class, new DataDivisionRule());
    languageRules.put(ProcedureDivisionRule.class, new ProcedureDivisionRule());

    languageRules.put(DeclarativesRule.class, new DeclarativesRule());

    languageRules.put(ParagraphRule.class, new ParagraphRule());
    languageRules.put(IdentificationDivisionRule.class, new IdentificationDivisionRule());
    languageRules.put(SectionRule.class, new SectionRule());
    languageRules.put(StatementRule.class, new StatementRule());
  }

  /**
   * Is the next sequence of tokens can be this rule.
   *
   * @param ruleClass a rule class.
   * @param ctx       parsing relater api.
   * @return true if rule matches.
   */
  public boolean tryMatchRule(Class<? extends LanguageRule> ruleClass, ParsingContext ctx) {
    return languageRules.get(ruleClass).tryMatch(ctx, this);
  }

  /**
   * Parse the rule.
   *
   * @param ruleClass a rule class.
   * @param ctx       parsing relater api.
   */
  public void parseRule(Class<? extends LanguageRule> ruleClass, ParsingContext ctx) {
    languageRules.get(ruleClass).parse(ctx, this);
  }

  /**
   * Parse the rule if it matches. A combination of tryMatch and parse method calls.
   *
   * @param ruleClass a rule class
   * @param ctx       parsing relater api.
   * @return optional true if rule matched even if parsing had errors.
   */
  public Optional<Boolean> tryParseRule(Class<? extends LanguageRule> ruleClass, ParsingContext ctx) {
    LanguageRule rule = languageRules.get(ruleClass);
    if (rule.tryMatch(ctx, this)) {
      rule.parse(ctx, this);
      return Optional.of(true);
    }
    return Optional.empty();
  }

}
