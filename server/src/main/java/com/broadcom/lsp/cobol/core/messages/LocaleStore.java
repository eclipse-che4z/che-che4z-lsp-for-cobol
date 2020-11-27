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

import com.google.gson.JsonPrimitive;

import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;

/**
 * Stores the locale for entire application and is single point of contact for all locale related
 * issues. This class update application locale, notify subscriber in case of locale update and
 * returns currently set locale.
 *
 */
public interface LocaleStore {

  /**
   * Return the application current locale.
   *
   * @return {@link LocaleEnum}
   */
  LocaleEnum getSupportedLocale();

  /**
   * Update the locale for an application.
   *
   * @param locale to be updated.
   */
  void updateLocale(String locale);

  /**
   * Update the locale for an application.
   * @param locale to be updated.
   */
  void updateLocale(LocaleEnum locale);

  /**
   * Update the locale for an application.
   *
   * @param jsonPrimitive to be updated.
   */
  void updateLocale(JsonPrimitive jsonPrimitive);

  /**
   * Notify all the subscriber about an update in Locale.
   *
   * @return {@link Consumer<List<String>>}
   */
  Consumer<List<Object>> notifyLocaleStore();

  /**
   * Return the application current locale.
   *
   * @return {@link Locale }
   */
  Locale getApplicationLocale();

  /**
   * Subscribe to changes in locale.
   *
   * @param consumerFunc to be called upon locale update.
   */
  void subscribeToLocaleChange(Consumer<Locale> consumerFunc);
}
