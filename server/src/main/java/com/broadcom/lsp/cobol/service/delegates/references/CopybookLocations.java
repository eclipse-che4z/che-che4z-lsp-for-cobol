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

package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Location;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.Map;

/** This class is a provider for locations of copybooks defined/used in the document */
public class CopybookLocations implements SemanticLocations {
  @Nonnull
  @Override
  public Map<String, List<Location>> references(@Nonnull CobolDocumentModel document) {
    return document.getAnalysisResult().getCopybookUsages();
  }

  @Nonnull
  @Override
  public Map<String, List<Location>> definitions(@Nonnull CobolDocumentModel document) {
    return document.getAnalysisResult().getCopybookDefinitions();
  }

  @Override
  public boolean containsToken(@Nonnull CobolDocumentModel document, @Nonnull String token) {
    return document.getAnalysisResult().getCopybookUsages().keySet().stream()
        .anyMatch(token::equalsIgnoreCase);
  }
}
