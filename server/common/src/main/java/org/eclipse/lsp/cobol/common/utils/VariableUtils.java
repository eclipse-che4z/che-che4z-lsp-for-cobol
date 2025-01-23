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

package org.eclipse.lsp.cobol.common.utils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.OutlineNodeNames;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;

import java.util.Optional;

/**
 * The utility class is for converting VariableDefinitionNode into appropriate VariableNode.
 */
@UtilityClass
@Slf4j
public class VariableUtils {
    /**
     * Create variable name node.
     * @param variableNode the variableNode
     * @param nameAndLocality the name and locality
     */
    public void createVariableNameNode(VariableNode variableNode, VariableNameAndLocality nameAndLocality) {
        if (nameAndLocality == null
                || nameAndLocality.getName() == null
                || nameAndLocality.getLocality() == null) return;
        VariableDefinitionNameNode varName = new VariableDefinitionNameNode(nameAndLocality.getLocality(), nameAndLocality.getName());
        variableNode.addChild(varName);
    }

    /**
     * Get variable name.
     * @param definitionNode the definition node
     * @return the variable name
     */
    public String getName(VariableDefinitionNode definitionNode) {
        return Optional.ofNullable(definitionNode.getVariableName())
                .map(VariableNameAndLocality::getName)
                .orElse(OutlineNodeNames.FILLER_NAME);
    }
}
