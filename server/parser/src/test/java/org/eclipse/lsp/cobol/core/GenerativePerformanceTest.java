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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core;

import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.eclipse.lsp.cobol.test.codegen.CobolCodeGenerator;
import org.eclipse.lsp.cobol.test.codegen.GeneratorSettings;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Performance test on generated code.
 */
@Disabled("Not ready to run in CI yet.")
class GenerativePerformanceTest {
  // TODO:
  // * keep random seed

  private static Map<Integer, Long> sizeToTiming = new LinkedHashMap<>();

  @ParameterizedTest
  @MethodSource("sources")
  void test(String source) {
    ParserSettings settings = new ParserSettings();
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), settings);
    long start = System.nanoTime();
    cobolParser.parse();
    sizeToTiming.put(source.length(), (System.nanoTime() - start) / 1_000_000);
  }

  @AfterAll
  static void processResults() {
    System.out.print("[");
    System.out.print(sizeToTiming.keySet().stream().map(String::valueOf).collect(Collectors.joining(",")));
    System.out.println("],");
    System.out.print("[");
    System.out.print(sizeToTiming.values().stream().map(String::valueOf).collect(Collectors.joining(",")));
    System.out.println("]");
  }

  static Stream<Arguments> sources() {
    List<Arguments> arguments = new ArrayList<>();
    for (int i = 0; i < 50; i++) {
      GeneratorSettings settings = new GeneratorSettings();
      settings.setStatementCount(i * 1000);
      arguments.add(Arguments.arguments(new CobolCodeGenerator(settings).generate()));
    }
    return arguments.stream();
  }
}
