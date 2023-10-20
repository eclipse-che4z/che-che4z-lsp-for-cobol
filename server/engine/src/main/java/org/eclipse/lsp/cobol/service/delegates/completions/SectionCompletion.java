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
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;

import javax.annotation.Nullable;
import java.util.Collection;
import java.util.Map;

import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.common.model.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.SECTIONS;

/** Provides completion functionality for sections */
@Singleton
public class SectionCompletion implements Completion {

  private final SymbolsRepository symbolsRepository;

  @Inject
  public SectionCompletion(SymbolsRepository symbolsRepository) {
    this.symbolsRepository = symbolsRepository;
  }

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document) {
    if (!isDocumentReadyForSemanticCollection(document)) return emptyList();
    return document
        .getLastAnalysisResult()
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(PROGRAM))
        .map(ProgramNode.class::cast)
        .map(symbolsRepository::getSectionMap)
        .map(Map::keySet)
        .flatMap(Collection::stream)
        .filter(DocumentationUtils.startsWithIgnoreCase(token))
        .map(this::toSectionCompletion)
        .collect(toList());
  }

  private CompletionItem toSectionCompletion(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setSortText(SECTIONS.prefix + name);
    item.setKind(CompletionItemKind.Function);
    return item;
  }
}
