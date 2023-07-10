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
package org.eclipse.lsp.cobol.service.settings;

import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Provide API definition to fetch configuration settings from the client. Works via LSP
 * workspace/configuration request.
 */
public interface SettingsService {
  /**
   * Fetch the required configuration section from the client. Note that Scope URI is null. The
   * {@link SettingsParametersEnum#LSP_PREFIX LSP prefix} will be added to specified section.
   *
   * @param section the required section.
   * @return a list of one configuration object.
   */
  CompletableFuture<List<Object>> fetchConfiguration(String... section);

  /**
   * Fetch the required text configuration section from the client. Note that Scope URI is null. The
   * {@link SettingsParametersEnum#LSP_PREFIX LSP prefix} will be added to specified section.
   *
   * @param section the required section.
   * @return a list of string of one configuration object.
   */
  CompletableFuture<List<String>> fetchTextConfiguration(String... section);

  /**
   * Fetch the required text configuration section from the client.
   * @param scopeUri the required section
   * @param section the required section.
   * @return a list of string of one configuration object.
   */
  CompletableFuture<List<String>> fetchTextConfigurationWithScope(String scopeUri, String section);

  /**
   * Fetch the required dialect specific text configuration section from the client.
   * @param scopeUri the required section
   * @param section the required section.
   * @param dialect
   * @return a list of string of one configuration object.
   */
  CompletableFuture<List<String>> fetchTextConfigurationWithScope(String scopeUri, String section, String dialect);

  /**
   * Fetch the required configuration sections from the client. Note that Scope URI is null. The
   * {@link SettingsParametersEnum#LSP_PREFIX LSP prefix} will be added to each specified section.
   *
   * @param sections the required sections.
   * @return a list of configuration objects.
   */
  CompletableFuture<List<Object>> fetchConfigurations(List<String> sections);

  /**
   * Fetch the required configuration sections from the client.The {@link SettingsParametersEnum#LSP_PREFIX LSP prefix}
   * will be added to each specified section.
   *
   * @param documentUri We use document Uri as configuration scope URI.
   * @param sections the required sections.
   * @return a list of configuration objects.
   */
  CompletableFuture<List<Object>> fetchConfigurations(String documentUri, List<String> sections);

}
