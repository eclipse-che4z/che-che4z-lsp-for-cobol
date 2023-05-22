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

import com.google.common.annotations.VisibleForTesting;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.jar.JarFile;
import java.util.stream.Collectors;

/**
 * This is a multiple properties resource bundle. Resource bundles contain locale-specific objects.
 * When your program needs a locale-specific resource, a String for example, your program can load
 * it from the resource bundle that is appropriate for the current user's locale.
 */
@Slf4j
public class CobolLSPropertiesResourceBundle extends ResourceBundle {
  private final String baseName;
  public static final char BUNDLE_SEPARATOR = '_';
  private final Properties properties;
  private final Locale locale;

  public CobolLSPropertiesResourceBundle(
          String basename, Locale locale) {
    this.baseName = basename;
    this.properties = new Properties();
    this.locale = locale;
    setParent(ResourceBundle.getBundle(basename, locale));
  }

  /**
   * Updates resource bundle for a supplied dialect.
   *
   * @param dialectRegistryItem dialect registry for which resource needs to be updated
   * @throws IOException when resources for a dialect is not found
   */
  public void updateMessageResourceBundle(DialectRegistryItem dialectRegistryItem) throws IOException {
    properties.putAll(load(dialectRegistryItem, locale));
  }

  private Properties load(DialectRegistryItem dialectRegistryItem, Locale locale) throws IOException {
    Properties properties = new Properties();
    List<String> resourceName = toSuspectedBundleNames(locale);
    Collections.reverse(resourceName);
    LOG.debug("URI for dialect jar:" + dialectRegistryItem.getUri());
    InputStream validResources =
        getDialectResources(resourceName, dialectRegistryItem.getUri());
    properties.load(validResources);
    return properties;
  }

  /**
   * Returns an input stream based on the most appropriate resource bundle based on locale for a
   * dialect
   *
   * @param resourceName Ordered list of resources to search based on locale
   * @param jarUri dialect jar URI
   * @return an {@link InputStream} for found resource
   * @throws IOException when no resource is found or jar not found
   */
  @VisibleForTesting
  public InputStream getDialectResources(
      List<String> resourceName, URI jarUri) throws IOException {
    JarFile jar = new JarFile(jarUri.toURL().getFile());
    for (String s : resourceName) {
      if (Objects.nonNull(jar.getJarEntry(s))) {
        return jar.getInputStream(jar.getJarEntry(s));
      } else {
        LOG.debug("Resource Bundle " + s + " not available at " + jarUri);
      }
    }
    return IOUtils.toInputStream("", StandardCharsets.UTF_8);
  }

  private List<String> toSuspectedBundleNames(String baseName, Locale locale) {
    String language = locale.getLanguage();
    String script = locale.getScript();
    String country = locale.getCountry();
    String variant = locale.getVariant();

    if (Objects.equals(language, "")
        && Objects.equals(country, "")
        && Objects.equals(variant, "")) {
      return Collections.singletonList(baseName);
    }

    StringBuilder sb = new StringBuilder(baseName);
    sb.append(BUNDLE_SEPARATOR);
    if (!Objects.equals(script, "")) {
      if (!Objects.equals(variant, "")) {
        sb.append(language)
            .append(BUNDLE_SEPARATOR)
            .append(script)
            .append(BUNDLE_SEPARATOR)
            .append(country)
            .append(BUNDLE_SEPARATOR)
            .append(variant);
      } else if (!Objects.equals(country, "")) {
        sb.append(language)
            .append(BUNDLE_SEPARATOR)
            .append(script)
            .append(BUNDLE_SEPARATOR)
            .append(country);
      } else {
        sb.append(language).append(BUNDLE_SEPARATOR).append(script);
      }
    } else {
      if (!Objects.equals(variant, "")) {
        sb.append(language)
            .append(BUNDLE_SEPARATOR)
            .append(country)
            .append(BUNDLE_SEPARATOR)
            .append(variant);
      } else if (!Objects.equals(country, "")) {
        sb.append(language).append(BUNDLE_SEPARATOR).append(country);
      } else {
        sb.append(language);
      }
    }
    return possibleResources(sb);
  }

  private List<String> toSuspectedBundleNames(Locale locale) {
    return toSuspectedBundleNames(this.baseName, locale);
  }

  private List<String> possibleResources(StringBuilder sb) {
    List<String> result = new ArrayList<>();
    String[] s = sb.toString().split("_");
    final String[] prevStr = {""};
    Arrays.stream(s)
        .forEach(
            str -> {
              if (Objects.equals(prevStr[0], "")) {
                prevStr[0] = str;
              } else {
                prevStr[0] = String.join("_", prevStr[0], str);
              }
              result.add(prevStr[0] + ".properties");
            });
    return result;
  }

  /**
   * Gets an object for the given key from this resource bundle. Returns null if this resource
   * bundle does not contain an object for the given key.
   *
   * @param key the key for the desired object
   * @return the object for the given key, or Key
   */
  @Override
  protected Object handleGetObject(@NonNull String key) {
    try {
      return parent.getObject(key);
    } catch (MissingResourceException e) {
      if (properties != null && properties.get(key) != null) {
        return properties.get(key);
      } else {
        return key;
      }
    }
  }

  /**
   * Returns an enumeration of the keys.
   *
   * @return an <code>Enumeration</code> of the keys contained in this <code>ResourceBundle</code>
   *     and its parent bundles.
   */
  @Override
  public Enumeration<String> getKeys() {
    Set<String> parentKeys = parent.keySet();
    Set<String> propKeys =
        properties.keySet().stream().map(o -> (String) o).collect(Collectors.toSet());
    parentKeys.addAll(propKeys);
    return Collections.enumeration(parentKeys);
  }
}
