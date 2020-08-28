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

package com.ca.lsp.cobol.service.delegates.actions;

import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Set;

import static java.util.Collections.singletonList;
import static org.eclipse.lsp4j.jsonrpc.messages.Either.forRight;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This test checks the logic of {@link CodeActions} delegate. It should collect the list of either
 * commands or code actions using the specific providers.
 */
class CodeActionsTest {

  /**
   * Check the {@link CodeActions} uses all the {@link CodeActionProvider} instances to collect the
   * list of code actions and commands.
   */
  @Test
  void collect() {
    CodeActionProvider provider1 = mock(CodeActionProvider.class);
    CodeActionProvider provider2 = mock(CodeActionProvider.class);

    Set<CodeActionProvider> providers = new HashSet<>();
    providers.add(provider1);
    providers.add(provider2);

    CodeActionParams params = new CodeActionParams();
    CodeAction action1 = new CodeAction();
    CodeAction action2 = new CodeAction();

    when(provider1.collectCommandsOrActions(params)).thenReturn(singletonList(forRight(action1)));
    when(provider2.collectCommandsOrActions(params)).thenReturn(singletonList(forRight(action2)));

    CodeActions actions = new CodeActions(providers);

    assertEquals(2, actions.collect(new CodeActionParams()).size());
  }
}
