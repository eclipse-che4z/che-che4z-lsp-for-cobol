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
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.PredefinedCopybooks;
import org.eclipse.lsp.cobol.service.utils.WorkspaceFileService;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/** This util class allows retrieving and processing the predefined copybooks for syntax analysis */
@Slf4j
@UtilityClass
class PredefinedCopybookUtils {

  private final WorkspaceFileService files = new WorkspaceFileService();
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
            ImplicitCodeUtils.readImplicitCode(files, retrieveRealName(name, sqlBackend)));
  }

  /**
   * Load and clean up all the predefined copybooks
   *
   * @param sqlBackend backend for the copybooks
   * @return list of models for predefined copybooks
   */
  List<CopybookModel> loadPredefinedCopybooks(SQLBackend sqlBackend, List<CobolText> copybooks) {
    return PredefinedCopybooks.getNames().stream()
        .map(name -> retrieveModel(new CopybookName(name, findDialect(name, copybooks)), sqlBackend))
        .collect(Collectors.toList());
  }

  private String findDialect(String name, List<CobolText> copybooks) {
    return copybooks.stream()
        .filter(c -> c.getFileName().equals(name))
        .findFirst()
        .map(CobolText::getDialectType)
        .orElse(null);
  }

  private CopybookModel retrieveModel(CopybookName copybookName, SQLBackend sqlBackend) {
    final String name = retrieveRealName(copybookName.getDisplayName(), sqlBackend);

    String content = ImplicitCodeUtils.readImplicitCode(files, name);

    final PreprocessedDocument cleanCopybook =
        AnnotatedDocumentCleaning.prepareDocument(
            content,
            ImmutableList.of(),
            ImmutableList.of(),
            ImmutableMap.of(),
            sqlBackend);
    return new CopybookModel(copybookName, ImplicitCodeUtils.createFullUrl(name), cleanCopybook.getText());
  }

  private String retrieveRealName(String name, SQLBackend sqlBackend) {
    return PredefinedCopybooks.forName(name).nameForBackend(sqlBackend);
  }
}
