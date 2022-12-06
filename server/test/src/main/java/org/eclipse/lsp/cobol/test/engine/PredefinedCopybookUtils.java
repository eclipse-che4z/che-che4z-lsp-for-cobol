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

package org.eclipse.lsp.cobol.test.engine;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks;
import org.eclipse.lsp.cobol.test.CobolText;

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
            files.readImplicitCode(retrieveRealName(name, sqlBackend)));
  }

  /**
   * Load and clean up all the predefined copybooks
   *
   * @param sqlBackend backend for the copybooks
   * @param programUri uri of the program
   * @return list of models for predefined copybooks
   */
  List<CopybookModel> loadPredefinedCopybooks(SQLBackend sqlBackend, List<CobolText> copybooks, String programUri) {
    return PredefinedCopybooks.getNames().stream()
        .map(name -> retrieveModel(new CopybookName(name, findDialect(name, copybooks)), programUri, sqlBackend))
        .collect(Collectors.toList());
  }

  private String findDialect(String name, List<CobolText> copybooks) {
    return copybooks.stream()
        .filter(c -> c.getFileName().equals(name))
        .findFirst()
        .map(CobolText::getDialectType)
        .orElse(null);
  }

  private CopybookModel retrieveModel(CopybookName copybookName, String programUri, SQLBackend sqlBackend) {
    final String name = retrieveRealName(copybookName.getDisplayName(), sqlBackend);

    String content = files.readImplicitCode(name);

    final PreprocessedDocument cleanCopybook =
        AnnotatedDocumentCleaning.prepareDocument(
            content,
            ImmutableList.of(),
            ImmutableList.of(),
            ImmutableMap.of(),
            sqlBackend);
    String fullUrl = ImplicitCodeUtils.createFullUrl(name);
    return new CopybookModel(copybookName.toCopybookId(programUri), copybookName, fullUrl, cleanCopybook.getText());
  }

  private String retrieveRealName(String name, SQLBackend sqlBackend) {
    return PredefinedCopybooks.forName(name).nameForBackend(sqlBackend);
  }
}
