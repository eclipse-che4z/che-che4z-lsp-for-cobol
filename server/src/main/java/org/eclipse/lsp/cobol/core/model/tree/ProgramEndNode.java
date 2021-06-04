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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.ArrayList;
import java.util.List;

/** The class represents the program end. */
@Slf4j
@ToString(callSuper = true)
@SuppressWarnings("squid:S2160")
public class ProgramEndNode extends Node {
  String programId;

  public ProgramEndNode(Locality locality, String programId) {
    super(locality, NodeType.PROGRAM_END);
    this.programId = programId;
  }

  @Override
  public List<SyntaxError> process() {
    List<SyntaxError> errors = new ArrayList<>(1);
    getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .ifPresent(
            node -> {
              if (node.getProgramName() == null) {
                LOG.debug("Syntax error: Program name is empty");
                errors.add(
                    SyntaxError.syntaxError()
                        .locality(getLocality())
                        .severity(ErrorSeverity.WARNING)
                        .messageTemplate(MessageTemplate.of("CobolVisitor.progIDIssueMsg"))
                        .build());
              } else if (!node.getProgramName().equalsIgnoreCase(programId)) {
                LOG.debug(
                    "Syntax error: program name is '{}', but END PROGRAM refers to '{}'",
                    node.getProgramName(),
                    programId);
                errors.add(
                    SyntaxError.syntaxError()
                        .locality(getLocality())
                        .severity(ErrorSeverity.WARNING)
                        .messageTemplate(
                            MessageTemplate.of(
                                "CobolVisitor.identicalProgMsg", node.getProgramName()))
                        .build());
              }
            });
    return errors;
  }
}
