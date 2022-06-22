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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.provider.SectionsGenerator;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This unit tests check the {@link SectionsGenerator} class functionality
 */
@ExtendWith(MockitoExtension.class)
class SectionsContentProviderTest {
  @Test
  void testCreatesSectionsFromProvidedNames() {
    String result = SectionsGenerator.generate(ImmutableList.of("LABEL1", "LABEL2", "LABEL_EX"), ImmutableSet.of("LABEL_EX")).getRight();
    assertEquals("       LABEL1 SECTION.\r\n       LABEL2 SECTION.\r\n", result);
  }

}
