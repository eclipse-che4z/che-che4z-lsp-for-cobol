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
package com.ca.lsp.cobol.service.delegates.references;

import com.ca.lsp.cobol.service.MyDocumentModel;
import org.eclipse.lsp4j.*;

import java.util.List;

public class References {

  private References() {
    throw new AssertionError("Suppress default constructor for noninstantiability");
  }

  private static final AbstractReferences PROVIDER = initializeDefinitionChain();

  private static AbstractReferences initializeDefinitionChain() {
    VariableReferences variableReferences = new VariableReferences();
    ParagraphReferences paragraphReferences = new ParagraphReferences();
    variableReferences.setNextProvider(paragraphReferences);
    return variableReferences;
  }

  public static List<Location> findDefinition(
      MyDocumentModel document, TextDocumentPositionParams position) {
    return PROVIDER.resolveDefinition(document, position);
  }

  public static List<Location> findReferences(MyDocumentModel document, ReferenceParams position, ReferenceContext context) {
    return PROVIDER.collectReferences(document, position, context);
  }
}
