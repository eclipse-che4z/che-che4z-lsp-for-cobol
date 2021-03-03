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

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.SubroutineService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp4j.CompletionItemKind;

import java.util.Collection;

import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.SUBROUTINES;

/**
 * Provide completion functionality for subroutines.
 */
@Singleton
public class SubroutineCompletion implements Completion {
  private final SubroutineService subroutineService;

  @Inject
  public SubroutineCompletion(SubroutineService subroutineService) {
    this.subroutineService = subroutineService;
  }

  @Override
  public @NonNull Collection<String> getCompletionSource(CobolDocumentModel document) {
    return subroutineService.getNames();
  }

  @Override
  public @NonNull String getSortOrderPrefix() {
    return SUBROUTINES.prefix;
  }

  @Override
  public @NonNull CompletionItemKind getKind() {
    return CompletionItemKind.File;
  }
}
