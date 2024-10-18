package org.eclipse.lsp.cobol.utils;

import org.eclipse.lsp.cobol.cli.command.CliUtils;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.LiteralNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureSectionNode;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;

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
