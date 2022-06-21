/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.experimental.UtilityClass;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Scans for already defined variables
 */
@UtilityClass
class DefinedVariablesScanner {
  private final Pattern workingStoragePattern = Pattern.compile("\\s*working-storage\\s+section[\\w\\s]*\\.", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern procedureDivisionPattern = Pattern.compile("\\s*procedure\\s+division[\\w\\s]*", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern variableDefinitionPattern = Pattern.compile("^\\s*\\d*\\s*(?!\\*)(?<name>([a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]..)-([BX])([a-zA-Z].))", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);

  /**
   * Scans source code for variable definitions with defined names
   * @param input source code
   * @return a list of variable name info
   */
  public Set<String> scan(String input) {
    String[] lines = input.split("\n");
    Set<String> result = new HashSet<>();

    boolean scanStarted = false;
    for (String line : lines) {
      if (!scanStarted) {
        scanStarted = workingStoragePattern.matcher(line).find();
      } else {
        if (line.length() > 6) {
          Matcher matcher = variableDefinitionPattern.matcher(line.substring(6));
          if (matcher.find()) {
            result.add(matcher.group("name"));
          }
        }
        if (procedureDivisionPattern.matcher(line).find()) break;
      }
    }
    return result;
  }
}
