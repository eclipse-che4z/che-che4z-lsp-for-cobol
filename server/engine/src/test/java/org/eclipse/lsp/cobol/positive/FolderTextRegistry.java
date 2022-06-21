/*
 * Copyright (c) 2020 Broadcom.
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

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import lombok.Getter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

import static java.lang.System.getProperty;
import static java.util.Optional.ofNullable;

/** Registry for Cobol source code files. */
@Slf4j
public class FolderTextRegistry implements CobolTextRegistry {
  private static final String POSITIVE_ENTRY = "positive";
  private static final String NEGATIVE_ENTRY = "negative";
  private static final String COPYBOOK_ENTRY = "copybooks";
  private static final String SNAPS_ENTRY = "compileListing";

  private final ListMultimap<String, CobolText> texts = ArrayListMultimap.create();
  @Getter private Map<String, TreeMap<ReportSection, List<SysprintSnap>>> snaps = new HashMap<>();

  @SneakyThrows
  public FolderTextRegistry(String pathToTestResources) {
    if (StringUtils.isNotEmpty(pathToTestResources)) collectFilesToTest(pathToTestResources);
  }

  @Override
  public List<CobolText> getPositives() {
    return Collections.unmodifiableList(texts.get(POSITIVE_ENTRY));
  }

  @Override
  public List<CobolText> getNegatives() {
    return Collections.unmodifiableList(texts.get(NEGATIVE_ENTRY));
  }

  @Override
  public List<CobolText> getCopybooks() {
    return Collections.unmodifiableList(texts.get(COPYBOOK_ENTRY));
  }

  private void collectFilesToTest(String folderPath) throws IOException {
    String updateListingFlag = getUpdateListingFlag();
    Files.walk(Paths.get(folderPath)).filter(Files::isRegularFile).forEach(this::processFile);
    if (!Files.exists(Paths.get(getListingFileLocation())) || !updateListingFlag.equals("false"))
      createListingSnap(snaps);
    else snaps = readFromSnap();
  }

  private String getUpdateListingFlag() {
    return ofNullable(getProperty("UpdateSnapListing")).orElse("false");
  }

  /**
   * Creates a snap of test file names mapped to the compiler listing object.
   *
   * @param snaps Map of test file names mapped to the compiler listing object
   */
  void createListingSnap(Map<String, TreeMap<ReportSection, List<SysprintSnap>>> snaps) {
    StringBuilder sb = new StringBuilder();
    String snapLocation = getListingFileLocation();
    snaps.forEach((key1, value1) -> {
      value1.forEach((key, value) -> {
        sb.append(String.format("%s\n", key));
        sb.append(String.format("%s\n", value.stream().map(SysprintSnap::toString).collect(Collectors.joining(System.lineSeparator()))));
        sb.append(System.lineSeparator());
      });
      try {
        Files.write(Paths.get(snapLocation, key1), sb.toString().getBytes(StandardCharsets.UTF_8));
      } catch (IOException e) {
        LOG.error("error creating snapshot for " + key1, e);
      } finally {
        sb.setLength(0);
      }
    });
  }

  private void processFile(Path path) {
    String name = path.getFileName().toString();
    String folder =
        ofNullable(path.getParent()).map(Path::getFileName).map(Path::toString).orElse("");

    if (!isSupportedFolder(folder)) {
        processSysprintSnaps(path, name, folder);
      return;
    }

    try {
      CobolText loadCobolText =
          new CobolText(
              cleanup(name), FileUtils.readFileToString(path.toFile(), StandardCharsets.UTF_8));
      texts.put(folder, loadCobolText);
    } catch (IOException e) {
      LOG.warn("Unable to load file: {}, skipped", path);
    }
  }

  private void processSysprintSnaps(Path path, String name, String folder) {
    if (folder.equals(SNAPS_ENTRY) && !getUpdateListingFlag().equals("false")) {
      try {
        processSnapFiles(name, FileUtils.readFileToString(path.toFile(), StandardCharsets.UTF_8));
      } catch (IOException e) {
        LOG.warn("Unable to load snap file: {}, skipped", path);
      }
    }
  }

  private void processSnapFiles(String name, String readFileToString) {
    Map<ReportSection, List<SysprintSnap>> variableReferenceReport =
        new SysprintSnapProcessService(readFileToString).getVariableReferenceReport();
    snaps.put(name, new TreeMap<>(variableReferenceReport));
  }

  @SneakyThrows
  private Map<String, TreeMap<ReportSection, List<SysprintSnap>>> readFromSnap() {
    String snapLocation = getListingFileLocation();
    return SnapshotReader.read(snapLocation);
  }

  private String getListingFileLocation() {
    return ofNullable(getProperty(PATH_TO_LISTING_SNAP)).orElse(DEFAULT_LISTING_PATH);
  }


  /**
   * Gives cross-reference object from listing corresponding to a test file.
   * @param filename filename
   * @return cross-reference object
   */
  public TreeMap<ReportSection, List<SysprintSnap>> getSnapForFile(String filename) {
    return snaps.getOrDefault(filename, new TreeMap<>(Collections.emptyMap()));
  }

  private String cleanup(String name) {
    return name.replaceAll("(?i)\\.cpy", "");
  }

  private boolean isSupportedFolder(String folder) {
    return (folder.equals(POSITIVE_ENTRY)
        || folder.equals(NEGATIVE_ENTRY)
        || folder.equals(COPYBOOK_ENTRY));
  }
}
