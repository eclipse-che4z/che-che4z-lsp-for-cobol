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

package com.broadcom.lsp.cobol.core.annotation;

import org.junit.jupiter.api.Test;
import java.lang.reflect.Method;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Unit test {@link NonSyntheticMethodMatcher} to check if {@link
 * NonSyntheticMethodMatcher#matches(Method)} works as expected.
 */
class NonSyntheticMethodMatcherTest {

  @Test
  void whenMethodIsSynthetic_thenReturnFalse() {
    NonSyntheticMethodMatcher nonSyntheticMethodMatcher = new NonSyntheticMethodMatcher();
    Method[] methods = NonSyntheticMethodMatcher.class.getDeclaredMethods();
    for (Method m : methods) {
      if (m.isSynthetic()) assertFalse(nonSyntheticMethodMatcher.matches(m));
    }
  }

  @Test
  void whenMethodIsNotSynthetic_thenReturnTrue() {
    NonSyntheticMethodMatcher nonSyntheticMethodMatcher = new NonSyntheticMethodMatcher();
    Method[] methods = NonSyntheticMethodMatcher.class.getDeclaredMethods();
    for (Method m : methods) {
      if (!m.isSynthetic()) assertTrue(nonSyntheticMethodMatcher.matches(m));
    }
  }
}
