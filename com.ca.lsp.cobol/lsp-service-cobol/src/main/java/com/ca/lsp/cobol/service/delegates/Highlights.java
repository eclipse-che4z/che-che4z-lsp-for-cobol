/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.service.delegates;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.references.References;
import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import org.eclipse.lsp4j.*;

/**
 * This Class processes text Highlight requests for semantic elements, it's logic is dependant on
 * References class.
 *
 * @see References
 */
public class Highlights {

  private Highlights() {
    throw new AssertionError("Suppress default constructor for noninstantiability");
  }
  
  public static List<DocumentHighlight> findHighlights(
      MyDocumentModel myDocumentModel, TextDocumentPositionParams position) {
    return References.findReferences(myDocumentModel, position, new ReferenceContext(true)).stream()
        .filter(byUri(position))
        .map(toDocumentHighlight())
        .collect(Collectors.toList());
  }

  private static Predicate<Location> byUri(TextDocumentPositionParams position) {
    return it -> it.getUri().equals(position.getTextDocument().getUri());
  }

  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return it -> new DocumentHighlight(it.getRange(), DocumentHighlightKind.Text);
  }
}
