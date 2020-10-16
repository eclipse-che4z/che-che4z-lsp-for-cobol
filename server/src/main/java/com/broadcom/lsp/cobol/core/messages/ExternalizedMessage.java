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

import lombok.AllArgsConstructor;
import lombok.Builder;

import java.util.IllegalFormatConversionException;
import java.util.MissingFormatArgumentException;

@AllArgsConstructor
@Builder
public class ExternalizedMessage {
  private final MessageTemplate messageTemplate;
  private final Object[] parameters;
  private final String key;

  /***
   *
   * @return a formatted text for a {@link ExternalizedMessage} object.
   * @throws MissingFormatArgumentException   when the amount of parameters is less than required.
   * @throws IllegalFormatConversionException when format is invalid.
   */
  public String getFormattedMessage() {
    return String.format(messageTemplate.getMessage(), parameters);
  }
}
