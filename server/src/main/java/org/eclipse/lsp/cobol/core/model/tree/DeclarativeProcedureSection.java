/*
 * Copyright (c) 2022 Broadcom.
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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.Collections;
import java.util.List;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;

/** The class represents declarative procedure section in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class DeclarativeProcedureSection extends ProcedureSectionNode {
  public DeclarativeProcedureSection(
      Locality location, String name, String text, Locality definition) {
    super(location, name, text, definition);
    addProcessStep(this::registerNode);
  }

  private List<SyntaxError> registerNode() {
    this.getNearestParentByType(PROGRAM)
            .map(ProgramNode.class::cast)
        .ifPresent(parent -> {
          parent.registerCodeBlock(this);
          parent.registerParagraphNameNode(new ParagraphNameNode(locality, name));
        });
    return Collections.emptyList();
  }
}
