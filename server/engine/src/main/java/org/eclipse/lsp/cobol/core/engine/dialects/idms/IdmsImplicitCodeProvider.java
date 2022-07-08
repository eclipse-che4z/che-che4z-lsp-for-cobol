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
package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Multimap;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;

/**
 * Creates IDMS implicit code for future injection
 */
@UtilityClass
public class IdmsImplicitCodeProvider {

  static final String COPY_SUBSCHEMA = "              COPY IDMS SUBSCHEMA-DESCRIPTION.\n";
  static final String COPY_MAP =       "              COPY IDMS MAPS.\n";

  /**
   * Returns DaCo implicit code depend on COBOL text for future injection
   * @param descriptor is information about records statement defined in the program
   * @return multimap object where the key is a section name and a value is a copybook name
   */
  public Multimap<String, Pair<String, String>> getImplicitCode(IdmsRecordsDescriptor descriptor) {
    Multimap<String, Pair<String, String>> implicitCode = LinkedListMultimap.create();
    if (!descriptor.isRecordsManualExists() && descriptor.getRecordsWithinPlacement() != null) {
      String section = descriptor.getRecordsWithinPlacement();
      implicitCode.put(section, new ImmutablePair<>("IDMS-SUBSCHEMA-DESCRIPTION", COPY_SUBSCHEMA));
      if (descriptor.isMapSectionExists()) {
        implicitCode.put(section, new ImmutablePair<>("IDMS-MAPS", COPY_MAP));
      }
    }
    return implicitCode;
  }
}
