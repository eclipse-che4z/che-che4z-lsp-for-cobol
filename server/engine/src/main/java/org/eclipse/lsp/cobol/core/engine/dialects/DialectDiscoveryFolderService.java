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
package org.eclipse.lsp.cobol.core.engine.dialects;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.net.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;



/**
 * Discover cobol jar files with dialects
 */
@Slf4j
@Singleton
public class DialectDiscoveryFolderService implements DialectDiscoveryService {

  private final WorkingFolderService workingFolderService;
  private final List<URLClassLoader> classLoaderHolder = new LinkedList<>();

  @Inject
  public DialectDiscoveryFolderService(WorkingFolderService workingFolderService) {
    this.workingFolderService = workingFolderService;
  }

  /**
   * Load cobol dialects
   * @param copybookService a copybook service
   * @param messageService a message service
   * @return a list of loaded dialects
   */
  public List<CobolDialect> loadDialects(CopybookService copybookService, MessageService messageService) {
    try {
      URI workdir = workingFolderService.getWorkingFolder();
      return workingFolderService.getFilenames(workdir).stream()
          .filter(filename -> filename.startsWith("dialect-"))
          .filter(filename -> filename.endsWith(".jar"))
          .map(filename -> createDialect(workdir, filename, copybookService, messageService))
          .filter(Objects::nonNull)
          .collect(Collectors.toList());
    } catch (Exception e) {
      LOG.warn("Cannot load dialects: {}", e.getMessage());
    }
    return ImmutableList.of();
  }

  private CobolDialect createDialect(URI currentUri, String filename, CopybookService copybookService, MessageService messageService) {
    try {
      URLClassLoader classLoader = createClassLoader(currentUri + filename);
      classLoaderHolder.add(classLoader);

      String classname = getClassNames(currentUri.getPath() + filename).stream()
          .filter(c -> !c.equals(CobolDialect.class.getName()))
          .filter(c -> c.endsWith("Dialect"))
          .findFirst()
          .orElseThrow(() -> new Exception("Cannot find dialect class in the jar file " + filename));

      Class<CobolDialect> clazz = (Class<CobolDialect>) Class.forName(classname, true, classLoader);
      Constructor<CobolDialect> constructor = clazz.getConstructor(CopybookService.class, MessageService.class);
      return constructor.newInstance(copybookService, messageService);
    } catch (Exception e) {
      LOG.warn("Cannot create dialect: {}", e.getMessage());
    }
    return null;
  }

  private URLClassLoader createClassLoader(String pathToJar) throws URISyntaxException, MalformedURLException {
    return new URLClassLoader(
        new URL[] {
            new URI(pathToJar).toURL()
        },
        this.getClass().getClassLoader()
    );
  }

  private List<String> getClassNames(String filename) throws IOException {
    List<String> classNames = new ArrayList<>();
    try (ZipInputStream zip = new ZipInputStream(new FileInputStream(filename))) {
      for (ZipEntry entry = zip.getNextEntry(); entry != null; entry = zip.getNextEntry()) {
        if (!entry.isDirectory() && entry.getName().endsWith(".class")) {
          String className = entry.getName().replace('/', '.');
          classNames.add(className.substring(0, className.length() - ".class".length()));
        }
      }
    }
    return classNames;
  }
}
