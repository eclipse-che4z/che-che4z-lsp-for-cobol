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

package org.eclipse.lsp.cobol.core.model.tree.variables;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.UsageFormat;

import java.util.*;

import static org.eclipse.lsp.cobol.core.model.tree.variables.EffectiveDataType.UNDETERMINED;

/**
 * Abstract class for all elementary variables. These variables actually has space allocations and
 * are not logical.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@SuppressWarnings("squid:S107")
abstract class ElementaryNode extends VariableWithLevelNode implements UsageClause {
  private static final String SEMANTICS_NO_PIC_CLAUSE = "semantics.noPicClause";
  private static final String SEMANTIC_IMPROPER_USE_BLANK_WHEN_ZERO_AND_SIGN_CLAUSE =
      "semantics.improperUseBlankWhenZeroAndSignClause";
  private static final String BLANK_WHEN_ZERO = "variables.blankWhenZero";
  private static final String SIGN_CLAUSE = "variables.signClause";
  private final boolean isBlankWhenZeroPresent;
  private final boolean isSignClausePresent;
  EffectiveDataType effectiveDataType;
  String picClause;
  @Getter UsageFormat usageFormat;

  protected ElementaryNode(
      Locality location,
      int level,
      String name,
      boolean redefines,
      VariableType variableType,
      boolean global,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent,
      String picClause,
      UsageFormat usageFormat) {
    super(location, level, name, redefines, variableType, global);
    this.isBlankWhenZeroPresent = isBlankWhenZeroPresent;
    this.isSignClausePresent = isSignClausePresent;
    this.picClause = picClause;
    this.usageFormat = usageFormat;
    this.effectiveDataType = setEffectiveDataType();
  }

  private EffectiveDataType setEffectiveDataType() {
    return Arrays.stream(EffectiveDataType.values())
        .filter(type -> type.checkDataType(this))
        .findFirst()
        .orElse(UNDETERMINED);
  }

  /**
   * Validate proper use of PIC and USAGE clause for elementary nodes
   *
   * @return SyntaxError
   */
  @Override
  public List<SyntaxError> processNode() {
    List<SyntaxError> errors = new ArrayList<>(validatePicClauseUsage());
    errors.addAll(validateCompatibleUsageClause());
    errors.addAll(super.processNode());
    return errors;
  }

  private List<SyntaxError> validateCompatibleUsageClause() {
    if (Objects.isNull(usageFormat)) return Collections.emptyList();
    boolean check = isSignClausePresent || isBlankWhenZeroPresent;
    if (UsageFormatUtils.blankAndSignNotAllowedUsage.contains(usageFormat) && check)
      return ImmutableList.of(
          this.getError(
              MessageTemplate.of(
                  SEMANTIC_IMPROPER_USE_BLANK_WHEN_ZERO_AND_SIGN_CLAUSE, getInCompatibleClause()),
              ErrorSeverity.WARNING));
    return Collections.emptyList();
  }

  private MessageTemplate getInCompatibleClause() {
    return isBlankWhenZeroPresent
        ? MessageTemplate.of(BLANK_WHEN_ZERO)
        : MessageTemplate.of(SIGN_CLAUSE);
  }

  private List<SyntaxError> validatePicClauseUsage() {
    if (StringUtils.isBlank(getPicClause())) return Collections.emptyList();
    if (UsageFormatUtils.noPicClauseUsage.contains(getUsageFormat()))
      return ImmutableList.of(
          this.getError(
              MessageTemplate.of(SEMANTICS_NO_PIC_CLAUSE, getUsageFormat().toString()),
              ErrorSeverity.WARNING));

    return UsageFormatUtils.picAndUsageClauseValidator
        .getOrDefault(effectiveDataType, node -> ImmutableList.of())
        .apply(this);
  }
}
