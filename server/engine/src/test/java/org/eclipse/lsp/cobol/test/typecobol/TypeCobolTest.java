/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.test.typecobol;

import com.google.inject.Guice;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.domain.modules.ServiceModule;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Run TypeCobol tests. To run them you will need to download
 * <a href="https://github.com/TypeCobolTeam/TypeCobol">TypeCobol project source codes</a>
 * and provide path to tests using -Dtypecobol.tests.path jvm parameter.
 */
public class TypeCobolTest {
  private static final String TYPE_COBOL_TEST_PATH_ARGUMENT_NAME = "typecobol.tests.path";
  private static final String TYPE_COBOL_TEST_PATH =
      System.getProperty(TYPE_COBOL_TEST_PATH_ARGUMENT_NAME);

  @ParameterizedTest
  @Disabled
  @MethodSource("arguments")
  void test(TestData data) {
    CobolLanguageEngine cle = createLanguageEngine();
    ResultWithErrors<AnalysisResult> result =
        cle.run(data.getDocumentUri(), data.getText(), data.getAnalysisConfig());
    // FIXME That is not correct, we should read expected errors from files too
    Assertions.assertTrue(result.getResult().getDiagnostics().isEmpty());
  }

  private CobolLanguageEngine createLanguageEngine() {
    return Guice.createInjector(new ServiceModule(), new EngineModule(), new DatabusModule())
        .getInstance(CobolLanguageEngine.class);
  }

  private static Stream<Arguments> arguments() {
    if (TYPE_COBOL_TEST_PATH == null) {
      System.err.println("Please provide -Dtypecobol.tests.path argument with path to folder with TypeCobol tests.");
      return Stream.of();
    }

    try (Stream<Path> walk = Files.walk(Paths.get(TYPE_COBOL_TEST_PATH))) {
      List<Path> cbls =
          walk.filter(f -> f.toFile().isFile() && f.toString().toLowerCase().endsWith(".cbl"))
              .collect(Collectors.toList());
      return cbls.stream().map(TestData::new).map(Arguments::arguments);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Getter
  private static class TestData {
    private final String documentUri;
    private final String text;

    TestData(Path p) {
      documentUri = p.toFile().toURI().toString();
      try {
        text = new String(removeBom(Files.readAllBytes(p)));
      } catch (IOException e) {
        throw new RuntimeException(e);
      }
    }

    private byte[] removeBom(byte[] bytes) {
      if (bytes[0] == (byte) 0xEF && bytes[1] == (byte) 0xBB && bytes[2] == (byte) 0xBF) {
        return Arrays.copyOfRange(bytes, 3, bytes.length);
      }
      return bytes;
    }

    public AnalysisConfig getAnalysisConfig() {
      return AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED);
    }
  }
}
