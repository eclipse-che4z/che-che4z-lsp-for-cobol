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

package org.eclipse.lsp.cobol.common.action;

import lombok.NonNull;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.List;

/**
 * Code action provider that may resolve the actions request and return a list of commands or code
 * actions according to the diagnostic's type. See {@link
 * org.eclipse.lsp.cobol.common.error.ErrorCode} for a list of types.
 */
public interface CodeActionProvider {
  /**
   * Create a list of commands or code actions according to the diagnostic's type. May be empty if
   * the given type in not supported.
   *
   * @param params - a request params
   * @return a list of commands or code actions
   */
  @NonNull
  List<Either<Command, CodeAction>> collectCommandsOrActions(@NonNull CodeActionParams params);
}
