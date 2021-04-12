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

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.model.Locality;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.Value;

import static org.eclipse.lsp.cobol.core.visitor.VariableDefinitionDelegate.LEVEL_77;

/**
 * This value class represents an independent element item COBOL variable, that has a level number
 * 77. It should always have a PIC clause representing its type, and a VALUE clause that stores an
 * explicitly defined value; both as Strings. They cannot produce a structure in any way.
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class IndependentDataItem extends AbstractVariable implements Conditional {
  String picClause;
  String value;

  public IndependentDataItem(
      String name, Locality definition, boolean global, String picClause, String value) {
    super(LEVEL_77, name, definition, global, null);
    this.picClause = picClause;
    this.value = value;
  }

  @Override
  public String getFormattedDisplayLine() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    if (picClause != null)
      stringBuilder.append(" PIC ").append(picClause);
    if (StringUtils.isNoneBlank(value))
      stringBuilder.append(" VALUE ").append(value);
    return stringBuilder.append(".").toString();
  }
}
