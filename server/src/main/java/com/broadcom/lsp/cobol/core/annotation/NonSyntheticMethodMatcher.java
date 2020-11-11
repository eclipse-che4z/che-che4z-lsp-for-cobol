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

import com.google.inject.matcher.AbstractMatcher;

import java.lang.reflect.Method;

/**
 * Custom {@link com.google.inject.matcher.Matcher} to identify any synthetic method and returns
 * false if the method is synthetic
 *
 * <p>Java Language Specification (JLS 13.1.7): Any constructs introduced by a Java compiler that do
 * not have a corresponding construct in the source code must be marked as synthetic, except for
 * default constructors, the class initialization method, and the values and valueOf methods of the
 * Enum class.
 *
 * <p>Guice dynamically creates a subclass that applies interceptors by overriding methods. And may
 * introduce some synthetic methods.
 */
public class NonSyntheticMethodMatcher extends AbstractMatcher<Method> {

  /**
   * match any synthetic method and returns false if the method is synthetic
   *
   * @param method
   * @return true if method is non-synthetic and false otherwise
   */
  @Override
  public boolean matches(Method method) {
    return !method.isSynthetic();
  }
}
