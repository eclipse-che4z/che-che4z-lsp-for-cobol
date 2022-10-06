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
package org.eclipse.lsp.cobol.usecases.engine;

import com.google.common.collect.ImmutableList;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.SubroutineService;
import org.eclipse.lsp.cobol.service.SubroutineServiceImpl;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.WatcherServiceImpl;
import org.eclipse.lsp.cobol.service.copybooks.CopybookReferenceRepo;
import org.eclipse.lsp.cobol.service.copybooks.CopybookReferenceRepoImpl;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookServiceImpl;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp.cobol.service.utils.WorkspaceFileService;
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
    return ofNullable(analyze(useCase).getDiagnostics().get(useCase.getFileName()))
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
    SettingsService mockSettingsService = mock(SettingsService.class);
    when(mockSettingsService.fetchConfiguration(any()))
        .thenReturn(CompletableFuture.completedFuture(ImmutableList.of()));

    CobolLanguageClient languageClient = mock(CobolLanguageClient.class);
    Injector injector =
        Guice.createInjector(
            new EngineModule(),
            new DatabusModule(),
            new AbstractModule() {
              @Override
              protected void configure() {
                bind(CopybookService.class).to(CopybookServiceImpl.class);
                bind(SettingsService.class).toInstance(mockSettingsService);
                bind(FileSystemService.class).toInstance(new WorkspaceFileService());
                bind(CobolLanguageClient.class).toInstance(languageClient);
                bind(SubroutineService.class).to(SubroutineServiceImpl.class);
                bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
                bind(WatcherService.class).to(WatcherServiceImpl.class);
                bind(CopybookReferenceRepo.class).toInstance(new CopybookReferenceRepoImpl());
              }
            });

    TextPreprocessor preprocessor = injector.getInstance(TextPreprocessor.class);

    CopybookService copybookService = injector.getInstance(CopybookService.class);
    PredefinedCopybookUtils.loadPredefinedCopybooks(useCase.getSqlBackend(), useCase.getCopybooks())
        .forEach(copybookModel -> copybookService.store(copybookModel, useCase.fileName));

    useCase.getCopybooks()
        .forEach(cobolText -> {

          String copybookText = cobolText.getFullText();
          if (cobolText.isPreprocess()) {
            copybookText = preprocessor.cleanUpCode("uri", cobolText.getFullText())
                .getResult().calculateExtendedText();
          }

          cobolText = new CobolText(cobolText.getFileName().toUpperCase(), cobolText.getDialectType(), copybookText);
          CopybookModel copybookModel = UseCaseUtils.toCopybookModel(cobolText);
          copybookService.store(copybookModel, useCase.fileName);
        });

    SubroutineService subroutines = injector.getInstance(SubroutineService.class);
    useCase.getSubroutines().forEach(name -> subroutines.store(name, "URI:" + name));

    return injector
        .getInstance(CobolLanguageEngineFacade.class)
        .analyze(useCase.getFileName(), useCase.getText(), useCase.getAnalysisConfig());
  }
  /**
   * Convert CobolText to CopybookModel
   *
   * @param cobolText the CobolText instance
   * @return the CopybookModel instance
   */
  public static CopybookModel toCopybookModel(CobolText cobolText) {
    return new CopybookModel(
        new CopybookName(
            cobolText.getFileName(),
            cobolText.getDialectType()),
        toURI(cobolText.getFileName(), cobolText.getDialectType()),
        cobolText.getFullText());
  }
}
