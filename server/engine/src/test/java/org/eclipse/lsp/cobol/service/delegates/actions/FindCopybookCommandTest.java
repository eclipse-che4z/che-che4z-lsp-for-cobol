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

package org.eclipse.lsp.cobol.service.delegates.actions;

import com.google.common.collect.Lists;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.junit.jupiter.api.Test;

import java.util.List;

import static java.util.Collections.singletonList;
import static org.eclipse.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp4j.CodeActionKind.QuickFix;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

/**
 * Test {@link FindCopybookCommand} code action provider that resolves diagnostics for missing
 * copybooks.
 */
class FindCopybookCommandTest {

  private static final String TITLE = "Resolve copybook";
  private static final String COPYBOOK_NAME = "CPYNAME";

  private static final Range RANGE = new Range(new Position(0, 0), new Position(0, 1));
  private static final Diagnostic SYNTAX_ERROR =
      new Diagnostic(RANGE, "Syntax error", Error, null, null);
  private static final Diagnostic COPYBOOK_ERROR =
      new Diagnostic(
          RANGE, COPYBOOK_NAME + ": Copybook not found", Error, null, MISSING_COPYBOOK.getLabel());

  /** Test a code action to resolve the required copybook created for the missing copybook error. */
  @Test
  void testCollectCommandsOrActionsPositive() {
    CodeActionProvider provider = new FindCopybookCommand();

    List<Diagnostic> diagnostics = singletonList(COPYBOOK_ERROR);
    CodeActionParams params =
        new CodeActionParams(
            new TextDocumentIdentifier(DOCUMENT_URI), RANGE, new CodeActionContext(diagnostics));

    List<Either<Command, CodeAction>> actions = provider.collectCommandsOrActions(params);

    assertEquals(1, actions.size());

    CodeAction action = actions.get(0).getRight();
    assertCorrectCodeAction(action);
  }

  /** Test nothing created for a syntax error. */
  @Test
  void testCollectCommandsOrActionsNegative() {

    CodeActionProvider provider = new FindCopybookCommand();

    List<Diagnostic> diagnostics = singletonList(SYNTAX_ERROR);
    CodeActionParams params =
        new CodeActionParams(
            new TextDocumentIdentifier(DOCUMENT_URI), RANGE, new CodeActionContext(diagnostics));

    List<Either<Command, CodeAction>> actions = provider.collectCommandsOrActions(params);

    assertEquals(0, actions.size());
  }

  /** Test only correct errors processed. */
  @Test
  void testCollectCommandsOrActionsMixed() {
    CodeActionProvider provider = new FindCopybookCommand();

    List<Diagnostic> diagnostics = Lists.newArrayList(SYNTAX_ERROR, COPYBOOK_ERROR);
    CodeActionParams params =
        new CodeActionParams(
            new TextDocumentIdentifier(DOCUMENT_URI), RANGE, new CodeActionContext(diagnostics));

    List<Either<Command, CodeAction>> actions = provider.collectCommandsOrActions(params);

    assertEquals(1, actions.size());

    CodeAction action = actions.get(0).getRight();
    assertCorrectCodeAction(action);
  }

  private void assertCorrectCodeAction(CodeAction action) {
    assertEquals(TITLE, action.getTitle());
    assertEquals(QuickFix, action.getKind());
    assertEquals(COPYBOOK_ERROR, action.getDiagnostics().get(0));
    assertNull(action.getEdit());

    Command command = action.getCommand();
    assertEquals(TITLE, command.getTitle());
    assertEquals(MISSING_COPYBOOK.getLabel(), command.getCommand());

    List<Object> arguments = command.getArguments();
    assertEquals(2, arguments.size());
    assertEquals(COPYBOOK_NAME, arguments.get(0));
    assertEquals(DOCUMENT_URI, arguments.get(1));
  }
}
