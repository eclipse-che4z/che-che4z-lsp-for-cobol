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

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.annotation.Nullable;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.lsp.WorkspaceDocumentGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.TextDocumentPositionParams;

/**
 * Hover provider for the copybook content
 */
public class CopybookHoverProvider implements HoverProvider {
  @Nullable
  @Override
  public Hover getHover(
      @Nullable CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      WorkspaceDocumentGraph documentGraph) {
    String uri = UriHelper.decode(position.getTextDocument().getUri());
    Position hoverPosition = position.getPosition();
    if (documentGraph.isCopybook(uri)) {
      List<WorkspaceDocumentGraph.NodeV> containedCopybookNode = documentGraph.getInjectedCopybookNode(uri, hoverPosition);
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
            .map(documentGraph::getCopyNodeContent)
            .filter(Objects::nonNull)
            .map(this::getHover)
            .orElse(null);
  }
}
