package org.broadcom.cobol.dialects.cobolExample.nodes;

import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;

public class Level100Node extends Node {
    @Getter private final String name;
    public Level100Node(Locality location, NodeType nodeType, String dialect, String name) {
        super(location, nodeType, dialect);
        this.name = name;
    }
}
