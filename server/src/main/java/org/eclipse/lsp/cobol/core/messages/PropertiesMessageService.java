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
package org.eclipse.lsp.cobol.core.messages;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;

import java.util.Arrays;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;

/**
 * This class is an properties file implementation of {@link MessageService} . It loads messages
 * from a properties file into memory to be used latter on for logging or messaging.
 */
@Singleton
public class PropertiesMessageService implements MessageService {

  private final String baseName;
  private final LocaleStore localeStore;
  private ResourceBundle resourceBundle;

  @Inject
  public PropertiesMessageService(
      @Named("resourceFileLocation") String baseName, LocaleStore localeStore) {
    this.baseName = baseName;
    this.localeStore = localeStore;
    resourceBundle = ResourceBundle.getBundle(baseName, localeStore.getApplicationLocale());
    subscribeToLocaleStore();
  }

  private void subscribeToLocaleStore() {
    localeStore.subscribeToLocaleChange(this::reloadResourceBundle);
  }

  private void reloadResourceBundle(Locale locale) {
    ResourceBundle.clearCache();
    resourceBundle = ResourceBundle.getBundle(baseName, locale);
  }

  @Override
  public String getMessage(String key, Object... parameters) {
    try {
      return String.format(resourceBundle.getString(key), parameters);
    } catch (MissingResourceException e) {
      return key;
    }
  }

  @Override
  public String localizeTemplate(MessageTemplate template) {
    Object[] parameters = processArgs(template.getArgs());
    return getMessage(
        template.getTemplate(),
        ofNullable(template.getDelimiter())
            .map(
                delimiter ->
                    Arrays.stream(parameters).map(Object::toString).collect(joining(delimiter)))
            .map(it -> new Object[] {it})
            .orElse(parameters));
  }

  private Object[] processArgs(Object[] args) {
    return Stream.of(args)
        .map(arg -> arg instanceof MessageTemplate ? localizeTemplate((MessageTemplate) arg) : arg)
        .toArray();
  }
}
