/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.usecases.engine;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookName;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.CopybookServiceImpl;
import org.eclipse.lsp.cobol.service.PredefinedCopybooks;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.utils.WorkspaceFileService;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.PREF_IMPLICIT;

/** This util class allows retrieving and processing the predefined copybooks for syntax analysis */
@Slf4j
@UtilityClass
class PredefinedCopybookUtils {
  /**
   * Retrieve the predefined copybook content using the given name and the sqlBackend and convert it
   * to the CobolText
   *
   * @param sqlBackend backend to retrieve the correct coopybook URI
   * @return mapper from copybook name to {@link CobolText}
   */
  Function<String, CobolText> toCobolText(SQLBackend sqlBackend) {
    return name ->
        new CobolText(
            name,
            readContentForImplicitCopybook(
                PredefinedCopybooks.forName(name).uriForBackend(sqlBackend)));
  }

  /**
   * Load and clean up all the predefined copybooks
   *
   * @param sqlBackend backend for the copybooks
   * @return list of models for predefined copybooks
   */
  List<CopybookModel> loadPredefinedCopybooks(SQLBackend sqlBackend, List<CobolText> copybooks) {
    return PredefinedCopybooks.getNames().stream()
        .map(
            name -> retrieveModel(new CopybookName(name, findDialect(name, copybooks)), sqlBackend))
        .collect(Collectors.toList());
  }

  private String findDialect(String name, List<CobolText> copybooks) {
    return copybooks.stream()
        .filter(c -> c.getFileName().equals(name))
        .findFirst()
        .map(CobolText::getDialectType)
        .orElse(DialectType.COBOL.name());
  }

  private CopybookModel retrieveModel(CopybookName copybookName, SQLBackend sqlBackend) {
    final String uri = retrievePredefinedUri(copybookName.getDisplayName(), sqlBackend);

    final PreprocessedDocument cleanCopybook =
        AnnotatedDocumentCleaning.prepareDocument(
            readContentForImplicitCopybook(uri),
            ImmutableList.of(),
            ImmutableList.of(),
            ImmutableMap.of(),
            sqlBackend);
    return new CopybookModel(copybookName, PREF_IMPLICIT + uri, cleanCopybook.getText());
  }

  private String retrievePredefinedUri(String name, SQLBackend sqlBackend) {
    return PredefinedCopybooks.forName(name).uriForBackend(sqlBackend);
  }

  private String readContentForImplicitCopybook(String resourcePath) {
    InputStream inputStream = CopybookServiceImpl.class.getResourceAsStream(resourcePath);
    String content = null;
    try {
      content =
          new WorkspaceFileService()
              .readFromInputStream(Objects.requireNonNull(inputStream), StandardCharsets.UTF_8);
    } catch (IOException e) {
      LOG.error("Implicit copybook is not loaded. ", e);
    }
    return content;
  }
}
