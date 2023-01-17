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
package org.eclipse.lsp.cobol.common.message;

/** This class sets the basic contract for any externalized message service to be implemented. */
public interface MessageService {

  /**
   * Return a localized {@link String} based on passed key and params.
   *
   * @param key Unique ID for each message in externalized message file.
   * @param parameters Arguments referenced by the format specifiers in the format * string in
   *     externalized message file.
   * @return {@link String}
   */
  String getMessage(String key, Object... parameters);

  /**
   * Localize the template and return it as a string. If the arguments of the template are instances
   * of the {@link MessageTemplate} too, they also will be localized.
   *
   * @param template a {@link MessageTemplate} to localize
   * @return localized string
   */
  String localizeTemplate(MessageTemplate template);

  /** Reload and updates the messages for Cobol and its dialect. */
  void reloadMessages();
}
