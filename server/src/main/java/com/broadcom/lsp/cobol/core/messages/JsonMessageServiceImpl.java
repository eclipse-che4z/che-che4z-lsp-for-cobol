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

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/***
 * This class is a JSON implementation of {@link MessageService} . It loads the JSON messages into memory to be used latter on for logging.
 */
@Slf4j
public class JsonMessageServiceImpl implements MessageService {

  public static final Locale DEFAULT_LOCALE =
      new Locale(
          JSONResourceBundleControl.DEFAULT_LOCALE, JSONResourceBundleControl.DEFAULT_LOCALE);
  private ResourceBundle customResourceBundle;

  public JsonMessageServiceImpl(String fileName, Locale locale) {
    loadMessages(fileName, locale);
  }

  public JsonMessageServiceImpl(String fileName) {
    loadMessages(fileName);
  }

  /***
   *  This method return an {@link ExternalizedMessage} object passed on passed params from an message file.
   * @param key Key corresponds to the uniqueness of a messageTemplate.
   *            It's like an ID for the message. Every key must be unique.
   * @param parameters are the different arguments to be substituted in the message,
   *            in the passed order.
   * @return {@link ExternalizedMessage}
   */
  @Override
  public String getMessage(@NonNull String key, @NonNull Object... parameters) {
    if (!customResourceBundle.containsKey(key))
      throw new KeyNotFoundException("Provided key " + key + " not found in the template.");
    return ExternalizedMessage.builder()
        .messageTemplate(
            new MessageTemplate(
                key, ((MessageTemplate) customResourceBundle.getObject(key)).getMessage()))
        .parameters(parameters)
        .build()
        .getFormattedMessage();
  }

  /***
   * This methods verify and loads all messages from a provided message file.
   * @param filename is the path from where we want to load messageTemplate files.
   * @Throws {@link MissingResourceException}
   */
  private void loadMessages(String filename, Locale locale) {
    ResourceBundle.Control control = new JSONResourceBundleControl();
    customResourceBundle = ResourceBundle.getBundle(filename, locale, control);
  }

  /**
   * This method loads an externalized message file.
   *
   * @param fileName path to the externalized message file.
   */
  private void loadMessages(String fileName) {
    loadMessages(fileName, DEFAULT_LOCALE);
  }
}
