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

package org.eclipse.lsp.cobol.core.model.variables;

import org.eclipse.lsp.cobol.core.model.Locality;
import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.Value;

import java.util.List;

/**
 * This value class represents a special name. They may substitute environment names in the
 * SPECIAL-NAMES paragraph. They should are a special type of variable, allowed in certain
 * statements.
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class MnemonicName extends AbstractVariable {
  private String systemName;
  public MnemonicName(String systemName, String name, Locality definition) {
    super(-1, name, definition, null);
    this.systemName = systemName;
  }

  @Override
  public boolean isConditional() {
    return false;
  }

  @Override
  public void addConditionName(ConditionDataName variable) {
    throw new UnsupportedOperationException("This variable is not conditional");
  }

  @Override
  public List<ConditionDataName> getConditionNames() {
    return ImmutableList.of();
  }

  @Override
  public String getFormattedDisplayLine() {
    return String.format("%1$s IS %2$s.", systemName, name);
  }
}
