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
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.Optional;
import javax.annotation.Nullable;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.Describable;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.MarkedString;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/** The class provides hover information for variables. */
@Singleton
public class VariableHover implements HoverProvider {

  private final UriDecodeService uriDecodeService;

  @Inject
  public VariableHover(UriDecodeService uriDecodeService) {
    this.uriDecodeService = uriDecodeService;
  }

  @Nullable
  @Override
  public Hover getHover(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position, SourceUnitGraph documentGraph) {
    return Optional.ofNullable(document)
        .map(CobolDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getRootNode)
        .flatMap(
            root ->
                RangeUtils.findNodeByPosition(
                    root, uriDecodeService.decode(position.getTextDocument().getUri()), position.getPosition()))
        .filter(Describable.class::isInstance)
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
