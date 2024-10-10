/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.test.engine;

import org.junit.jupiter.api.extension.AfterEachCallback;
import org.junit.jupiter.api.extension.BeforeEachCallback;
import org.junit.jupiter.api.extension.ExtensionContext;
import java.util.Optional;

/**
 * BeforeEachCallback for Use case test
 */
public class ExtensionContextProvider implements BeforeEachCallback, AfterEachCallback {

  private static final ThreadLocal<ExtensionContext> CONTEXT_HOLDER = new ThreadLocal<>();

  @Override
  public void beforeEach(ExtensionContext context) {
    CONTEXT_HOLDER.set(context);
  }

  /**
   * get junit extensionContext
   *
   * @return ExtensionContext
   */
  public static Optional<ExtensionContext> getExtensionContext() {
    return Optional.ofNullable(CONTEXT_HOLDER.get());
  }

  /**
   * clear context
   */
  public static void clearExtensionContext() {
    CONTEXT_HOLDER.remove();
  }

  /**
   *
   * @param context
   */
  @Override
  public void afterEach(ExtensionContext context) {
    ExtensionContextProvider.clearExtensionContext();
  }
}
