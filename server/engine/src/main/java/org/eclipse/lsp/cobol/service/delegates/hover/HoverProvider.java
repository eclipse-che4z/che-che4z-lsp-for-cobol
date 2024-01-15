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

import com.google.common.collect.ImmutableList;
import javax.annotation.Nullable;
import lombok.NonNull;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * This class provides Hover information for some particular position in text.
 */
public interface HoverProvider {
  /**
   * Get hover for provided position.
   *
   * @param document      - document model that contains a semantic context
   * @param position      - cursor position
   * @param documentGraph - workspace doc graph
   * @return the hover example or null if hover is no available
   */
  @Nullable
  Hover getHover(@Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position, SourceUnitGraph documentGraph);

  /**
   * Get the passed content as {@link Hover}
   * @param content
   * @return Hover based on the passed content
   */
  @Nullable
  default Hover getHover(@NonNull String content) {
    return new Hover(
            ImmutableList.of(
                    Either.forRight(
                            // Hover coloring didn't work if the language is "COBOL" (our language ID)
                            new MarkedString("cobol", content))));
  }
}
