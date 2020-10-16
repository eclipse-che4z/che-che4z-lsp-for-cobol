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

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

/** This class is an extension of {@link ResourceBundle.Control} to support JSON objects. */
public class JSONResourceBundleControl extends ResourceBundle.Control {

  public static final String DEFAULT_LOCALE = "en";
  private static final String SUPPORTED_RESOURCE_BUNDLE_EXTENSIONS = "json";

  /**
   * Instantiates a resource bundle for the given bundle name of the given format and locale, using
   * the given class loader if necessary. This method returns <code>null</code> if there is no
   * resource bundle available for the given parameters. If a resource bundle can't be instantiated
   * due to an unexpected error, the error must be reported by throwing an <code>Error</code> or
   * <code>Exception</code> rather than simply returning <code>null</code>.
   *
   * <p>If the <code>reload</code> flag is <code>true</code>, it indicates that this method is being
   * called because the previously loaded resource bundle has expired.
   *
   * <p>For more info refer to java docs {@link ResourceBundle.Control#newBundle(String, Locale,
   * String, ClassLoader, boolean)}
   *
   * @param baseName the base bundle name of the resource bundle, a fully qualified class name
   * @param locale the locale for which the resource bundle should be instantiated
   * @param format the resource bundle format to be loaded
   * @param loader the <code>ClassLoader</code> to use to load the bundle
   * @param reload the flag to indicate bundle reloading; <code>true</code> if reloading an expired
   *     resource bundle, <code>false</code> otherwise
   * @return the resource bundle instance, or <code>null</code> if none could be found.
   * @throws NullPointerException if <code>bundleName</code>, <code>locale</code>, <code>format
   *     </code>, or <code>loader</code> is <code>null</code>, or if <code>null</code> is returned
   *     by {@link #toBundleName(String, Locale) toBundleName}
   * @throws IOException if an error occurred when reading resources using any I/O operations
   */
  @Override
  public ResourceBundle newBundle(
      String baseName, Locale locale, String format, ClassLoader loader, boolean reload)
      throws IOException {
    if (baseName == null || locale == null || format == null || loader == null)
      throw new NullPointerException();
    ResourceBundle bundle = null;
    if (format.equals(SUPPORTED_RESOURCE_BUNDLE_EXTENSIONS)) {
      String bundleName = toBundleName(baseName, locale);
      String resourceName = toResourceName(bundleName, format);
      InputStream stream = null;
      if (reload) {
        URL url = loader.getResource(resourceName);
        if (url != null) {
          URLConnection connection = url.openConnection();
          if (connection != null) {
            // Disable caches to get fresh data for
            // reloading.
            connection.setUseCaches(false);
            stream = connection.getInputStream();
          }
        }
      } else {
        stream = loader.getResourceAsStream(resourceName);
      }
      if (stream != null) {
        BufferedInputStream bis = new BufferedInputStream(stream);
        bundle = new JSONResourceBundle(bis);
        bis.close();
      }
    }
    return bundle;
  }

  /**
   * Returns a <code>List</code> of <code>String</code>s containing formats to be used to load
   * resource bundles for the given <code>baseName</code>. The <code>ResourceBundle.getBundle</code>
   * factory method tries to load resource bundles with formats in the order specified by the list.
   * The list returned by this method must have at least one <code>String</code>.
   *
   * <p>It is not a requirement to return an immutable (unmodifiable) <code>List</code>. However,
   * the returned <code>List</code> must not be mutated after it has been returned by <code>
   * getFormats</code>.
   *
   * @param baseName the base name of the resource bundle, a fully qualified class name
   * @return a <code>List</code> of <code>String</code>s containing formats for loading resource
   *     bundles.
   */
  @Override
  public List<String> getFormats(String baseName) {
    return Collections.unmodifiableList(
        Collections.singletonList(SUPPORTED_RESOURCE_BUNDLE_EXTENSIONS));
  }
}
