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
package org.eclipse.lsp.cobol.test.codegen;

import org.eclipse.lsp.cobol.test.codegen.snippets.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * COBOL code generator settings.
 */
public class GeneratorSettings {
  static List<SnippetGenerator> statements = new ArrayList<>();
  static Map<SnippetGenerator, Double> statementsProbability = new HashMap<>();

  static {
    ParagraphGenerator paragraphGenerator = new ParagraphGenerator();
    SectionGenerator sectionGenerator = new SectionGenerator();

    statements.add(new DisplayStatementGenerator());
    statements.add(new OpenStatementGenerator());
    statements.add(paragraphGenerator);
    statements.add(sectionGenerator);

    statementsProbability.put(paragraphGenerator, 0.05);
    statementsProbability.put(sectionGenerator, 0.05);
    normalizeProbabilities();
  }

  private static void normalizeProbabilities() {
    if (statements.size() == statementsProbability.size()) {
      return;
    }
    int undefined = statements.size() - statementsProbability.size();
    double pK = statementsProbability.values().stream().mapToDouble(v -> v).sum();
    double pU = (1.0 - pK) / (undefined);
    statements.forEach(s -> {
      statementsProbability.computeIfAbsent(s, k -> pU);
    });
  }

  boolean enableRandom = true;
  int programs = 1;
  int statementCount = 10_000_00;

  /**
   * Select snippet to generate
   *
   * @param v random value from 0 to 1
   * @return snippet generator
   */
  public static SnippetGenerator pickStatement(double v) {
    double acc = 0;
    for (Map.Entry<SnippetGenerator, Double> entry : statementsProbability.entrySet()) {
      acc += entry.getValue();
      if (v <= acc) {
        return entry.getKey();
      }
    }
    throw new IllegalStateException();
  }

  public void setStatementCount(int statementCount) {
    this.statementCount = statementCount;
  }
}
