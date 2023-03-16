/*
 * Copyright (c) 2023 Broadcom.
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

import org.eclipse.lsp.cobol.common.action.CodeActionProvider;

import java.util.List;

/** Interface to register dialect specific server side execute command capabilities. */
public interface DialectExecuteCommandCapabilityService {

  /**
   * Registers dialect specific server side execute command capabilities.
   *
   * @param capabilities List of String capabilities. Normally seen as code actions.
   * @param id unique id for the registration
   */
  void registerExecuteCommandCapabilities(List<String> capabilities, String id);

  /**
   * Unregisters dialect specific server side execute command capabilities.
   *
   * @param id unique id used for the registration of command
   */
  void unregisterExecuteCommandCapabilities(String id);

  /**
   * Registers custom code action providers from dialects
   * @param providers list of {@link CodeActionProvider}
   */
  void registerDialectCodeActionProviders(List<CodeActionProvider> providers);
}
