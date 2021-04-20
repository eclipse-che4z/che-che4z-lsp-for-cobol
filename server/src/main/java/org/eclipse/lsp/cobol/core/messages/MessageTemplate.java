/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.messages;

import lombok.Value;

/**
 * This value class holds a string template that should be localized before being passes as an
 * argument for localized message. If a delimiter provided, it will be used for concatenation of
 * arguments before localizing the message.
 */
@Value
public final class MessageTemplate {
  String template;
  String delimiter;
  Object[] args;

  /**
   * Create a {@link MessageTemplate} that contains a template without arguments.
   *
   * @param template the key for localization
   * @return localized string
   */
  public static MessageTemplate of(String template) {
    return new MessageTemplate(template, null);
  }

  /**
   * Create a {@link MessageTemplate} that contains a template with arguments. The arguments may be
   * also {@link MessageTemplate} and they will be localized recursively.
   *
   * @param template the key for localization
   * @param args arguments to built in the string template after the localization
   * @return localized string
   */
  public static MessageTemplate of(String template, Object... args) {
    return new MessageTemplate(template, null, args);
  }

  /**
   * Create a {@link MessageTemplate} that contains a template with arguments, and the delimiter
   * that will be used for concatenating the arguments into one string. If the delimiter is null,
   * the arguments will not be concatenated.
   *
   * @param template the key for localization
   * @param delimiter string used as a delimiter while concatenating the arguments
   * @param args arguments to built in the string template after the localization
   * @return localized string
   */
  public static MessageTemplate concatenatingArgs(
      String template, String delimiter, Object... args) {
    return new MessageTemplate(template, delimiter, args);
  }

  private MessageTemplate(String template, String delimiter, Object... args) {
    this.template = template;
    this.delimiter = delimiter;
    this.args = args;
  }
}
