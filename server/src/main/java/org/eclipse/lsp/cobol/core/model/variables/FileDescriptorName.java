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

import lombok.Getter;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableType;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.LEVEL_FD_SD;
import static org.eclipse.lsp.cobol.core.model.variables.StructureType.FILE_DESCRIPTOR_NAME;

/**
 * Class for all File Description Entry (FD) or Sort File Description (SD) Entry variables. A valid
 * File Description Entry should also have a file control defined.
 */
public class FileDescriptorName extends AbstractVariable {

  private final String fileDescriptorText;
  private final String fileControlClause;
  @Getter private final VariableType variableType;

  protected FileDescriptorName(
      String name, Locality definition, String fileDescriptorText, String fileControlClause, VariableType variableType) {
    super(LEVEL_FD_SD, name, definition, false, null);
    this.fileDescriptorText = fileDescriptorText;
    this.fileControlClause = fileControlClause;
    this.variableType = variableType;
  }

  @Override
  public StructureType getStructureType() {
    return FILE_DESCRIPTOR_NAME;
  }

  @Override
  public String getFormattedDisplayLine() {
    return String.format(
        "DESCRIPTION %n----------- %n%S%n %nFILE-CONTROL%n------------ %n%S %n",
        this.fileDescriptorText, this.fileControlClause);
  }
}
