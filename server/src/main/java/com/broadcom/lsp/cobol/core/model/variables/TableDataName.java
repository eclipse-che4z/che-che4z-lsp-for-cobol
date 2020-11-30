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
import lombok.Value;

import java.util.List;

/** This value class represents the Table variable that may have an optional index */
@Value
public class TableDataName implements Variable, TableDeclaration {
  private String name;
  private String qualifier;
  private Locality definition;
  private String picClause;
  private String value;
  private int occursTimes;
  private List<IndexItem> indexes;

  @Override
  public Variable rename(String renameItemName) {
    return new TableDataName(
        name,
        VariableUtils.renameQualifier(qualifier, renameItemName),
        definition,
        picClause,
        value,
        occursTimes,
        indexes);
  }
  @Override
  public boolean isRenameable() {
    return false;
  }
}
