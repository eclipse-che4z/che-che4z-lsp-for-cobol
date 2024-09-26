/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.suite;

import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.PreprocessedDocument;
import org.eclipse.lsp.cobol.test.engine.TestData;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.extension.ExtensionContext;
import org.junit.jupiter.api.extension.TestWatcher;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;

import static org.eclipse.lsp.cobol.usecases.suite.TestWatcherHelper.ROOT_DIRECTORY_PROPERTY;

/**
 * This is unit test watcher class and is responsible to write test data if "usecase.test.repo.dir"
 * system property is configured
 */
@Slf4j
public class UniqueIdTestWatcher implements TestWatcher {
  public static final String SOURCE_CBL = "source.cbl";
  public static final String COPYBOOK_EXT = ".cpy";

  @Override
  public void testSuccessful(ExtensionContext context) {
    interceptor(context);
  }

  @Override
  public void testFailed(ExtensionContext context, Throwable cause) {
    LOG.info("{} test failed", context.getRequiredTestMethod().toString());
    interceptor(context);
  }

  @Override
  public void testAborted(ExtensionContext context, Throwable cause) {
    LOG.info("{} test is aborted", context.getRequiredTestMethod().toString());
    interceptor(context);
  }

  @Override
  public void testDisabled(ExtensionContext context, Optional<String> reason) {
    LOG.info(
        "{} test is disabled due to {}",
        context.getRequiredTestMethod().toString(),
        reason.orElse("unknown reason"));
  }

  @SneakyThrows
  private static void interceptor(ExtensionContext context) {
    Optional<String> rootDirectory =
        Optional.ofNullable(System.getProperty(ROOT_DIRECTORY_PROPERTY));
    if (rootDirectory.isPresent()) {
      String rootFolder = rootDirectory.get();
      PreprocessedDocument document = getDocumentFromContext(context);

      Path mainFolderPath = TestWatcherHelper.fetchTargetPath(context, rootFolder);
      writeCobolDocument(document, mainFolderPath);
      writeCopybooks(document.getCopybooks(), mainFolderPath);
      if (Objects.nonNull(document.getTestData())) {
        writeTestData(document.getTestData(), mainFolderPath);
        createZeroDiagnosticIndicatorFile(document.getTestData(), mainFolderPath);
      } else {
        LOG.info("no test data for {}", context.getRequiredTestMethod().toString());
        Files.createFile(mainFolderPath.resolve("NoTestData"));
      }
    }
  }

  private static PreprocessedDocument getDocumentFromContext(ExtensionContext context) {
    return (PreprocessedDocument)
        context
            .getStore(ExtensionContext.Namespace.create(context.getRequiredTestMethod()))
            .get("document");
  }

  private static void writeCobolDocument(PreprocessedDocument document, Path mainFolderPath)
      throws IOException {
    Path cobolDocPath = mainFolderPath.resolve(SOURCE_CBL);
    writeToFile(cobolDocPath, document.getText());
  }

  private static void writeCopybooks(List<CobolText> copybooks, Path mainFolderPath) {
    copybooks.forEach(
        cobolText -> {
          try {
            Path filePath = mainFolderPath.resolve(cobolText.getFileName() + COPYBOOK_EXT);
            writeToFile(filePath, cobolText.getFullText());
            System.out.println("Created file: " + filePath);
          } catch (IOException e) {
            System.err.println("Error writing copybook: " + e.getMessage());
          }
        });
  }

  private static void writeTestData(TestData testData, Path mainFolderPath) throws IOException {
    Path testDataPath = mainFolderPath.resolve("testData.txt");
    writeToFile(testDataPath, testData.toString());
  }

  private static void writeToFile(Path filePath, String content) throws IOException {
    Files.write(filePath, content.getBytes());
  }

  private static void createZeroDiagnosticIndicatorFile(TestData testData, Path mainFolderPath)
      throws IOException {
    boolean hasErrorDiagnostics =
        testData.getDiagnostics().values().stream()
            .flatMap(List::stream)
            .anyMatch(d -> d.getSeverity() == DiagnosticSeverity.Error);

    Path diaFlag = mainFolderPath.resolve("ZeroDiagnosticsFlag");
    if (!hasErrorDiagnostics) {
      if (!Files.exists(diaFlag)) Files.createFile(diaFlag);
    } else {
      Files.deleteIfExists(diaFlag);
    }
  }
}
