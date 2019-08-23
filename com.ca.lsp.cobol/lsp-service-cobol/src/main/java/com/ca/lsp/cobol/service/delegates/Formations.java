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
import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.TextEdit;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@UtilityClass
public class Formations {
  private static final Formation FORMATION = new TrimFormation();

  public List<TextEdit> format(MyDocumentModel model) {
    return Optional.ofNullable(model)
        .map(it -> FORMATION.format(it.getLines()))
        .orElseGet(Collections::emptyList);
  }
}
