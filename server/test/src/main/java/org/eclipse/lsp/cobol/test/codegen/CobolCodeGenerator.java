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

import org.eclipse.lsp.cobol.test.codegen.snippets.ParagraphGenerator;
import org.eclipse.lsp.cobol.test.codegen.snippets.SectionGenerator;
import org.eclipse.lsp.cobol.test.codegen.snippets.SnippetGenerator;

import java.util.Random;

/**
 * COBOL Code Generator.
 */
public class CobolCodeGenerator {
  private static final Random RANDOM = new Random();
  private final GeneratorSettings settings;
  private GeneratorContext ctx = new GeneratorContext();

  /**
   * Create a new instance of COBOL Code Generator.
   *
   * @param settings CCG settings
   */
  public CobolCodeGenerator(GeneratorSettings settings) {
    this.settings = settings;
  }

  /**
   * Generate a source code.
   *
   * @return the source code.
   */
  public String generate() {
    return generateSourceUnit();
  }

  private String generateSourceUnit() {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < settings.programs; i++) {
      sb.append(generateProgram());
    }
    return sb.toString();
  }

  private String generateProgram() {
    StringBuilder sb = new StringBuilder();
    sb.append(generateIdentificationDivision());
    sb.append(generateDataDivision());
// TODO:    sb.append(generatEenvironmentDivision());
    sb.append(generateProcedureDivision());
    return sb.toString();
  }

  private String generateProcedureDivision() {
    StringBuilder sb = new StringBuilder();
    sb.append(indent());
    sb.append("PROCEDURE");
    sb.append(space());
    sb.append("DIVISION.");
    sb.append(newLine());
    sb.append(generateProcedureDivisionContent());
    return sb.toString();
  }

  private String generateProcedureDivisionContent() {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < settings.statementCount; i++) {
      sb.append(indent());
      SnippetGenerator snippetGenerator = selectNextStatement();
      if (!(snippetGenerator instanceof SectionGenerator
              || snippetGenerator instanceof ParagraphGenerator)) {
        sb.append("    ");
      }
      sb.append(snippetGenerator.generate(ctx));
      sb.append(".");
      sb.append(newLine());
    }
    return sb.toString();
  }

  private static SnippetGenerator selectNextStatement() {
    return GeneratorSettings.pickStatement(RANDOM.nextDouble());
  }


  private String generateDataDivision() {
    return "";
  }

  private String generateIdentificationDivision() {
    StringBuilder sb = new StringBuilder();
    sb.append(indent());
    sb.append(rand("ID", "IDENTIFICATION"));
    sb.append(space());
    sb.append("DIVISION.");
    sb.append(newLine());
    sb.append(indent());
    sb.append("PROGRAM-ID");
    sb.append(rand(space(), ".", "." + newLine() + indent()));
    sb.append(ctx.generateIdentifier(IdentifierType.PROGRAM_NAME));
    sb.append(rand("", "."));
    sb.append(newLine());
    return sb.toString();
  }

  private String rand(String... options) {
    if (settings.enableRandom) {
      return options[RANDOM.nextInt(options.length)];
    } else {
      return options[0];
    }
  }

  /**
   * Generates a new line.
   *
   * @return a new line string.
   */
  public static String newLine() {
    return "\n";
  }

  /**
   * Generates a space.
   *
   * @return a space string.
   */
  public static String space() {
    return " ";
  }

  /**
   * Generates an indent.
   *
   * @return an indent string.
   */
  public static String indent() {
    return "        ";
  }
}
