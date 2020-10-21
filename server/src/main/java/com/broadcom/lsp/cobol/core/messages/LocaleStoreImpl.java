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

import com.broadcom.lsp.cobol.service.delegates.communications.Communications;
import com.google.common.collect.Iterables;
import com.google.gson.JsonPrimitive;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.MessageType;

import javax.inject.Inject;
import javax.inject.Singleton;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.function.Consumer;

/**
 * Concrete implementation for {@link LocaleStore}
 *
 * <p>* Stores the locale for entire application and is single point of contact for all locale
 * related * issues. This class update application locale, notify subscriber in case of locale
 * update and * returns currently set locale.
 */
@Slf4j
@Singleton
public final class LocaleStoreImpl implements LocaleStore {
  private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
  private final Lock readLock = readWriteLock.readLock();
  private final Lock writeLock = readWriteLock.writeLock();
  private final Locale defaultLocale = new Locale("en", "en");
  private Communications communication;
  private LocaleEnum locale;
  private List<Consumer<Locale>> notifyList = new ArrayList<>();

  @Inject
  public LocaleStoreImpl(Communications communications) {
    this.communication = communications;
  }

  /**
   * Return the application current locale.
   *
   * @return {@link LocaleEnum}
   */
  @Override
  public LocaleEnum getLocale() {
    readLock.lock();
    try {
      if (Objects.isNull(locale))
        return Enum.valueOf(LocaleEnum.class, defaultLocale.getCountry().toUpperCase());
      return locale;
    } finally {
      readLock.unlock();
    }
  }

  private void setLocale(LocaleEnum locale) {
    writeLock.lock();
    try {
      this.locale = locale;
    } finally {
      writeLock.unlock();
    }
  }

  /**
   * Update the locale for an application.
   *
   * @param locale to be updated.
   */
  @Override
  public void updateLocale(String locale) {
    try {
      LocaleEnum localeEnum = Enum.valueOf(LocaleEnum.class, locale.toUpperCase());
      setLocale(localeEnum);
      Locale updatedLocale = new Locale(localeEnum.getLabel());
      notifyList.forEach(consumer -> consumer.accept(updatedLocale));
    } catch (IllegalArgumentException e) {
      handleUnSupportedLocale(locale);
    }
  }

  /**
   * Update the locale for an application.
   *
   * @param locale to be updated.
   */
  @Override
  public void updateLocale(LocaleEnum locale) {
    try {
      setLocale(locale);
    } catch (IllegalArgumentException e) {
      handleUnSupportedLocale(locale.getLabel());
    }
  }

  private void handleUnSupportedLocale(String locale) {
    String errMsg = "Supplied " + locale + " locale is not supported yet.";
    LOG.error(errMsg);
    communication.notifyGeneralMessage(MessageType.Error, errMsg);
  }

  /**
   * Update the locale for an application.
   *
   * @param jsonPrimitive {@link JsonPrimitive} to be updated.
   */
  @Override
  public void updateLocale(JsonPrimitive jsonPrimitive) {
    updateLocale(jsonPrimitive.getAsString());
  }

  /**
   * Notify all the subscriber about an update in Locale.
   *
   * @return {@link Consumer<List<String>>}
   */
  @Override
  public Consumer<List<Object>> notifyLocaleStore() {
    return clientLocale -> {
      if (Objects.nonNull(clientLocale)) {
        Object jsonLocaleNode = Iterables.getFirst(clientLocale, "");
        if (jsonLocaleNode instanceof JsonPrimitive) {
          updateLocale((JsonPrimitive) jsonLocaleNode);
        }
      }
    };
  }

  /**
   * Return the application current locale.
   *
   * @return {@link Locale }
   */
  public Locale getApplicationLocale() {
    if (Objects.isNull(locale)) return defaultLocale;
    return new Locale(locale.getLabel(), locale.getLabel());
  }

  /**
   * Subscribe to changes in locale.
   *
   * @param consumerFunc to be called upon locale update.
   */
  public void subscribeToLocaleChange(Consumer<Locale> consumerFunc) {
    notifyList.add(consumerFunc);
  }
}
