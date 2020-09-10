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
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.function.Function;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static com.ca.lsp.core.cobol.model.ErrorCode.valueOf;
import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp4j.CodeActionKind.QuickFix;

/**
 * Create a quick-fix code action to resolve a missing copybook diagnostics. Fulfills the code
 * action arguments with copybook name and the URI of the current document.
 */
public class FindCopybookCommand implements CodeActionProvider {
  private static final String TITLE = "Resolve copybook";

  @Nonnull
  @Override
  public List<Either<Command, CodeAction>> collectCommandsOrActions(
      @Nonnull CodeActionParams params) {
    return params.getContext().getDiagnostics().stream()
        .filter(it -> it.getCode() != null)
        .filter(it -> MISSING_COPYBOOK.equals(valueOf(it.getCode())))
        .map(toCodeAction(params))
        .map(Either::<Command, CodeAction>forRight)
        .collect(toList());
  }

  @Nonnull
  private Function<Diagnostic, CodeAction> toCodeAction(@Nonnull CodeActionParams params) {
    return it -> {
      CodeAction action = new CodeAction(TITLE);
      action.setDiagnostics(singletonList(it));
      action.setKind(QuickFix);
      action.setCommand(createCommand(params, it));
      return action;
    };
  }

  @Nonnull
  private Command createCommand(@Nonnull CodeActionParams params, @Nonnull Diagnostic it) {
    return new Command(
        TITLE,
        MISSING_COPYBOOK.name(),
        asList(retrieveCopybookName(it), params.getTextDocument().getUri()));
  }

  @Nonnull
  private String retrieveCopybookName(@Nonnull Diagnostic it) {
    String message = it.getMessage();
    return message.substring(0, message.indexOf(':'));
  }
}
