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
package org.eclipse.lsp.cobol.common;

import java.util.Collection;
import java.util.Optional;

/**
 * Provide API definition to search for subroutine files. The service also caches subroutine file URI to reduce
 * filesystem load.
 */
public interface SubroutineService {

  /**
   * Retrieve and return subroutine URI by its name.
   *
   * @param name the subroutine name
   * @return the URI string wrapped in an {@link Optional}
   */
  Optional<String> getUri(String name);

  /**
   * Gets all known subroutine names.
   *
   * @return a collection of all known subroutine names
   */
  Collection<String> getNames();

  /**
   * Stores the subroutine URI in cache.
   *
   * @param name the subroutine name
   * @param uri the subroutine URI
   */
  void store(String name, String uri);

  /** Remove all the stored copybook. */
  void invalidateCache();
}
