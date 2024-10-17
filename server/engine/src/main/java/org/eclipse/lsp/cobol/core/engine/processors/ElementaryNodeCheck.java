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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.utils.UsageFormatUtils;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

/** Validate proper use of PIC and USAGE clause for elementary nodes */
public class ElementaryNodeCheck implements Processor<ElementaryNode> {
  private static final String SEMANTICS_NO_PIC_CLAUSE = "semantics.noPicClause";
  private static final String BLANK_WHEN_ZERO = "variables.blankWhenZero";
  private static final String SIGN_CLAUSE = "variables.signClause";
  private static final String SEMANTIC_IMPROPER_USE_BLANK_WHEN_ZERO_AND_SIGN_CLAUSE =
      "semantics.improperUseBlankWhenZeroAndSignClause";

  @Override
  public void accept(ElementaryNode node, ProcessingContext ctx) {
    ctx.getErrors().addAll(validatePicClauseUsage(node));
    ctx.getErrors().addAll(validateCompatibleUsageClause(node));
  }

  private List<SyntaxError> validatePicClauseUsage(ElementaryNode node) {
    if (StringUtils.isBlank(node.getPicClause())) {
      return Collections.emptyList();
    }
    if (UsageFormatUtils.noPicClauseUsage.contains(node.getUsageFormat())) {
      return ImmutableList.of(
          node.getError(
              MessageTemplate.of(SEMANTICS_NO_PIC_CLAUSE, node.getUsageFormat().toString()),
              ErrorSeverity.WARNING));
    }

    return UsageFormatUtils.picAndUsageClauseValidator
        .getOrDefault(node.getEffectiveDataType(), n -> ImmutableList.of())
        .apply(node);
  }

  private MessageTemplate getInCompatibleClause(ElementaryNode node) {
    return node.isBlankWhenZeroPresent()
        ? MessageTemplate.of(BLANK_WHEN_ZERO)
        : MessageTemplate.of(SIGN_CLAUSE);
  }

  private List<SyntaxError> validateCompatibleUsageClause(ElementaryNode node) {
    if (Objects.isNull(node.getUsageFormat())) {
      return Collections.emptyList();
    }
    boolean check = node.isSignClausePresent() || node.isBlankWhenZeroPresent();
    if (UsageFormatUtils.blankAndSignNotAllowedUsage.contains(node.getUsageFormat()) && check) {
      return ImmutableList.of(
          node.getError(
              MessageTemplate.of(
                  SEMANTIC_IMPROPER_USE_BLANK_WHEN_ZERO_AND_SIGN_CLAUSE,
                  getInCompatibleClause(node)),
              ErrorSeverity.WARNING));
    }
    return Collections.emptyList();
  }
}
