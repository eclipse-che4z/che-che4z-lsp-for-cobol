/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.sql.processor;

import java.util.Optional;
import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.Db2WorkingAndLinkageSectionNode;

/** Validate Db2WorkingAndLinkageSectionNode position */
@AllArgsConstructor
public class Db2WorkingAndLinkageSectionProcessor
    implements Processor<Db2WorkingAndLinkageSectionNode> {
  final MessageService messageService;

  @Override
  public void accept(Db2WorkingAndLinkageSectionNode node, ProcessingContext processingContext) {
    Optional<Node> nearestParentByType = node.getNearestParentByType(NodeType.SECTION);
    if (nearestParentByType.isPresent()) {
      SectionNode sectionNode = (SectionNode) nearestParentByType.get();
      if (sectionNode.getSectionType() != SectionType.LINKAGE
          && sectionNode.getSectionType() != SectionType.WORKING_STORAGE
          && sectionNode.getSectionType() != SectionType.LOCAL_STORAGE) {
        throwError(node, processingContext);
      }
    } else {
      throwError(node, processingContext);
    }
  }

  private void throwError(
      Db2WorkingAndLinkageSectionNode node, ProcessingContext processingContext) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .location(node.getLocality().toOriginalLocation())
                .severity(ErrorSeverity.ERROR)
                .errorSource(ErrorSource.DIALECT)
                .suggestion(messageService.getMessage("db2Parser.validation.section"))
                .build());
  }
}
