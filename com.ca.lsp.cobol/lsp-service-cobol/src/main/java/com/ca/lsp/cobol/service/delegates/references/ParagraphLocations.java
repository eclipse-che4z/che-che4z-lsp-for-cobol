/*
 *
 *  Copyright (c) 2019 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.service.delegates.references;

import com.ca.lsp.cobol.service.MyDocumentModel;
import org.eclipse.lsp4j.Location;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.Map;

/** This class is a provider for locations of paragraphs defined and/or used in the document */
public class ParagraphLocations implements SemanticLocations {
  @Nonnull
  @Override
  public Map<String, List<Location>> references(@Nonnull MyDocumentModel document) {
    return document.getAnalysisResult().getParagraphUsages();
  }

  @Nonnull
  @Override
  public Map<String, List<Location>> definitions(@Nonnull MyDocumentModel document) {
    return document.getAnalysisResult().getParagraphDefinitions();
  }

  @Override
  public boolean containsToken(@Nonnull MyDocumentModel document, @Nonnull String token) {
    return document.getAnalysisResult().getParagraphDefinitions().keySet().stream()
        .anyMatch(token::equalsIgnoreCase);
  }
}
