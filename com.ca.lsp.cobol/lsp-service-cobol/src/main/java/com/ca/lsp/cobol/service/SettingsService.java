/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Provide API definition to fetch configuration settings from the client.
 * Works via LSP workspace/configuration request.
 */
public interface SettingsService {
  /**
   * Fetch the required configuration section from the client.
   * Note that Scope URI is null.
   * The {@link com.ca.lsp.cobol.service.utils.SettingsParametersEnum#LSP_PREFIX LSP prefix} will
   * be added to specified section.
   * @param section the required section.
   * @return a list of one configuration object.
   */
  CompletableFuture<List<Object>> getConfiguration(String... section);
}
