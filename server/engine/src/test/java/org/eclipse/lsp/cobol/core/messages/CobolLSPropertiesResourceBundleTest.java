/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.Locale;
import java.util.jar.JarFile;

import static org.mockito.Mockito.*;

/** Tests @{@link CobolLSPropertiesResourceBundle} */
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class CobolLSPropertiesResourceBundleTest {
  private URI uri;
  @BeforeAll
  void init() {
    uri = mock(URI.class);
    mockConstruction(JarFile.class);
    JarFile jarFileSpy = mock(JarFile.class);
    URL url = mock(URL.class);
    try {
      when(uri.toURL()).thenReturn(url);
    } catch (MalformedURLException e) {
      throw new RuntimeException(e);
    }
    when(url.getFile()).thenReturn("file://uri");
    when(jarFileSpy.getJarEntry("resourceBundles/test")).thenReturn(null);
  }

  @Test
  void updateMessageResourceBundle() throws IOException {

    CobolLSPropertiesResourceBundle bundle =
        new CobolLSPropertiesResourceBundle(
            "resourceBundles/test", Locale.FRENCH);
    CobolLSPropertiesResourceBundle spyBundle = spy(bundle);

    doReturn(
            org.apache.commons.io.IOUtils.toInputStream(
                "test.test: flip flop", StandardCharsets.UTF_8))
        .when(spyBundle)
        .getDialectResources(any(), any());
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", URI.create("file://uri"), "dummy dialect", "dummyDialect");
    spyBundle.updateMessageResourceBundle(dialectRegistryItem);
    Assertions.assertEquals(spyBundle.handleGetObject("test.test"), "flip flop");
    Assertions.assertEquals(spyBundle.handleGetObject("1"), "French test selected.");
    ImmutableList<String> expectedKeySet = ImmutableList.of("1", "2", "test.test");
    Enumeration<String> keys = spyBundle.getKeys();
    int count = 0;
    while (keys.hasMoreElements()) {
      count++;
      Assertions.assertTrue(expectedKeySet.contains(keys.nextElement()));
    }
    Assertions.assertEquals(expectedKeySet.size(), count);
  }

  @Test
  void updateMessageResourceBundleWhenResourcesNotFound() throws IOException {
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", uri, "dummy dialect", "dummyDialect");
    CobolLSPropertiesResourceBundle bundle =
        new CobolLSPropertiesResourceBundle(
            "resourceBundles/test", Locale.FRENCH);
    bundle.updateMessageResourceBundle(dialectRegistryItem);

    Assertions.assertEquals(bundle.handleGetObject("test.test"), "test.test");
    Assertions.assertEquals(bundle.handleGetObject("1"), "French test selected.");
  }

  @Test
  void updateMessageResourceBundleNoLocale() throws IOException {
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", uri, "dummy dialect", "dummyDialect");
    CobolLSPropertiesResourceBundle bundle =
            new CobolLSPropertiesResourceBundle(
                    "resourceBundles/test", new Locale(""));
    bundle.updateMessageResourceBundle(dialectRegistryItem);

    Assertions.assertEquals(bundle.handleGetObject("test.test"), "test.test");
    Assertions.assertEquals(bundle.handleGetObject("1"), "This is a test.");
  }

  @Test
  void updateMessageResourceBundleLocaleWithScript() throws IOException {
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", uri, "dummy dialect", "dummyDialect");
    Locale locale = new Locale.Builder().setLanguage("fr").setRegion("FR").setScript("Latn").build();
    CobolLSPropertiesResourceBundle bundle =
            new CobolLSPropertiesResourceBundle(
                    "resourceBundles/test", locale);
    bundle.updateMessageResourceBundle(dialectRegistryItem);

    Assertions.assertEquals(bundle.handleGetObject("test.test"), "test.test");
    Assertions.assertEquals(bundle.handleGetObject("1"), "French test selected.");
  }
  @Test
  void updateMessageResourceBundleLocaleWithVariant() throws IOException {
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", uri, "dummy dialect", "dummyDialect");
    Locale locale = new Locale.Builder().setLanguage("fr").setRegion("FR").setVariant("variant").build();
    CobolLSPropertiesResourceBundle bundle =
            new CobolLSPropertiesResourceBundle(
                    "resourceBundles/test", locale);
    bundle.updateMessageResourceBundle(dialectRegistryItem);

    Assertions.assertEquals(bundle.handleGetObject("test.test"), "test.test");
    Assertions.assertEquals(bundle.handleGetObject("1"), "French test selected.");
  }

  @Test
  void updateMessageResourceBundleLocaleWithScriptVariant() throws IOException {
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", uri, "dummy dialect", "dummyDialect");
    Locale locale = new Locale.Builder().setLanguage("fr").setRegion("FR").setScript("Latn").setVariant("variant").build();
    CobolLSPropertiesResourceBundle bundle =
            new CobolLSPropertiesResourceBundle(
                    "resourceBundles/test", locale);
    bundle.updateMessageResourceBundle(dialectRegistryItem);

    Assertions.assertEquals(bundle.handleGetObject("test.test"), "test.test");
    Assertions.assertEquals(bundle.handleGetObject("1"), "French test selected.");
  }
}
