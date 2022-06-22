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

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

/** Test to check LocaleStoreImpl */
class LocaleStoreImplTest {
  private Communications communications;
  private LocaleStoreImpl localeStore;

  @BeforeEach
  void setUp() {
    communications = mock(Communications.class);
    localeStore = new LocaleStoreImpl(communications);
  }

  @Test
  void WhenNoLocaleSet_thenDefaultToENLocale() {
    assertEquals(LocaleEnum.EN, localeStore.getSupportedLocale());
  }

  @Test
  void whenValidLocaleUpdated_thenExpectUpdatedLocale() {
    localeStore.updateLocale("en");
    assertEquals(LocaleEnum.EN, localeStore.getSupportedLocale());
  }

  @Test
  void whenInValidLocaleUpdated_thenExpectNotifyExceptionCalled() {
    localeStore.updateLocale("in");
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);
    verify(communications).notifyGeneralMessage(any(), captor.capture());
    String errArgPassed = captor.getValue();
    assertEquals("Supplied in locale is not supported yet.", errArgPassed);
  }

  @Test
  void testUpdateLocaleWithLocaleEnumArg() {
    localeStore.updateLocale(LocaleEnum.EN);
    assertEquals(LocaleEnum.EN, localeStore.getSupportedLocale());
  }

  @Test
  void testUpdateLocaleWithJsonPrimitiveArg() {
    localeStore.updateLocale(new JsonPrimitive("en"));
    assertEquals(LocaleEnum.EN, localeStore.getSupportedLocale());
  }

  @Test
  void testNotifyLocaleStore() {
    localeStore.updateLocale("en");
    Consumer<List<Object>> listConsumer = localeStore.notifyLocaleStore();
    List<Object> mockArg = ImmutableList.of(new JsonPrimitive("EN"));
    listConsumer.accept(mockArg);
    assertEquals(LocaleEnum.EN, localeStore.getSupportedLocale());
  }

  @Test
  void testGetApplicationLocale() {
    localeStore.updateLocale("en");
    String actualCountry = localeStore.getApplicationLocale().getCountry();
    String expectedLocaleCountry = new Locale("en", "en").getCountry();
    assertEquals(expectedLocaleCountry, actualCountry);
  }

  @Test
  void testSubscribeToLocaleChange() {
    Assertions.assertDoesNotThrow(() -> localeStore.subscribeToLocaleChange(System.out::println));
    Assertions.assertDoesNotThrow(() -> localeStore.updateLocale("en"));
  }
}
