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

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.ArrayList;
import java.util.List;

/**
 * The class represents the program end.
 */
public class ProgramEndNode extends Node {
  private final Locality locality;
  private final String id;
  private final MessageService messageService;

  public ProgramEndNode(Locality locality, String id, MessageService messageService) {
    super(locality.toLocation(), NodeType.PROGRAM_END);
    this.locality = locality;
    this.id = id;
    this.messageService = messageService;
  }

  @Override
  public List<SyntaxError> getErrors() {
    List<SyntaxError> errors = new ArrayList<>(1);
    getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .ifPresent(node -> {
          if (node.getProgramName() == null) {
            errors.add(constructError("", locality,
                messageService.getMessage("CobolVisitor.progIDIssueMsg")));
          } else if (!node.getProgramName().equalsIgnoreCase(id)) {
            errors.add(constructError(node.getProgramName(), locality,
                messageService.getMessage("CobolVisitor.identicalProgMsg")));
          }
        });
    return errors;
  }

  private SyntaxError constructError(String wrongToken, @NonNull Locality locality, String message) {
    return SyntaxError.syntaxError()
            .locality(locality)
            .suggestion(message + wrongToken)
            .severity(ErrorSeverity.WARNING)
            .build();
  }
}
