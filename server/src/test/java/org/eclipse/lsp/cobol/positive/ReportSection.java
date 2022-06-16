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
package org.eclipse.lsp.cobol.positive;

import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.positive.SysprintSnapProcessService.getPatternForCuttingReport;

/** Enum representing different sections in a SYSPRINT file. */
public enum ReportSection {
  DATA_NAMES {
    @Override
    Function<String, String> extractReport() {
      return this.extractReportBasedOnCuttingPattern(
          getPatternForCuttingReport(
              "Defined   Cross-reference of data names   References",
              "Defined   Cross-reference of procedures   References"));
    }
  },
  PROCEDURES {
    @Override
    Function<String, String> extractReport() {
      return this.extractReportBasedOnCuttingPattern(
          getPatternForCuttingReport(
              "Defined   Cross-reference of procedures   References",
              "Defined   Cross-reference of programs     References"));
    }
  },
  PROGRAMS {
    @Override
    Function<String, String> extractReport() {
      return this.extractReportBasedOnCuttingPattern(
          getPatternForCuttingReport(
              "Defined   Cross-reference of programs     References",
              "LineID  Message code  Message text|End of compilation"));
    }
  };

  abstract Function<String, String> extractReport();

  Function<String, String> extractReportBasedOnCuttingPattern(Pattern pattern) {
    return (sysprint) -> {
      StringBuilder builder = new StringBuilder();
      Matcher m = pattern.matcher(sysprint);
      while (m.find()) {
        builder.append(m.group());
      }
      return builder.toString();
    };
  }
}
