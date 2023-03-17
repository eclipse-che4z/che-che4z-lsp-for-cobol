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
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;

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
  private final Communications communications;
  private final List<URLClassLoader> classLoaderHolder = new LinkedList<>();
  private final CodeActions actions;

  @Inject
  public DialectDiscoveryFolderService(WorkingFolderService workingFolderService, Communications communications, CodeActions actions) {
    this.workingFolderService = workingFolderService;
    this.communications = communications;
    this.actions = actions;
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
      return loadDialects(workdir, copybookService, messageService);
    } catch (Exception e) {
      warningCannotLoadDialects(e.getMessage());
    }
    return ImmutableList.of();
  }

  /**
   * Load cobol dialects from the given path
   * @param path is a path to the dialect
   * @param copybookService a copybook service
   * @param messageService a message service
   * @return a list of loaded dialects
   */
  @Override
  public List<CobolDialect> loadDialects(String path, CopybookService copybookService, MessageService messageService) {
    try {
      URI workdir = workingFolderService.getWorkingFolder(path);
      return loadDialects(workdir, copybookService, messageService);
    } catch (Exception e) {
      warningCannotLoadDialects(e.getMessage());
    }
    return ImmutableList.of();
  }

  private List<CobolDialect> loadDialects(URI workdir, CopybookService copybookService, MessageService messageService) {
    try {
      return workingFolderService.getFilenames(workdir).stream()
          .filter(filename -> filename.startsWith("dialect-"))
          .filter(filename -> filename.endsWith(".jar"))
          .map(filename -> createDialect(workdir, filename, copybookService, messageService))
          .filter(Objects::nonNull)
          .collect(Collectors.toList());
    } catch (Exception e) {
      warningCannotLoadDialects(e.getMessage());
    }
    return ImmutableList.of();
  }

  private void warningCannotLoadDialects(String message) {
    LOG.warn("Cannot load dialects: {}", message);
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
      LOG.warn("Cannot create dialect {}: {}", filename, e.getMessage());
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

  /**
   * Registers dialect server side capabilities.
   *
   * @param capabilities List of String capabilities. Normally seen as code actions.
   */
  @Override
  public void registerExecuteCommandCapabilities(List<String> capabilities, String id) {
    communications.registerExecuteCommandCapability(capabilities, id);
  }

  /**
   * Unregisters dialect specific server side execute command capabilities.
   *
   * @param id unique id used for the registration of command
   */
  @Override
  public void unregisterExecuteCommandCapabilities(String id) {
    communications.unregisterExecuteCommandCapability(id);
  }

  @Override
  public void registerDialectCodeActionProviders(List<CodeActionProvider> providers) {
      actions.registerNewProviders(providers);
  }
}
