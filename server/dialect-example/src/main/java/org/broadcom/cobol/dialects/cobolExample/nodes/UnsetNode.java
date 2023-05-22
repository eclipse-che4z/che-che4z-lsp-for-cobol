package org.broadcom.cobol.dialects.cobolExample.nodes;

import lombok.Getter;
import org.broadcom.cobol.dialects.cobolExample.ExampleDialect;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;

public class UnsetNode extends Node {
    @Getter public final VariableNameAndLocality identifier;
    public UnsetNode(Locality location, VariableNameAndLocality identifier) {
        super(location, NodeType.CUSTOM, ExampleDialect.DIALECT_NAME);
        this.identifier = identifier;
    }
}
