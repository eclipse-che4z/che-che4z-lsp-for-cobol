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
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.Locale;
import java.util.jar.JarFile;

import static org.mockito.Mockito.*;

/** Tests @{@link CobolLSPropertiesResourceBundle} */
class CobolLSPropertiesResourceBundleTest {

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
    URI uri = mock(URI.class);
    DialectRegistryItem dialectRegistryItem = new DialectRegistryItem("dummyDialect", uri, "dummy dialect", "dummyDialect");
    CobolLSPropertiesResourceBundle bundle =
        new CobolLSPropertiesResourceBundle(
            "resourceBundles/test", Locale.FRENCH);

    mockConstruction(JarFile.class);
    JarFile jarFileSpy = mock(JarFile.class);
    URL url = mock(URL.class);
    when(uri.toURL()).thenReturn(url);
    when(url.getFile()).thenReturn("file://uri");
    when(jarFileSpy.getJarEntry("resourceBundles/test")).thenReturn(null);

    bundle.updateMessageResourceBundle(dialectRegistryItem);

    Assertions.assertEquals(bundle.handleGetObject("test.test"), "test.test");
    Assertions.assertEquals(bundle.handleGetObject("1"), "French test selected.");
  }
}
