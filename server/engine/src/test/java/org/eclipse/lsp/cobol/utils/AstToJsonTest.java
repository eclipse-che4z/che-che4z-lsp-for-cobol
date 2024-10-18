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
package org.eclipse.lsp.cobol.utils;

import org.eclipse.lsp.cobol.cli.command.CliUtils;
import org.eclipse.lsp.cobol.common.model.tree.LiteralNode;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureSectionNode;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
/**
 * Test class for converting different types of nodes to JSON.
 */
public class AstToJsonTest {
    @Test
    void testRootNode() {
        RootNode root = new RootNode();
        String json = CliUtils.GSON.toJson(root);
        assertFalse(json.contains("crash"));
    }

    @Test
    void testRootLiteralNode() {
        LiteralNode node = new LiteralNode(null, null);
        String json = CliUtils.GSON.toJson(node);
        assertFalse(json.contains("crash"));
    }

    @Test
    void testProcedureSectionNode() {
        ProcedureSectionNode node = new ProcedureSectionNode(null, null, null, null);
        String json = CliUtils.GSON.toJson(node);
        assertFalse(json.contains("crash"));
    }

}
