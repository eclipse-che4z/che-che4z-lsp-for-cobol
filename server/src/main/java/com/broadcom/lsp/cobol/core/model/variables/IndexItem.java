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

package com.broadcom.lsp.cobol.core.model.variables;

import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.VariableUtils;
import lombok.AllArgsConstructor;
import lombok.Value;

/**
 * This value class represents an Index item. It is defined using INDEXED BY statement in a {@link
 * TableDataName} declaration.
 */
@Value
@AllArgsConstructor
public class IndexItem implements Variable {
  private String name;
  private String qualifier;
  private Locality definition;

  @Override
  public Variable rename(String renameItemName) {
    return new IndexItem(
        name, VariableUtils.renameQualifier(qualifier, renameItemName), definition);
  }
  @Override
  public boolean isRenameable() {
    return false;
  }
}
