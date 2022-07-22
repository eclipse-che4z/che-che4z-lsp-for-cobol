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
package org.eclipse.lsp.cobol;

import com.google.inject.Guice;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.positive.CobolTextRegistry;
import org.eclipse.lsp.cobol.positive.FolderTextRegistry;
import org.eclipse.lsp.cobol.service.ClientServerIntegrationTest;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.TestInstance;

import java.util.concurrent.Executors;

import static java.lang.System.getProperty;
import static java.util.Optional.ofNullable;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Provide following configuration for test classes:
 *
 * <p>1. guice DI mechanism for test classes. For usage refer {@link ClientServerIntegrationTest}
 *
 * <p>2. Text registry for actual cobol files for test classes. For usage refer {@link
 * org.eclipse.lsp.cobol.positive.PositiveTest}
 *
 * <p>3. CustomThreadPoolExecutor for test classes.
 */
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public abstract class ConfigurableTest {
  protected static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";
  private CustomThreadPoolExecutor customExecutor;

  /**
   * Retrieve {@link CobolTextRegistry} using file-based implementation.
   *
   * @return {@link CobolTextRegistry}.
   */
  public static CobolTextRegistry retrieveTextsRegistry() {
    return new FolderTextRegistry(
        ofNullable(getProperty(PATH_TO_TEST_RESOURCES))
            .orElse("../../Cobol85PositiveTestsSuite"));
  }

  @BeforeAll
  void init() {
    Guice.createInjector(new TestModule(), new EngineModule(), new DatabusModule())
        .injectMembers(this);
    customExecutor = mock(CustomThreadPoolExecutor.class);
    when(customExecutor.getThreadPoolExecutor()).thenReturn(Executors.newFixedThreadPool(3));
    when(customExecutor.getScheduledThreadPoolExecutor())
        .thenReturn(Executors.newScheduledThreadPool(3));
  }

  protected CustomThreadPoolExecutor getCustomExecutor() {
    return customExecutor;
  }
}
