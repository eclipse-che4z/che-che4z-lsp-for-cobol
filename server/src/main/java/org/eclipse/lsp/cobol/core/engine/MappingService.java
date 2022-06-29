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
package org.eclipse.lsp.cobol.core.engine;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.HashMap;
import java.util.Map;

/**
 * Provides mapping functionality for extended document
 */
@UtilityClass
public class MappingService {

  /**
   * Builds an extended document token locality to original source locality map
   * @param textTransformations is a text transformations object
   * @return a map
   */
  public Map<Locality, Locality> buildLocalityMap(TextTransformations textTransformations) {
    Map<Locality, Locality> result = new HashMap<>();

    return result;
  }
}
