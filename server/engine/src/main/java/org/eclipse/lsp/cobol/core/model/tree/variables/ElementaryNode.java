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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.Arrays;

import static org.eclipse.lsp.cobol.core.model.tree.variables.EffectiveDataType.UNDETERMINED;

/**
 * Abstract class for all elementary variables. These variables actually has space allocations and
 * are not logical.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@SuppressWarnings("squid:S107")
public abstract class ElementaryNode extends VariableWithLevelNode
    implements UsageClause, EffectiveData {
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
    this.effectiveDataType = Arrays.stream(EffectiveDataType.values())
            .filter(type -> type.checkDataType(this))
            .findFirst()
            .orElse(UNDETERMINED);
  }

}
