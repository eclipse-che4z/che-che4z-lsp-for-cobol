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
package com.broadcom.lsp.cobol.positive;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

/** Registry for Cobol source code files. */
@Slf4j
public class FolderTextRegistry implements CobolTextRegistry {
  private static final String POSITIVE_ENTRY = "positive";
  private static final String NEGATIVE_ENTRY = "negative";
  private static final String COPYBOOK_ENTRY = "copybooks";

  private final ListMultimap<String, CobolText> texts = ArrayListMultimap.create();

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
    Files.walk(Paths.get(folderPath)).filter(Files::isRegularFile).forEach(this::processFile);
  }

  private void processFile(Path path) {
    String name = path.getFileName().toString();
    String folder =
        Optional.ofNullable(path.getParent()).map(Path::getFileName).map(Path::toString).orElse("");

    if (!isSupportedFolder(folder)) {
      return;
    }

    try {
      CobolText loadCobolText = new CobolText(cleanup(name), FileUtils.readFileToString(path.toFile(), StandardCharsets.UTF_8));
      texts.put(folder, loadCobolText);
    } catch (IOException e) {
      LOG.warn("Unable to load file: {}, skipped", path);
    }
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
