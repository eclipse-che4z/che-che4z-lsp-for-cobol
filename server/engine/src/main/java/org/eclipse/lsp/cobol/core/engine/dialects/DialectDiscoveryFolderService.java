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
      return loadDialectFromWorkingFolder(workdir, copybookService, messageService);
    } catch (Exception e) {
      warningCannotLoadDialects(e.getMessage());
    }
    return ImmutableList.of();
  }

  /**
   * Load cobol dialects from the given path
   * @param uri is a URI to the dialect's jar file
   * @param copybookService a copybook service
   * @param messageService a message service
   * @return a list of loaded dialects
   */
  @Override
  public List<CobolDialect> loadDialects(URI uri, CopybookService copybookService, MessageService messageService) {
    try {
      return createDialectsFromJar(uri, copybookService, messageService);
    } catch (Exception e) {
      warningCannotLoadDialects(e.getMessage());
    }
    return ImmutableList.of();
  }

  private List<CobolDialect> loadDialectFromWorkingFolder(URI workdir, CopybookService copybookService, MessageService messageService) {
    try {
      return workingFolderService.getFilenames(workdir).stream()
          .filter(filename -> filename.startsWith("dialect-"))
          .filter(filename -> filename.endsWith(".jar"))
          .flatMap(filename -> createDialects(workdir, filename, copybookService, messageService).stream())
          .collect(Collectors.toList());
    } catch (Exception e) {
      warningCannotLoadDialects(e.getMessage());
    }
    return ImmutableList.of();
  }

  private void warningCannotLoadDialects(String message) {
    LOG.warn("Cannot load dialects: {}", message);
  }

  private List<CobolDialect> createDialects(URI currentUri, String filename, CopybookService copybookService, MessageService messageService) {
    URI uri;
    try {
      uri = new URI(currentUri + filename);
    } catch (URISyntaxException e) {
      LOG.warn("Cannot create dialect {}: {}", currentUri + filename, e.getMessage());
      return ImmutableList.of();
    }
    return createDialectsFromJar(uri, copybookService, messageService);
  }

  private List<CobolDialect> createDialectsFromJar(URI jarUri, CopybookService copybookService, MessageService messageService) {
    List<CobolDialect> dialects = new LinkedList<>();
    try {
      URLClassLoader classLoader = createClassLoader(jarUri);
      classLoaderHolder.add(classLoader);

      List<String> classnames = getClassNames(jarUri.getPath()).stream()
          .filter(c -> !c.equals(CobolDialect.class.getName()))
          .filter(c -> c.endsWith("Dialect"))
          .collect(Collectors.toList());

      if (classnames.isEmpty()) {
        throw new Exception("Cannot find dialect class in the jar file " + jarUri);
      }

      for (String classname : classnames) {
        Class<CobolDialect> clazz = (Class<CobolDialect>) Class.forName(classname, true, classLoader);
        Constructor<CobolDialect> constructor = clazz.getConstructor(CopybookService.class, MessageService.class);
        dialects.add(constructor.newInstance(copybookService, messageService));
      }
    } catch (Exception e) {
      LOG.warn("Cannot create dialect {}: {}", jarUri, e.getMessage());
    }
    return dialects;
  }

  private URLClassLoader createClassLoader(URI uriToJar) throws MalformedURLException {
    return new URLClassLoader(
        new URL[] {
            uriToJar.toURL()
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
