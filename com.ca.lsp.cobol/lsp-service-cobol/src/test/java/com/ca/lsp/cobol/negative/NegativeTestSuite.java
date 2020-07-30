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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.negative;

import org.junit.platform.runner.JUnitPlatform;
import org.junit.platform.suite.api.SelectClasses;
import org.junit.runner.RunWith;

/**
 * This suite contains all the defined negative test cases to ensure that error checking works
 * properly. Notice: Format errors are not a part of the grammar, so they should not be verifying
 * here as negative scenarios.
 */
@RunWith(JUnitPlatform.class)
@SelectClasses({
  Chetest1Test.class,
  Chetest2Test.class,
  HelloDB2Test.class,
  MarblesTest.class,
  Marbles3Test.class
})
public class NegativeTestSuite {}
