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
import com.google.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.tree.Describable;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.utils.SyntaxTreeUtil;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.MarkedString;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import javax.annotation.Nullable;
import java.util.Optional;

/** The class provides hover information for variables. */
@Singleton
public class VariableHover implements HoverProvider {
  @Nullable
  @Override
  public Hover getHover(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    return Optional.ofNullable(document)
        .map(CobolDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getRootNode)
        .flatMap(root -> SyntaxTreeUtil.findNodeByPosition(root, position))
        .filter(element -> element instanceof Describable)
        .map(Describable.class::cast)
        .map(VariableHover::createHoverInfo)
        .orElse(null);
  }

  private static Hover createHoverInfo(Describable element) {
    return new Hover(
        ImmutableList.of(
            Either.forRight(
                // Hover coloring didn't work if the language is "COBOL" (our language ID)
                new MarkedString("cobol", element.getFormattedDisplayString()))));
  }
}
