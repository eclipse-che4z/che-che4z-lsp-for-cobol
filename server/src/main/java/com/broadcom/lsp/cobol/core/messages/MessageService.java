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
package com.broadcom.lsp.cobol.core.messages;

import java.util.List;
import java.util.Locale;
import java.util.Optional;

/** This class sets the basic contract for any externalized message service to be implemented. */
public interface MessageService {

  String INVALID_KEY = "invalid-key";
  String INVALID_KEY_EXTERNALIZED_MESSAGE =
      "Invalid key '%s' supplied. Please check the externalized message files.";

  /**
   * This method return an {@link ExternalizedMessage} based on passes key and params.
   *
   * @param key Unique ID for each message in externalized message file.
   * @param parameters Arguments referenced by the format specifiers in the format * string in
   *     externalized message file.
   * @return {@link ExternalizedMessage}
   */
  ExternalizedMessage getMessage(String key, Object... parameters);

  /**
   * This method loads an externalized message file.
   *
   * @param filePath path to the externalized message file.
   */
  void loadMessages(String filePath, Optional<Locale> locale);

  /**
   * @param messageTemplateList loads List of {@link MessageTemplate} to an existing {@link
   *     MessageService } object.
   */
  void addMessageTemplates(List<MessageTemplate> messageTemplateList);
}
