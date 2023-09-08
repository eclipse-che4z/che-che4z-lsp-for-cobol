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
package org.eclipse.lsp.cobol.common.model.tree.variables;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;

import java.util.List;

/**
 * Class for all File Description Entry (FD) or Sort File Description (SD) Entry variables. These
 * variables are just logical.
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class FileDescriptionNode extends VariableNode {
  @Getter private final boolean isExternal;
  @Getter private final String fileDescriptorText;
  @Getter private final String fileControlClause;

  public FileDescriptionNode(
      Locality location,
      String name,
      VariableType variableType,
      boolean global,
      boolean isExternal,
      String fileDescriptorText,
      String fileControlClause) {
    super(location, name, variableType, global);
    this.isExternal = isExternal;
    this.fileDescriptorText = fileDescriptorText;
    this.fileControlClause = fileControlClause;
  }

  @Override
  protected String getVariableDisplayString() {
    return String.format(
        "DESCRIPTION %n----------- %n%S%n %nFILE-CONTROL%n------------ %n%S %n",
        fileDescriptorText, fileControlClause);
  }

  @Override
  protected List<String> getChildrenDescription(String prefix) {
    return ImmutableList.of();
  }
}
