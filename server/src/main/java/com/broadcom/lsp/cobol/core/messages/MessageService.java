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

public interface MessageService {

  String INVALID_KEY = "invalid-key";
  String INVALID_KEY_S_SUPPLIED_PLEASE_CHECK_THE_EXTERNALIZED_MESSAGE_FILES =
      "Invalid key '%s' supplied. Please check the externalized message files.";

  ExternalizedMessage getMessage(String key, Object... parameters);

  void loadMessages(String filePath);

  void addMessageTemplates(List<MessageTemplate> messageTemplateList);
}
