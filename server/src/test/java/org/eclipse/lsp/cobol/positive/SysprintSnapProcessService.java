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

import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * Service class exposing functions related to extracting the @{@link SysprintSnap} from a SYSPRINT files.
 */
@Getter
public class SysprintSnapProcessService {
  private final String sysprint;
  private final Map<String, String> renamedReferences;
  private static final String CROSS_REFERENCE_REPORT_START =
      "Defined   Cross-reference of data names   References";
  private static final String CROSS_REFERENCE_REPORT_END = "LineID  Message code  Message text";

  private static Pattern getPatternForCuttingReport(String start, String end) {
    return Pattern.compile(String.format("(%s).*?(%s)", start, end), Pattern.DOTALL);
  }

  public static final Pattern RENAMED_WHILE_COMPILING =
      Pattern.compile("Name \"(.*?)\" was processed as \"(.*?)\"");

  public static final Pattern VARIABLES_REFERENCES_PATTERN =
      Pattern.compile(
          "\\s+(\\d+|EXTERNAL)(\\s+\\S+)(\\s?(\\.\\s)+( [A-Z]?\\d+)+(\\r?\\n\\s{43}( [A-Z]?\\d+)+)*|$)",
          Pattern.MULTILINE);

  public SysprintSnapProcessService(String sysprint) {
    this.sysprint = sysprint;
    this.renamedReferences = fetchRenamedReferences(sysprint);
  }

  private Map<String, String> fetchRenamedReferences(String sysprint) {
    Map<String, String> result = new HashMap<>();
    Matcher m = RENAMED_WHILE_COMPILING.matcher(sysprint);
    while (m.find()) {
      result.put(m.group(2), m.group(1));
    }
    return result;
  }

  private String getMemoryReferencesReport() {
    Pattern crossReferenceReportPattern = getPatternForCuttingReport(CROSS_REFERENCE_REPORT_START, CROSS_REFERENCE_REPORT_END);
    String result = extractReportBasedOnCuttingPattern(crossReferenceReportPattern);
    result =
        Pattern.compile(
                "^(.*?)IBM Enterprise COBOL for z\\SOS\\s+(.*?)Page\\s+\\d+\\r?\\n\\d Defined\\s+Cross-reference of(.*?)References\\r?\\n\\r?\\n\\d",
                Pattern.MULTILINE)
            .matcher(result)
            .replaceAll(" ");
    return Pattern.compile(
            "^(.*?)IBM Enterprise COBOL for z\\SOS\\s+(.*?)Page\\s+\\d+\\r?\\n\\d",
            Pattern.MULTILINE)
        .matcher(result)
        .replaceAll(" ");
  }

  private String extractReportBasedOnCuttingPattern(Pattern pattern) {
    StringBuilder builder = new StringBuilder();
    Matcher m = pattern.matcher(sysprint);
    while (m.find()) {
      builder.append(m.group());
    }
    return builder.toString();
  }

  /**
   * @return a mapping between report section and List of @{@link SysprintSnap} parsed from a SYSPRINT file.
   */
  public Map<ReportSection, List<SysprintSnap>> getVariableReferenceReport() {
    String memoryReferencesReport = getMemoryReferencesReport();
    Map<ReportSection, String> reportMap =
        Arrays.stream(ReportSection.values())
            .map(
                ele ->
                    Collections.singletonMap(
                        ele, ele.extractReport().apply(memoryReferencesReport)))
            .flatMap(map -> map.entrySet().stream())
            .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

    return reportMap.entrySet().stream()
        .map(
            entry ->
                Collections.singletonMap(entry.getKey(), generateReportObject(entry.getValue())))
        .flatMap(map -> map.entrySet().stream())
        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
  }

  private List<SysprintSnap> generateReportObject(String memoryReferencesReport) {
    List<Integer> dataReferences = Collections.emptyList();
    List<SysprintSnap> result = new ArrayList<>();
    Matcher matcher = VARIABLES_REFERENCES_PATTERN.matcher(memoryReferencesReport);
    while (matcher.find()) {
      if (matcher.group(1).trim().equals("EXTERNAL")) continue;
      int dataInitLineNumber = Integer.parseInt(matcher.group(1));
      String dataName = StringUtils.trim(matcher.group(2));
      dataName = cleanUpDataName(dataName);
      dataName = this.renamedReferences.getOrDefault(dataName, dataName);
      if (!matcher.hitEnd()) {
        dataReferences =
            Arrays.stream(StringUtils.trim(matcher.group(3)).split(" |" + System.lineSeparator()))
                .filter(ele -> !ele.equals(".") && !StringUtils.isEmpty((ele)))
                .map(String::trim)
                .map(str -> StringUtils.isNumeric(str) ? str : str.substring(1))
                .map(Integer::parseInt)
                .collect(Collectors.toList());
      }
      result.add(new SysprintSnap(dataName, dataInitLineNumber, dataReferences));
    }
    return result;
  }

  private String cleanUpDataName(String dataName) {
    if (dataName.endsWith(".")) {
      return dataName.substring(0, dataName.length() - 1);
    }
    return dataName;
  }
}
