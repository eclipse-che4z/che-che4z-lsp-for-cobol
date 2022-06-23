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

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.FD_WITHOUT_FILE_CONTROL;

/**
 * Class for all File Description Entry (FD) or Sort File Description (SD) Entry variables. These
 * variables are just logical.
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class FileDescriptionNode extends VariableNode {
  @Getter private final String fileDescriptorText;
  @Getter private final String fileControlClause;

  protected FileDescriptionNode(
      Locality location,
      String name,
      VariableType variableType,
      boolean global,
      String fileDescriptorText,
      String fileControlClause) {
    super(location, name, variableType, global);
    this.fileDescriptorText = fileDescriptorText;
    this.fileControlClause = fileControlClause;
    addProcessStep(this::processNode);
  }

  private List<SyntaxError> processNode() {
    List<SyntaxError> errors = new ArrayList<>();
    if (StringUtils.isBlank(fileControlClause)) {
      errors.add(getError(MessageTemplate.of(FD_WITHOUT_FILE_CONTROL, getName()), ErrorSeverity.ERROR));
    }
    errors.addAll(VariableDefinitionUtil.processNodeWithVariableDefinitions(this));
    return errors;
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
