/*
 * Copyright (c) 2021 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;
import org.eclipse.lsp.cobol.core.model.variables.SectionType;

import java.util.List;

/** The class represents section in COBOL. */
@Getter
@ToString(callSuper = true)
public class SectionNode extends Node {
  @Getter private final SectionType sectionType;

  public SectionNode(Locality locality, SectionType section) {
    super(locality, NodeType.SECTION);
    this.sectionType = section;
    addProcessStep(this::processNode);
  }

  private List<SyntaxError> processNode() {
    return VariableDefinitionUtil.processNodeWithVariableDefinitions(this);
  }
}
