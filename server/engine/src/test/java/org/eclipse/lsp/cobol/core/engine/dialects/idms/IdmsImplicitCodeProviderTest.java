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

import lombok.var;
import org.junit.jupiter.api.Test;

import java.util.LinkedList;

import static org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsImplicitCodeProvider.COPY_MAP;
import static org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsImplicitCodeProvider.COPY_SUBSCHEMA;
import static org.junit.jupiter.api.Assertions.assertEquals;

/** This tests the logic of {@link IdmsImplicitCodeProvider} */
class IdmsImplicitCodeProviderTest {

  @Test
  void testEmptyDescriptor_doNothing() {
    IdmsRecordsDescriptor descriptor = new IdmsRecordsDescriptor();
    var result = IdmsImplicitCodeProvider.getImplicitCode(descriptor);
    assertEquals(0, result.size());
  }

  @Test
  void testRecordsManual_doNothing() {
    IdmsRecordsDescriptor descriptor = new IdmsRecordsDescriptor();
    descriptor.setRecordsManualExists(true);
    var result = IdmsImplicitCodeProvider.getImplicitCode(descriptor);
    assertEquals(0, result.size());
  }

  @Test
  void testRecordsLinkageWithoutMap_addCopyToLinkage() {
    IdmsRecordsDescriptor descriptor = new IdmsRecordsDescriptor();
    descriptor.setRecordsWithinPlacement("LINKAGE");
    var result = IdmsImplicitCodeProvider.getImplicitCode(descriptor);
    var section = new LinkedList<>(result.get("LINKAGE"));

    assertEquals(1, section.size());
    assertEquals(COPY_SUBSCHEMA, section.get(0).getValue());
  }

  @Test
  void testRecordsWSWithMap_addCopyToLinkage() {
    IdmsRecordsDescriptor descriptor = new IdmsRecordsDescriptor();
    descriptor.setRecordsWithinPlacement("WORKING-STORAGE");
    descriptor.setMapSectionExists(true);
    var result = IdmsImplicitCodeProvider.getImplicitCode(descriptor);
    var section = new LinkedList<>(result.get("WORKING-STORAGE"));

    assertEquals(2, section.size());
    assertEquals(COPY_SUBSCHEMA, section.get(0).getValue());
    assertEquals(COPY_MAP, section.get(1).getValue());
  }

}
