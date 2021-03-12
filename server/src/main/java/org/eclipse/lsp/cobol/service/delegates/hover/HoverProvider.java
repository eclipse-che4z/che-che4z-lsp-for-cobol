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
package org.eclipse.lsp.cobol.service.delegates.hover;

import lombok.NonNull;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.TextDocumentPositionParams;

import javax.annotation.Nullable;

/**
 * This class provides Hover information for some particular position in text.
 */
public interface HoverProvider {
  /**
   * Get hover for provided position.
   *
   * @param document - document model that contains a semantic context
   * @param position - cursor position
   * @return the hover example or null if hover is no available
   */
  @Nullable
  Hover getHover(@Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position);
}
