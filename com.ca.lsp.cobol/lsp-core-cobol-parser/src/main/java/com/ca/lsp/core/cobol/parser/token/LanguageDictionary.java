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
package com.ca.lsp.core.cobol.parser.token;

import lombok.Builder;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.Vocabulary;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Data
@Builder
public class LanguageDictionary {
  private Vocabulary intVoc;

  public List<String> getSymbols() {
    LOG.debug("Converting Dictionary to Strings ....");
    List<String> symbols = new ArrayList<>();
    for (int i = 0; i < intVoc.getMaxTokenType(); i++) {
      symbols.add(intVoc.getSymbolicName(i));
    }
    return symbols;
  }
}
