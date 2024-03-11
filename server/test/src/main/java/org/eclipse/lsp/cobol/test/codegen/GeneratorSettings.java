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

import org.eclipse.lsp.cobol.test.codegen.statements.DisplayStatement;
import org.eclipse.lsp.cobol.test.codegen.statements.OpenStatementGenerator;
import org.eclipse.lsp.cobol.test.codegen.statements.SnippetGenerator;

import java.util.ArrayList;
import java.util.List;

/**
 * COBOL code generator settings.
 */
public class GeneratorSettings {
  static List<SnippetGenerator> statements = new ArrayList<>();
  static {
    statements.add(new DisplayStatement());
    statements.add(new OpenStatementGenerator());
  }

  boolean enableRandom = true;
  int programs = 1;
  int statementCount = 10_000_00;

  public void setStatementCount(int statementCount) {
    this.statementCount = statementCount;
  }
}
