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

package com.ca.lsp.cobol.service.delegates.references;

import com.ca.lsp.cobol.service.MyDocumentModel;
import org.eclipse.lsp4j.Location;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.Map;

/**
 * This class is a provider for predefined variables, used in the document. These variables defined
 * implicitly, so the definitions list should be empty.
 */
public class ConstantLocations implements SemanticLocations {

  @Nonnull
  @Override
  public Map<String, List<Location>> references(@Nonnull MyDocumentModel document) {
    return document.getAnalysisResult().getConstantUsages();
  }

  @Nonnull
  @Override
  public Map<String, List<Location>> definitions(@Nonnull MyDocumentModel document) {
    return Map.of();
  }

  @Override
  public boolean containsToken(@Nonnull MyDocumentModel document, @Nonnull String token) {
    return document.getAnalysisResult().getConstantDefinitions().keySet().stream()
        .anyMatch(token::equalsIgnoreCase);
  }
}
