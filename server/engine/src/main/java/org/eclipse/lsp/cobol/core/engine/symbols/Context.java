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
package org.eclipse.lsp.cobol.core.engine.symbols;

import org.eclipse.lsp4j.Location;

import java.util.List;

/**
 * The interface represents structure that can be defined and used.
 */
public interface Context {
  /**
   * Get the name of the Context Object
   * @return name of the node
   */
  String getName();
  /**
   * Get structure definitions.
   *
   * @return the list of location for the definition
   */
  List<Location> getDefinitions();

  /**
   * Get structure usages.
   *
   * @return the list of locations for the usages
   */
  List<Location> getUsages();
}
