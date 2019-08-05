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
import org.eclipse.lsp4j.TextEdit;

import java.util.List;

public class Formations {

  private Formations() {
    throw new AssertionError("Suppress default constructor for noninstantiability");
  }

  private static final Formation FORMATION = new TrimFormation();

  public static List<? extends TextEdit> format(MyDocumentModel model) {
    return FORMATION.format(model.getLines());
  }

}
