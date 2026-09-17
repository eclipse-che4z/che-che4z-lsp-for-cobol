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
 *    Broadcom - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.service.delegates.actions;

import static java.util.stream.Collectors.toList;

import com.google.inject.Inject;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * This delegates resolves code actions using a set of providers that may process specific types of
 * commands.
 */
public class CodeActions {
  private final Set<CodeActionProvider> providers = new HashSet<>();

  @Inject
  CodeActions(Set<CodeActionProvider> providers) {
    this.providers.addAll(providers);
  }

  /**
   * Registers a new provider for code Actions
   *
   * @param providers list of {@link CodeActionProvider}
   */
  public void registerNewProviders(List<CodeActionProvider> providers) {
    this.providers.addAll(providers);
  }

  /**
   * Unregisters previously registered code action providers
   *
   * @param providers list of {@link CodeActionProvider}
   */
  public void unregisterProviders(List<CodeActionProvider> providers) {
    this.providers.removeAll(providers);
  }

  /**
   * Collect a list of either commands or code actions according to the given params. May return an
   * empty list if the diagnostics cannot be processed with the existing providers.
   *
   * @param params - params of the request
   * @return a list of either commands or code actions
   */
  public List<Either<Command, CodeAction>> collect(CodeActionParams params) {
    return providers.stream()
        .map(it -> it.collectCommandsOrActions(params))
        .flatMap(List::stream)
        .collect(toList());
  }
}
