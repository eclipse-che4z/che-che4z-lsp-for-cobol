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

import com.google.inject.Inject;
import com.google.inject.name.Named;
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

  private final ResourceBundle.Control resourceBundleControl = new JSONResourceBundleControl();
  private ResourceBundle customResourceBundle;
  private String filename;
  private LocaleStore localeStore;

  @Inject
  public JsonMessageServiceImpl(
      @Named("logFileLocation") String filename, LocaleStore localeStore) {
    this.localeStore = localeStore;
    this.filename = filename;
    loadMessages(filename);
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
    customResourceBundle = ResourceBundle.getBundle(filename, locale, resourceBundleControl);
    localeStore.subscribeToLocaleChange(this::reloadResourceBundle);
  }

  private void reloadResourceBundle(Locale locale) {
    ResourceBundle.clearCache();
    customResourceBundle = ResourceBundle.getBundle(this.filename, locale, resourceBundleControl);
  }

  /**
   * This method loads an externalized message file.
   *
   * @param fileName path to the externalized message file.
   */
  private void loadMessages(String fileName) {
    loadMessages(fileName, localeStore.getApplicationLocale());
  }
}
