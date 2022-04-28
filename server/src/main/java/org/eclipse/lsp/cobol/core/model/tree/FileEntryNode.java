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
package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;

import java.util.List;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;

/** The class represents file entry item in COBOL */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class FileEntryNode extends Node {

  private final String fileName;
  private final String fileControlClause;

  public FileEntryNode(Locality location, String name, String fileControlClause) {
    super(location, NodeType.FILE_CONTROL_ENTRY);
    this.fileName = name;
    this.fileControlClause = fileControlClause;
    addProcessStep(this::processNode);
  }

  private List<SyntaxError> processNode() {
    this.getNearestParentByType(PROGRAM)
        .ifPresent(o -> o.getDepthFirstStream()
            .filter(hasType(NodeType.VARIABLE_DEFINITION))
            .map(VariableDefinitionNode.class::cast)
            .filter(n -> n.getLevel() == VariableDefinitionUtil.LEVEL_FD_SD)
            .filter(n -> n.getVariableName().getName().equals(fileName))
            .forEach(n -> n.setFileControlClause(fileControlClause)));
    return ImmutableList.of();
  }

}
