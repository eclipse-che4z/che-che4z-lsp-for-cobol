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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.positive;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.*;
import java.util.Collections;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/** Registry for Cobol source code files. */
@Singleton
public class ZipTextRegistry implements CobolTextRegistry {

  private static final String POSITIVE_ENTRY = "positive";
  private static final String NEGATIVE_ENTRY = "negative";
  private static final String COPYBOOK_ENTRY = "copybooks";
  // non-static to allow logging at the initialization stage
  private final Logger log = LoggerFactory.getLogger(ZipTextRegistry.class);

  private ListMultimap<String, CobolText> texts = ArrayListMultimap.create();

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

  @Inject
  public ZipTextRegistry(@Named("filesToTestPath") String pathToTestResources) {
    if (StringUtils.isNotEmpty(pathToTestResources)) {
      try (InputStream zipFile = new FileInputStream(pathToTestResources)) {
        collectFilesToTest(zipFile);
      } catch (IOException e) {
        log.error(e.getMessage());
      }
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
    if (entryName.length < 2) {
      return;
    }
    CobolText loadCobolText = createCobolText(entryName[1], zis);
    texts.put(entryName[0], loadCobolText);
  }

  private CobolText createCobolText(String name, ZipInputStream stream) {
    String fullText = null;
    try {
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stream));
      StringBuilder builder = new StringBuilder();

      for (String line = bufferedReader.readLine();
          line != null;
          line = bufferedReader.readLine()) {
        builder.append(line).append("\r\n");
      }
      fullText = builder.toString();
    } catch (IOException e) {
      log.error(e.getMessage());
    }
    return new CobolText(name, fullText);
  }
}
