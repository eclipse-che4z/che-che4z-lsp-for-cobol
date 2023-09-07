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
package org.eclipse.lsp.cobol.service;

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.FoldingRange;

import java.util.ArrayList;
import java.util.List;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.NodeType.COPY;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

/**
 * FoldingRange helper
 */
@UtilityClass
class DocumentServiceHelper {

  /**
   * Creates folding ranges for given document symbol table
   * @param documentSymbols - document symbol table
   * @return list of folding ranges
   */
  public List<FoldingRange> getFoldingRangeFromDocumentSymbol(List<DocumentSymbol> documentSymbols) {
    if (documentSymbols == null) {
      return ImmutableList.of();
    }
    List<FoldingRange> foldingRanges = new ArrayList<>();
    for (DocumentSymbol documentSymbol : documentSymbols) {
      foldingRanges.add(
          new FoldingRange(
              documentSymbol.getSelectionRange().getStart().getLine(),
              documentSymbol.getSelectionRange().getEnd().getLine()));
      foldingRanges.addAll(getFoldingRangeFromDocumentSymbol(documentSymbol.getChildren()));
    }
    return foldingRanges;
  }

  /**
   * Extracts copybook uris from analysis result
   * @param result - analysis result
   * @return - list of copybook uris
   */
  public List<String> extractCopybookUris(AnalysisResult result) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(COPY))
        .map(CopyNode.class::cast)
        .map(CopyNode::getUri)
        .filter(def -> !StringUtils.isEmpty(def))
        .collect(toList());
  }

}
