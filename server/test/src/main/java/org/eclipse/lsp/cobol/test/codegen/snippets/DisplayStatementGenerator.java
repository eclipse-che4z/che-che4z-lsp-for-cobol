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
package org.eclipse.lsp.cobol.test.codegen.snippets;

import org.eclipse.lsp.cobol.test.codegen.CobolCodeGenerator;
import org.eclipse.lsp.cobol.test.codegen.GeneratorContext;

/**
 * Display statement generator
 */
public class DisplayStatementGenerator implements SnippetGenerator {
  @Override
  public String generate(GeneratorContext ctx) {
    StringBuilder sb = new StringBuilder();
    sb.append("DISPLAY").append(CobolCodeGenerator.space());
    sb.append("iteral-1");
    return sb.toString();
  }
}
