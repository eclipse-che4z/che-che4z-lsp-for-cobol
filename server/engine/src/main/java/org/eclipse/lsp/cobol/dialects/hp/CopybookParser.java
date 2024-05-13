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
package org.eclipse.lsp.cobol.dialects.hp;

import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.LinkedList;
import java.util.List;

/**
 * HP Copybook parser
 */
class CopybookParser {

  public static List<CopybookDescriptor> parseAndCleanup(ExtendedDocument extendedDocument) {
    List<CopybookDescriptor> result = new LinkedList<>();

    String text = extendedDocument.getCurrentText().toString();
    String[] lines = text.split("\r?\n");
    for (int line = 0; line < lines.length; line++) {
      String content = lines[line].toUpperCase();
      int index = content.indexOf("COPY");
      if (index > 0) {
        Range statementRange = new Range(new Position(line, index), new Position(line, content.length()));
        Range nameRange = findNameRange(content, line, index + "COPY".length());
        String name = "acopylib";
        String variable = "var";
        result.add(new CopybookDescriptor(statementRange, nameRange, name, variable));
      }

      for (int i = 0; i < content.length(); i++) {
        if (content.charAt(i) == '$') {
            extendedDocument.replace(new Range(new Position(line, i), new Position(line, i)), " ");
        }
      }

    }
    return result;
  }

  private static Range findNameRange(String text, int line, int start) {
    int index = start;
    while (text.charAt(index) == ' ') {
      index++;
    }
    start = index;
    while ((index < text.length()) && (text.charAt(index) != ' ')) {
      index++;
    }
    int stop = index;
    return new Range(new Position(line, start), new Position(line, stop));
  }
}
