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
package org.eclipse.lsp.cobol.service.delegates.formations;

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp4j.TextEdit;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Singleton
public class Formations {

  private static final String FORMATTING = "formatting";
  private final Set<Formation> formatters;
  private final SettingsService settingsService;

  @Inject
  public Formations(Set<Formation> formations, SettingsService settingsService) {
    this.formatters = formations;
    this.settingsService = settingsService;
  }

  public List<TextEdit> format(CobolDocumentModel model) {
    List<String> settings;
    try {
      settings = settingsService.fetchConfiguration(FORMATTING)
          .get()
          .stream()
          .map(Object::toString)
          .collect(Collectors.toList());
    } catch (Exception e) {
      throw new RuntimeException(e);
    }

    return Optional.ofNullable(model).map(applyFormatting(settings)).orElse(Collections.emptyList());
  }

  private Function<CobolDocumentModel, List<TextEdit>> applyFormatting(List<String> settings) {
    return document ->
        formatters.stream()
            .map(it -> it.format(document.getLines(), settings))
            .flatMap(List::stream)
            .collect(Collectors.toList());
  }
}
