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

import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Scans source code for variable definitions with defined name's pattern
 */
@UtilityClass
class TextScanner {
  private final Pattern workingStoragePattern = Pattern.compile("\\s*working-storage\\s+section[\\w\\s]*\\.", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern procedureDivisionPattern = Pattern.compile("\\s*procedure\\s+division[\\w\\s]*\\.", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern variableDefinitionPattern = Pattern.compile("^\\s*\\d*\\s*(?!\\*)(TBF|TBL)(?<name>[a-zA-Z]..)-X(?<suffix>[a-zA-Z].)", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);

  /**
   * Scans source code for variable definitions with defined name's pattern
   * @param input source code
   * @return a list of variable name info
   */
  public List<VariableNameInfo> scan(String input) {
    String[] lines = input.split("\n");
    List<VariableNameInfo> result = new LinkedList<>();

    boolean scanStarted = false;
    for (String line : lines) {
      if (!scanStarted) {
        scanStarted = workingStoragePattern.matcher(line).find();
      } else {
        if (line.length() > 6) {
          Matcher matcher = variableDefinitionPattern.matcher(line.substring(6));
          if (matcher.find()) {
            String name = matcher.group("name");
            String suffix = matcher.group("suffix");
            result.add(new VariableNameInfo(name, suffix));
          }
        }
        if (procedureDivisionPattern.matcher(line).find()) break;
      }
    }
    return result;
  }
}
