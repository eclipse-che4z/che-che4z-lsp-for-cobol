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
import lombok.NonNull;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.Map;

/** This class is a provider for locations of subroutine defined/used in the document */
public class SubroutineLocations implements SemanticLocations {
  @Override
  public @NonNull Map<String, List<Location>> references(@NonNull CobolDocumentModel document) {
    return document.getAnalysisResult().getSubroutineUsages();
  }

  @Override
  public @NonNull Map<String, List<Location>> definitions(@NonNull CobolDocumentModel document) {
    return document.getAnalysisResult().getSubroutineDefinitions();
  }

  @Override
  public boolean containsToken(@NonNull CobolDocumentModel document, @NonNull String token) {
    return document.getAnalysisResult().getSubroutineUsages().keySet().stream().anyMatch(token::equalsIgnoreCase);
  }
}
