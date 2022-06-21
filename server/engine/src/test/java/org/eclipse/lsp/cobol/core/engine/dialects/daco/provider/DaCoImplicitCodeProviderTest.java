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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This tests the logic of {@link DaCoImplicitCodeProvider} */
class DaCoImplicitCodeProviderTest {
  @Test
  void testEmptyCobolListing() {
    CopybookConfig copybookConfig = new CopybookConfig(null, null, ImmutableList.of("S1", "S2"));
    DaCoImplicitCodeProvider provider = new DaCoImplicitCodeProvider(ImmutableSet.of("SE"));
    assertEquals(3, provider.getImplicitCode("", ImmutableList.of(), copybookConfig).size());
  }
}
