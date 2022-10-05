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
package org.eclipse.lsp.cobol.service.delegates.completions;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;

import javax.annotation.Nullable;
import java.util.Collection;
import java.util.Map;

import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.PARAGRAPHS;
import static org.eclipse.lsp4j.CompletionItemKind.Method;

/** This completion provider returns paragraphs from this document as completion suggestions */
@Singleton
public class ParagraphCompletion implements Completion {

  private final SymbolService symbolService;

  @Inject
  public ParagraphCompletion(SymbolService symbolService) {
    this.symbolService = symbolService;
  }

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document) {
    if (document == null) return emptyList();
    return document
        .getAnalysisResult()
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(PROGRAM))
        .map(ProgramNode.class::cast)
        .map(symbolService::getParagraphMap)
        .map(Map::keySet)
        .flatMap(Collection::stream)
        .filter(DocumentationUtils.startsWithIgnoreCase(token))
        .map(this::toParagraphCompletion)
        .collect(toList());
  }

  private CompletionItem toParagraphCompletion(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setSortText(PARAGRAPHS.prefix + name);
    item.setKind(Method);
    return item;
  }
}
