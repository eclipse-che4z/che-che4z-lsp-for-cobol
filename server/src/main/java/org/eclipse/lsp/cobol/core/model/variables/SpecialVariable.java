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

package org.eclipse.lsp.cobol.core.model.variables;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.List;

/**
 * This class represents variables that have limited applicability and are used for some special
 * purposes. The variables don't support usual COBOL variable operations, e.g. renaming and
 * declaring condition names.
 */
public abstract class SpecialVariable extends AbstractVariable {
  protected SpecialVariable(
      int levelNumber, String name, Locality definition, boolean global, Variable parent) {
    super(levelNumber, name, definition, global, parent);
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
}
