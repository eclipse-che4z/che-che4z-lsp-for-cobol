/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.core.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Arrays;
import java.util.List;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.implicitDialects.sql.generator.Db2ImplicitVariablesGenerator;
import org.junit.jupiter.api.Test;

/** Check if the variable used is part of the defined variables */
public class VariableUsageUtilsTest {
    List<VariableNode> datacomNodes = Db2ImplicitVariablesGenerator.generateDatacomNodes();
    Locality locality = Locality.builder()
            .uri(ImplicitCodeUtils.createFullUrl("implicit-code-SQLCA_DB2"))
            .build();
    @Test
    void testFindVariablesForUsage() {
        VariableUsageNode usageNode1 = new VariableUsageNode("SQLCA-ERR-MSG", locality);
        List<VariableUsageNode> usageNodes = Arrays.asList(usageNode1);
        VariableNode variableNode1 = new ElementaryItemNode(locality, 10, "SQLCA-ERR-MSG", false, "X(80)",
                null, UsageFormat.UNDEFINED, false, false, false);
        Multimap<String, VariableNode> definedVariables = ArrayListMultimap.create();
        definedVariables.put("SQLCA", datacomNodes.get(0));
        List<VariableNode> result = VariableUsageUtils.findVariablesForUsage(definedVariables, usageNodes);

        assertEquals(1, result.size());
        assertTrue(result.contains(variableNode1));
    }

    @Test
    void testFindVariablesForUsageNoMatch() {
        VariableUsageNode usageNode1 = new VariableUsageNode("SQLCA-NO-MATCH", locality);
        List<VariableUsageNode> usageNodes = Arrays.asList(usageNode1);
        Multimap<String, VariableNode> definedVariables = ArrayListMultimap.create();
        definedVariables.put("SQLCA", datacomNodes.get(0));
        List<VariableNode> result = VariableUsageUtils.findVariablesForUsage(definedVariables, usageNodes);

        assertTrue(result.isEmpty());
    }
}
