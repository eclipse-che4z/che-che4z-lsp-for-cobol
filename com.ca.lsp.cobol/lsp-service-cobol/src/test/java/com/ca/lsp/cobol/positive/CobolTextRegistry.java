/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.positive;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.Collections;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Registry for Cobol source code files.
 *
 * @author teman02
 */
public enum CobolTextRegistry {
  INSTANCE;

  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";
  private static final String POSITIVE_ENTRY = "positive";
  private static final String NEGATIVE_ENTRY = "negative";
  // non-static to allow logging at the initialization stage
  private final Logger log = LoggerFactory.getLogger(CobolTextRegistry.class);

  private ListMultimap<String, CobolText> texts = ArrayListMultimap.create();

  /** @return all the Cobol files for positive tests */
  public List<CobolText> getPositives() {
    return Collections.unmodifiableList(texts.get(POSITIVE_ENTRY));
  }

  /** @return all the Cobol files for negative tests */
  public List<CobolText> getNegatives() {
    return Collections.unmodifiableList(texts.get(NEGATIVE_ENTRY));
  }

  CobolTextRegistry() {
    String property = System.getProperty(PATH_TO_TEST_RESOURCES);
    assert (property != null);
    try (InputStream zipFile = new FileInputStream(property)) {
      collectFilesToTest(zipFile);
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  private void collectFilesToTest(InputStream zipFile) {
    try (ZipInputStream zis = new ZipInputStream(zipFile)) {
      ZipEntry entry;
      while ((entry = zis.getNextEntry()) != null) {
        registerCobolText(zis, entry);
      }
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  private void registerCobolText(ZipInputStream zis, ZipEntry entry) {
    String[] entryName = entry.getName().split("/");
    CobolText loadCobolText = createCobolText(entryName[1], zis);
    texts.put(entryName[0], loadCobolText);
  }

  private CobolText createCobolText(String name, ZipInputStream stream) {
    int linesNumber = 0;
    String fullText = null;
    try {
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stream));
      StringBuilder builder = new StringBuilder();

      for (String line = bufferedReader.readLine();
          line != null;
          line = bufferedReader.readLine()) {
        linesNumber++;
        builder.append(line).append("\r\n");
      }
      fullText = builder.toString();
    } catch (IOException e) {
      log.error(e.getMessage());
    }
    return new CobolText(name, fullText, linesNumber);
  }
}
