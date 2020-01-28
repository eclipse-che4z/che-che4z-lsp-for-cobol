/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.CopybookStorableProvider;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class CopybookStorableTest extends CopybookStorableProvider {
  private CopybookStorable storable = getDummyStorable();

  /** A storable object created is not already expired */
  @Test
  public void testStorableNotExpired() {
    assertFalse(storable.isExpired());
  }

  /** A storable object hit increase its hit value */
  @Test
  public void testHitIncrement() {
    // actual hit value
    int prevHit = storable.getHit();
    storable.match();
    assertTrue(storable.getHit() > prevHit);
  }
}
