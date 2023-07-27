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
package org.eclipse.lsp.cobol.service.utils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

/**
 * Uri helper class
 */
@Slf4j
@UtilityClass
public class UriHelper {
  /**
   * Decode given uri
   * @param uri to decode
   * @return decoded uri
   */
  public String decode(String uri) {
    String result = uri;
    try {
      result = URLDecoder.decode(uri, StandardCharsets.UTF_8.name());
    } catch (UnsupportedEncodingException e) {
      LOG.warn("Uri was not decoded", e);
    }
    return result;
  }
}
