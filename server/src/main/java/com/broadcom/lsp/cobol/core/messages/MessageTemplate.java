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

import lombok.Value;

/** This class defined the template of an externalized message file. */
@Value
public class MessageTemplate {
  String key;
  String message;

  /**
   * Tells is a {@link MessageTemplate} has a valid key.
   *
   * @return boolean
   */
  public boolean isValidKey() {
    return !key.equals(MessageService.INVALID_KEY);
  }
}
