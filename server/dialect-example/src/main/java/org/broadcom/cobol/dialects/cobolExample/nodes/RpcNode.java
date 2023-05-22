package org.broadcom.cobol.dialects.cobolExample.nodes;

import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;

@Getter
public class RpcNode extends Node {
  private final VariableNameAndLocality identifier1;
  private final VariableNameAndLocality identifier2;
  private final VariableNameAndLocality identifier3;
  private final VariableNameAndLocality identifier4;
  private final VariableNameAndLocality identifier5;
  private final VariableNameAndLocality identifier6;

  public RpcNode(
          Locality location,
          NodeType nodeType,
          String dialect,
          VariableNameAndLocality identifier1,
          VariableNameAndLocality identifier2,
          VariableNameAndLocality identifier3,
          VariableNameAndLocality identifier4,
          VariableNameAndLocality identifier5,
          VariableNameAndLocality identifier6) {
    super(location, nodeType, dialect);
    this.identifier1 = identifier1;
    this.identifier2 = identifier2;
    this.identifier3 = identifier3;
    this.identifier4 = identifier4;
    this.identifier5 = identifier5;
    this.identifier6 = identifier6;
  }
}
