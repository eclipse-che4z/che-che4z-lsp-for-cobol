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

package com.broadcom.lsp.cobol.core.visitor;

import com.broadcom.lsp.cobol.core.CobolParser.DataDescriptionEntryFormat1Context;
import com.broadcom.lsp.cobol.core.CobolParser.DataDescriptionEntryFormat1Level77Context;
import com.broadcom.lsp.cobol.core.CobolParser.DataDescriptionEntryFormat2Context;
import com.broadcom.lsp.cobol.core.CobolParser.DataDescriptionEntryFormat3Context;
import org.junit.jupiter.api.Test;

import static com.broadcom.lsp.cobol.core.visitor.DataDivisionSection.*;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** This test check the allowed variable types validation logic for the sections in DATA DIVISION */
class DataDivisionSectionTest {
  @Test
  void testTypesForNotInitializedSection() {
    assertFalse(NOT_INITIALIZED.allowsVariableType(DataDescriptionEntryFormat1Context.class));
    assertFalse(NOT_INITIALIZED.allowsVariableType(DataDescriptionEntryFormat2Context.class));
    assertFalse(NOT_INITIALIZED.allowsVariableType(DataDescriptionEntryFormat3Context.class));
    assertFalse(
        NOT_INITIALIZED.allowsVariableType(DataDescriptionEntryFormat1Level77Context.class));
  }

  @Test
  void testTypesForFileSection() {
    assertTrue(FILE.allowsVariableType(DataDescriptionEntryFormat1Context.class));
    assertTrue(FILE.allowsVariableType(DataDescriptionEntryFormat2Context.class));
    assertTrue(FILE.allowsVariableType(DataDescriptionEntryFormat3Context.class));
    assertFalse(FILE.allowsVariableType(DataDescriptionEntryFormat1Level77Context.class));
  }

  @Test
  void testTypesForWorkingStorageSection() {
    assertTrue(WORKING_STORAGE.allowsVariableType(DataDescriptionEntryFormat1Context.class));
    assertTrue(WORKING_STORAGE.allowsVariableType(DataDescriptionEntryFormat2Context.class));
    assertTrue(WORKING_STORAGE.allowsVariableType(DataDescriptionEntryFormat3Context.class));
    assertTrue(WORKING_STORAGE.allowsVariableType(DataDescriptionEntryFormat1Level77Context.class));
  }

  @Test
  void testTypesForLinkageSection() {
    assertTrue(LINKAGE.allowsVariableType(DataDescriptionEntryFormat1Context.class));
    assertTrue(LINKAGE.allowsVariableType(DataDescriptionEntryFormat2Context.class));
    assertTrue(LINKAGE.allowsVariableType(DataDescriptionEntryFormat3Context.class));
    assertTrue(LINKAGE.allowsVariableType(DataDescriptionEntryFormat1Level77Context.class));
  }

  @Test
  void testTypesForLocalStorageSection() {
    assertTrue(LOCAL_STORAGE.allowsVariableType(DataDescriptionEntryFormat1Context.class));
    assertTrue(LOCAL_STORAGE.allowsVariableType(DataDescriptionEntryFormat2Context.class));
    assertTrue(LOCAL_STORAGE.allowsVariableType(DataDescriptionEntryFormat3Context.class));
    assertFalse(LOCAL_STORAGE.allowsVariableType(DataDescriptionEntryFormat1Level77Context.class));
  }
}
