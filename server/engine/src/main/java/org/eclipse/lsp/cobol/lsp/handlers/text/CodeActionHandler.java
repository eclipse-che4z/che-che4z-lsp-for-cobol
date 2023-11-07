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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.List;

/**
 * LSP CodeAction Handler
 */
@Slf4j
public class CodeActionHandler {
  private final CodeActions actions;

  @Inject
  public CodeActionHandler(CodeActions actions) {
    this.actions = actions;
  }

  /**
   * Handle codeAction request.
   * @param params CodeActionParams.
   * @return List of either commands or code actions.
   */
  public List<Either<Command, CodeAction>> codeAction(CodeActionParams params) {
    return actions.collect(params);
  }
}
