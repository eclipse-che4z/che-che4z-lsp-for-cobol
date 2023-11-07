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

import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;

import javax.annotation.Nullable;
import java.util.Collection;
import java.util.function.Predicate;

import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.common.model.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.CONSTANTS;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.VARIABLES;
import static org.eclipse.lsp4j.CompletionItemKind.Constant;
import static org.eclipse.lsp4j.CompletionItemKind.Variable;

/**
 * This completion provider returns all the defined variables as completion suggestions and their
 * definition as documentation
 */
@Singleton
public class VariableCompletion implements Completion {

  private final SymbolsRepository symbolsRepository;

  @Inject
  public VariableCompletion(SymbolsRepository symbolsRepository) {
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
        .map(symbolsRepository::getVariables)
        .map(Multimap::values)
        .flatMap(Collection::stream)
        .filter(matchNames(token))
        .map(this::toCompletionItem)
        .collect(toList());
  }

  private Predicate<VariableNode> matchNames(@NonNull String token) {
    return it -> it.getName().regionMatches(true, 0, token, 0, token.length());
  }

  private CompletionItem toCompletionItem(VariableNode it) {
    String name = it.getName();
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setDocumentation(it.getFullVariableDescription());
    if (ImplicitCodeUtils.isImplicit(it.getLocality().getUri())) {
      item.setSortText(CONSTANTS.prefix + name);
      item.setKind(Constant);
    } else {
      item.setSortText(VARIABLES.prefix + name);
      item.setKind(Variable);
    }
    return item;
  }
}
