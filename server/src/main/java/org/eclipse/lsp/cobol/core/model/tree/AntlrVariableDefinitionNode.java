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
package org.eclipse.lsp.cobol.core.model.tree;


import lombok.Value;
import lombok.experimental.NonFinal;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.visitor.VariableDefinitionDelegate;

/**
 * The class represents a variable definition.
 * This store ANTLR context to be used in {@link VariableDefinitionDelegate}. This is a temporal solution and must be
 * removed.
 */
@Value
public class AntlrVariableDefinitionNode extends Node {
  @NonFinal
  CobolParser.DataDescriptionEntryFormat1Context format1Context;
  @NonFinal
  CobolParser.DataDescriptionEntryFormat1Level77Context format1Level77Context;
  @NonFinal
  CobolParser.DataDescriptionEntryFormat2Context format2Context;
  @NonFinal
  CobolParser.DataDescriptionEntryFormat3Context format3Context;
  @NonFinal
  CobolParser.EnvironmentSwitchNameClauseContext switchNameClauseContext;

  public AntlrVariableDefinitionNode(CobolParser.DataDescriptionEntryFormat1Context format1Context) {
    super(null, NodeType.ANTLR_VARIABLE_DEFINITION);
    this.format1Context = format1Context;
  }

  public AntlrVariableDefinitionNode(CobolParser.DataDescriptionEntryFormat1Level77Context format1Level77Context) {
    super(null, NodeType.ANTLR_VARIABLE_DEFINITION);
    this.format1Level77Context = format1Level77Context;
  }

  public AntlrVariableDefinitionNode(CobolParser.DataDescriptionEntryFormat2Context format2Context) {
    super(null, NodeType.ANTLR_VARIABLE_DEFINITION);
    this.format2Context = format2Context;
  }

  public AntlrVariableDefinitionNode(CobolParser.DataDescriptionEntryFormat3Context format3Context) {
    super(null, NodeType.ANTLR_VARIABLE_DEFINITION);
    this.format3Context = format3Context;
  }

  public AntlrVariableDefinitionNode(CobolParser.EnvironmentSwitchNameClauseContext switchNameClauseContext) {
    super(null, NodeType.ANTLR_VARIABLE_DEFINITION);
    this.switchNameClauseContext = switchNameClauseContext;
  }
}
