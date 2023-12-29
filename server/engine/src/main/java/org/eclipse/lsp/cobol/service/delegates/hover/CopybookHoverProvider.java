/*
 * Copyright (c) 2024 Broadcom.
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

import com.google.inject.Inject;
import java.util.List;
import java.util.Optional;
import javax.annotation.Nullable;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.TextDocumentPositionParams;

/**
 * Hover provider for the copybook content
 */
public class CopybookHoverProvider implements HoverProvider {
  private final UriDecodeService uriDecodeService;

  @Inject
  public CopybookHoverProvider(UriDecodeService uriDecodeService) {
    this.uriDecodeService = uriDecodeService;
  }

  @Nullable
  @Override
  public Hover getHover(@Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position, SourceUnitGraph documentGraph) {
    String uri = uriDecodeService.decode(position.getTextDocument().getUri());
    Position hoverPosition = position.getPosition();
    if (documentGraph.isCopybook(uri)) {
      List<SourceUnitGraph.NodeV> containedCopybookNode = documentGraph.getInjectedCopybookNode(uri, hoverPosition);
      if (!containedCopybookNode.isEmpty()) {
        return getHover(containedCopybookNode.get(0).getContent());
      }
    }
    return Optional.ofNullable(document)
            .map(CobolDocumentModel::getAnalysisResult)
            .map(AnalysisResult::getRootNode)
            .flatMap(root -> RangeUtils.findNodeByPosition(root, uri, hoverPosition))
            .filter(CopyNode.class::isInstance)
            .map(CopyNode.class::cast)
            .filter(node -> node.getUri() != null)
            .map(documentGraph::getCopyNodeContent)
            .map(this::getHover)
            .orElse(null);
  }
}
