/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.common.collect.BiMap;
import com.google.common.collect.HashBiMap;
import com.google.inject.Singleton;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import lombok.extern.slf4j.Slf4j;

/**
 * Uri helper class
 */
@Slf4j
@Singleton
public class UriDecodeService {

  private final BiMap<String, String> mapper = HashBiMap.create();

  /**
   * Decode given uri
   * @param uri to decode
   * @return decoded uri
   */
  public String decode(String uri) {
    if (mapper.inverse().get(uri) != null) {
      return mapper.inverse().get(uri);
    }
    String result = null;
    try {
      result = URLDecoder.decode(uri, StandardCharsets.UTF_8.name());
    } catch (UnsupportedEncodingException e) {
      LOG.warn("Uri was not decoded", e);
    }
    if (result != null) {
      mapper.put(result, uri);
      return result;
    }
    return uri;
  }

  public String getOriginalUri(String decodedUri) {
    return mapper.getOrDefault(decodedUri, decodedUri);
  }

  public void invalidate(String key) {
    mapper.remove(key);
  }
}
