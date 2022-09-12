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

import lombok.EqualsAndHashCode;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.logic.QualifiedReferenceWaitForVariableDefinition;

import java.util.Optional;

/**
 * The class represents usage of qualified variable in COBOL. Under this node will be one or more
 * instances of VariableUsageNode.
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Slf4j
public class QualifiedReferenceNode extends Node {
  @Setter private VariableNode variableDefinitionNode;

  public QualifiedReferenceNode(Locality location) {
    super(location, NodeType.QUALIFIED_REFERENCE_NODE);
    addProcessStep(ctx -> new QualifiedReferenceWaitForVariableDefinition().accept(this, ctx));
  }

  public Optional<VariableNode> getVariableDefinitionNode() {
    return Optional.ofNullable(variableDefinitionNode);
  }
}
