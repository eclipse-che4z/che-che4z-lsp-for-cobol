package org.broadcom.cobol.dialects.cobolExample.processor;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.broadcom.cobol.dialects.cobolExample.nodes.Level100Node;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;

@AllArgsConstructor
public class Level100Transformer {
  public final Level100Node node;

  public VariableNode generate() {
    Locality locality =
        Locality.builder().uri(ImplicitCodeUtils.createFullUrl("implicit-code-LEVEL-100")).build();
    VariableNode variable =
        new GroupItemNode(locality, 1, node.getName(), false, false, UsageFormat.UNDEFINED);
    variable.addChild(
        new ElementaryItemNode(
            locality,
            5,
            node.getName() + "-1ST",
            false,
            "X(9)",
            null,
            UsageFormat.UNDEFINED,
            false,
            false,
            false));
    variable.addChild(
        new ElementaryItemNode(
            locality,
            5,
            node.getName() + "-2ND",
            false,
            "V(2)",
            null,
            UsageFormat.UNDEFINED,
            false,
            false,
            false));

    variable.addChild(
        new ElementaryItemNode(
            locality,
            88,
            node.getName() + "-OFF",
            false,
            null,
            "N",
            UsageFormat.UNDEFINED,
            false,
            false,
            false));
    return variable;
  }
}
