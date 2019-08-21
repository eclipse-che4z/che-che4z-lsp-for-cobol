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
 *
 */

package com.ca.lsp.cobol.service.delegates.references;

import com.ca.lsp.cobol.service.MyDocumentModel;
import org.eclipse.lsp4j.Range;

import java.util.List;

class ParagraphReferences extends AbstractReferences {
  @Override
  List<Range> retrieveReferenceRanges(MyDocumentModel document, String token) {
    return retrieveRanges(document.getAnalysisResult().getParagraphUsages(), token);
  }

  @Override
  List<Range> retrieveDefinitionRanges(MyDocumentModel document, String token) {
    return retrieveRanges(document.getAnalysisResult().getParagraphDefinitions(), token);
  }


  @Override
  boolean providerContainsToken(MyDocumentModel document, String token) {
    return document.getAnalysisResult().getParagraphDefinitions().keySet().stream()
            .anyMatch(token::equalsIgnoreCase);
  }
}
