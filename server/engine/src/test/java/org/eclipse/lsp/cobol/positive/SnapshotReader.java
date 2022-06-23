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

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * Utility class for reading listing snapshot.
 */
@UtilityClass
@Slf4j
public class SnapshotReader {
  private static final Pattern EXTRACT_DIFF_SECTION_OF_A_SNAPSHOT =
      Pattern.compile("DATA_NAMES((?s:.*?))PROCEDURES((?s:.*?))PROGRAMS((?s:.*))");
  private static final Pattern STRING_TO_SYSPRINTSNAP =
      Pattern.compile(
          "(\\d+(:\\d+-\\d+:\\d+)?)\\t(.*?)\\t((\\d+(:\\d+-\\d+:\\d+)?)(,\\d+(:\\d+-\\d+:\\d+)?)*)?");
  private static final Pattern PARSE_RANGE =
      Pattern.compile("(\\d+(:\\d+)?)(-(\\d+(:\\d+)?))?", Pattern.MULTILINE);
  public static final String POSITION_SPLITTER = ":";

  /**
   * Read all the listing snapshot present in a folder location.
   * @param snapShotLocation folder location of compiler listing snapshots
   * @return filename mapped to {@link SysprintSnap} object segregated by {@link ReportSection}
   * @throws IOException
   */
  public static Map<String, TreeMap<ReportSection, List<SysprintSnap>>> read(String snapShotLocation)
      throws IOException {
    Map<String, TreeMap<ReportSection, List<SysprintSnap>>> result = new HashMap<>();
    Files.walk(Paths.get(snapShotLocation))
        .filter(Files::isRegularFile)
        .parallel()
        .forEach(
            path -> {
              try {
                result.put(
                    path.getFileName().toString(),
                    parseRecord(FileUtils.readFileToString(path.toFile(), StandardCharsets.UTF_8)));
              } catch (IOException e) {
               LOG.error("Error while reading snapshots");
              }
            });
    return result;
  }

  private static TreeMap<ReportSection, List<SysprintSnap>> parseRecord(String group) {
    Matcher matcher = EXTRACT_DIFF_SECTION_OF_A_SNAPSHOT.matcher(group);
    Map<ReportSection, List<SysprintSnap>> result = new HashMap<>();
    while (matcher.find()) {
      String procedureSnapshot = matcher.group(2);
      String datanameSnapshot = matcher.group(1);
      String programSnapshot = matcher.group(3);
      result.put(ReportSection.DATA_NAMES, transformSnapToSysprintSnap(datanameSnapshot));
      result.put(ReportSection.PROGRAMS, transformSnapToSysprintSnap(programSnapshot));
      result.put(ReportSection.PROCEDURES, transformSnapToSysprintSnap(procedureSnapshot));
    }
    return new TreeMap<>(result);
  }

  private static List<SysprintSnap> transformSnapToSysprintSnap(String procedureSnapshot) {
    Matcher matcher = STRING_TO_SYSPRINTSNAP.matcher(procedureSnapshot);
    List<SysprintSnap> snapshots = new ArrayList<>();
    while (matcher.find()) {
      String definedLineNumber = matcher.group(1);
      int extractedDefinedLineNumber =
          Integer.parseInt(definedLineNumber.split(POSITION_SPLITTER)[0]);
      List<Range> referenceRange = Collections.emptyList();
      Range definedRange = null;
      List<Integer> extractedReferences = new ArrayList<>();
      if (matcher.group(2) != null) {
        definedRange = parseRange(definedLineNumber).get(0);
      }

      String objectName = matcher.group(3);
      if (matcher.groupCount() > 3) {
        String references = matcher.group(4);
        if (matcher.group(6) != null) {
          referenceRange = parseRange(references);
        } else {
          extractedReferences =
              references != null
                  ? Arrays.stream(references.split(","))
                      .map(Integer::parseInt)
                      .collect(Collectors.toList())
                  : Collections.emptyList();
        }
      }
      SysprintSnap snapshotObject =
          new SysprintSnap(objectName, extractedDefinedLineNumber, extractedReferences);
      snapshotObject.setDefinitionLocation(definedRange);
      snapshotObject.setReferencesLocation(referenceRange);
      snapshots.add(snapshotObject);
    }
    return snapshots;
  }

  private static List<Range> parseRange(String definedLineNumber) {
    List<Range> result = new ArrayList<>();
    String endPosition;
    Matcher matcher = PARSE_RANGE.matcher(definedLineNumber);
    while (matcher.find()) {
      String startPosition = matcher.group(1);
      if (matcher.groupCount() > 1) {
        endPosition = matcher.group(4);
        assert endPosition != null;
        Range range =
            new Range(
                new Position(
                    Integer.parseInt(startPosition.split(POSITION_SPLITTER)[0]),
                    Integer.parseInt(startPosition.split(POSITION_SPLITTER)[1])),
                new Position(
                    Integer.parseInt(endPosition.split(POSITION_SPLITTER)[0]),
                    Integer.parseInt(endPosition.split(POSITION_SPLITTER)[1])));
        result.add(range);
      }
    }
    return result;
  }
}
