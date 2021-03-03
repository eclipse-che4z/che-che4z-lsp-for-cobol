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
package org.eclipse.lsp.cobol.service.delegates.validations;

import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.*;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import com.google.common.collect.ImmutableList;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** This utility class provides methods to run use cases with COBOL code examples. */
@UtilityClass
public class UseCaseUtils {
  public static final String DOCUMENT_URI = "file:///c%3A/workspace/document.cbl";
  public static final String DOCUMENT_2_URI = "file:///c%3A/workspace/document2.cbl";

  private static final String CPY_URI_PREFIX = "file:///c%3A/workspace/.c4z/.copybooks/";
  private static final String CPY_URI_SUFFIX = ".cpy";

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
   * severe (level 1) errors.
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(String fileName, String text) {
    return analyzeForErrors(fileName, text, emptyList());
  }

  /**
   * Analyze the given text using a real language engine leaving only the diagnostics with the
   * severe (level 1) errors providing copybooks required for the analysis
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(
      String fileName, String text, List<CobolText> copybooks) {
    return ofNullable(analyze(fileName, text, copybooks).getDiagnostics().get(fileName))
        .map(
            diagnostics ->
                diagnostics.stream()
                    .filter(it -> it.getSeverity() == DiagnosticSeverity.Error)
                    .collect(toList()))
        .orElse(emptyList());
  }

  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @return the entire analysis result
   */
  public static AnalysisResult analyze(String fileName, String text, List<CobolText> copybooks) {
    return analyze(fileName, text, copybooks, ImmutableList.of(), CopybookProcessingMode.ENABLED);
  }

  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @param subroutineNames - list of available subroutine names
   * @return the entire analysis result
   */
  public static AnalysisResult analyze(
      String fileName, String text, List<CobolText> copybooks, List<String> subroutineNames) {
    return analyze(fileName, text, copybooks, subroutineNames, CopybookProcessingMode.ENABLED);
  }

  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis with the required sync type
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @param subroutineNames - list of available subroutine names
   * @param copybookProcessingMode - sync type for the analysis
   * @return the entire analysis result
   */
  public static AnalysisResult analyze(
      String fileName,
      String text,
      List<CobolText> copybooks,
      List<String> subroutineNames,
      CopybookProcessingMode copybookProcessingMode) {
    SettingsService mockSettingsService = mock(SettingsService.class);
    when(mockSettingsService.getConfiguration(any()))
        .thenReturn(CompletableFuture.completedFuture(ImmutableList.of()));

    CobolLanguageClient languageClient = mock(CobolLanguageClient.class);
    FileSystemService mockFileSystemService = mock(FileSystemService.class);
    when(mockFileSystemService.getNameFromURI(any())).thenReturn("");
    Injector injector =
        Guice.createInjector(
            new EngineModule(),
            new DatabusModule(),
            new AbstractModule() {
              @Override
              protected void configure() {
                bind(CopybookService.class).to(CopybookServiceImpl.class);
                bind(SettingsService.class).toInstance(mockSettingsService);
                bind(FileSystemService.class).toInstance(mockFileSystemService);
                bind(CobolLanguageClient.class).toInstance(languageClient);
                bind(SubroutineService.class).to(SubroutineServiceImpl.class);
              }
            });

    CopybookService copybookService = injector.getInstance(CopybookService.class);
    copybooks.stream().map(UseCaseUtils::toCopybookModel).forEach(copybookService::store);

    SubroutineService subroutines = injector.getInstance(SubroutineService.class);
    subroutineNames.forEach(name -> subroutines.store(name, "URI:" + name));

    return injector
        .getInstance(CobolLanguageEngineFacade.class)
        .analyze(fileName, text, copybookProcessingMode);
  }

  /**
   * Convert CobolText into CopybookModel.
   *
   * @param cobolText the CobolText instance
   * @return the CopybookModel instance
   */
  public static CopybookModel toCopybookModel(CobolText cobolText) {
    return new CopybookModel(
        cobolText.getFileName(), toURI(cobolText.getFileName()), cobolText.getFullText());
  }
}
