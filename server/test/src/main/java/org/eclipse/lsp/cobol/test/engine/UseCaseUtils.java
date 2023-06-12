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
package org.eclipse.lsp.cobol.test.engine;

import com.google.inject.Injector;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.UseCaseInitializer;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;

import java.util.List;
import java.util.ServiceLoader;
import java.util.stream.StreamSupport;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/**
 * This utility class provides methods to run use cases with COBOL code examples.
 */
@Slf4j
@UtilityClass
public class UseCaseUtils {
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";
  public static final String DOCUMENT2_URI = "file:///c:/workspace/document2.cbl";

  public static final String COPYBOOK_URI = "file///c:/copybooks/copybook.cpy";
  private static final String CPY_URI_PREFIX = "file:///c:/workspace/.c4z/.copybooks/";
  private static final String CPY_URI_SUFFIX = ".cpy";

  /**
   * Construct the file URI from provided file name
   *
   * @param name the copybook name without extension
   * @param dialect the copybook dialect name
   * @return the URI
   */
  public static String toURI(String name, String dialect) {
    StringBuilder sb = new StringBuilder(CPY_URI_PREFIX);
    if (dialect != null) {
      sb.append(dialect);
      sb.append("/");
    }
    sb.append(name);
    sb.append(CPY_URI_SUFFIX);
    return sb.toString();
  }

  /**
   * Construct the file URI from provided file name
   *
   * @param name the copybook name without extension
   * @return the URI
   */
  public static String toURI(String name) {
    return CPY_URI_PREFIX + name + CPY_URI_SUFFIX;
  }

  /**
   * Analyze the given text using a real language engine leaving only the diagnostics with the
   * severe (level 1) errors providing copybooks required for the analysis
   *
   * @param useCase use case instance to analyze
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(UseCase useCase) {
    return ofNullable(analyze(useCase).getDiagnostics().get(useCase.getDocumentUri()))
        .map(
            diagnostics ->
                diagnostics.stream()
                    .filter(it -> it.getSeverity() == DiagnosticSeverity.Error)
                    .collect(toList()))
        .orElse(emptyList());
  }

  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis with the required sync type
   *
   * @param useCase       use case instance to analyze
   * @return the entire analysis result
   */
  public static AnalysisResult analyze(UseCase useCase) {

    ServiceLoader<UseCaseInitializer> loader = ServiceLoader.load(UseCaseInitializer.class);
    Injector injector = StreamSupport.stream(loader.spliterator(), false).findFirst()
        .map(UseCaseInitializer::createInjector)
        .orElseThrow(() -> new RuntimeException("UseCase initializer not found"));

    CleanerPreprocessor preprocessor = injector.getInstance(CleanerPreprocessor.class);

    CopybookService copybookService = injector.getInstance(CopybookService.class);
    PredefinedCopybookUtils.loadPredefinedCopybooks(useCase.getSqlBackend(), useCase.getCopybooks(), useCase.documentUri)
        .forEach(pc -> copybookService.store(pc, true));

    useCase.getCopybooks()
        .forEach(cobolText -> {

          String copybookText = cobolText.getFullText();
          if (cobolText.isPreprocess()) {
            copybookText = preprocessor.cleanUpCode("uri", cobolText.getFullText())
                .getResult().toString();
          }

          cobolText = new CobolText(cobolText.getFileName().toUpperCase(), cobolText.getDialectType(), copybookText);
          copybookService.store(UseCaseUtils.toCopybookModel(cobolText, useCase.documentUri), true);
        });

    SubroutineService subroutines = injector.getInstance(SubroutineService.class);
    useCase.getSubroutines().forEach(name -> subroutines.store(name, "URI:" + name));

    return injector
        .getInstance(LanguageEngineFacade.class)
        .analyze(useCase.getDocumentUri(), useCase.getText(), useCase.getAnalysisConfig());
  }
  /**
   * Convert CobolText to CopybookModel
   *
   * @param cobolText the CobolText instance
   * @param programUri main program uri
   * @return the CopybookModel instance
   */
  public static CopybookModel toCopybookModel(CobolText cobolText, String programUri) {
    String uri = toURI(cobolText.getFileName(), cobolText.getDialectType());
    CopybookName copybookName = new CopybookName(cobolText.getFileName(), cobolText.getDialectType());
    return new CopybookModel(copybookName.toCopybookId(programUri), copybookName,
            uri, cobolText.getFullText());
  }
}
