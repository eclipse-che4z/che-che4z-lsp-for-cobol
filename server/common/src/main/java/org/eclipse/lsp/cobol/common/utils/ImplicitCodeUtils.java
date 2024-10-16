/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.common.utils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.model.Uri;

/**
 * Utility class for implicit code injection
 */
@Slf4j
@UtilityClass
public class ImplicitCodeUtils {
  /** Prefix for uri of the predefined copybooks */
  private static final String PREF_IMPLICIT = "implicit://";
  @SuppressWarnings("java:S1075")
  private static final String IMPLICIT_PATH = "/implicitCopybooks/";
  /** ** Prefix for defining undefined subroutines */
  private static final String IMPLICIT_SUBROUTINE_PATH = "/implicitSubroutine/";

  /**
   * Check if this copybook is predefined
   *
   * @param uri uri of the copybook
   * @return true if the copybook is predefined
   */
  public boolean isImplicit(Uri uri) {
    return isImplicit(uri.toString());
  }

  /**
   * Check if this copybook is predefined
   *
   * @param uri uri of the copybook (string form for optimization)
   * @return true if the copybook is predefined
   */
  public boolean isImplicit(String uri) {
    return uri.startsWith(PREF_IMPLICIT);
  }

  /**
   * Creates a url for implicit code
   * @return implicit code location
   */
  public String createSubroutineLocation() {
    return PREF_IMPLICIT + IMPLICIT_SUBROUTINE_PATH;
  }

  /**
   * Creates the path to implicit code
   * @param name is a name of the implicit code
   * @return the path
   */
  public String createPath(String name) {
    return IMPLICIT_PATH + name + ".cpy";
  }

  /**
   * Creates full url for implicit code
   * @param name is a name of the implicit code
   * @return the full url
   */
  public Uri createFullUrl(String name) {
    return new Uri(PREF_IMPLICIT + createPath(name));
  }
}
