/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 *
 */
package com.ca.lsp.cobol.service.delegates.formations;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.TextEdit;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Singleton
public class Formations {

  private Set<Formation> formatters;

  @Inject
  public Formations(Set<Formation> formations) {
    this.formatters = formations;
  }

  public List<TextEdit> format(MyDocumentModel model) {
    return Optional.ofNullable(model).map(applyFormatting()).orElse(Collections.emptyList());
  }

  private Function<MyDocumentModel, List<TextEdit>> applyFormatting() {
    return document ->
        formatters.stream()
            .map(it -> it.format(document.getLines()))
            .flatMap(List::stream)
            .collect(Collectors.toList());
  }
}
