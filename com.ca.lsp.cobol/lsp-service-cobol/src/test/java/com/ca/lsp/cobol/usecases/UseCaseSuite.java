/*
 * Copyright (c) 2019 Broadcom.
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
package com.ca.lsp.cobol.usecases;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

/** The suite for the use case tests in the project that should be run. */
@RunWith(Suite.class)
@SuiteClasses({
  TestFormatTrim.class,
  TestSyntaxError.class,
  TestVaryingCorrect.class,
  AnalyzeCopybookCaching.class,
  TestPerformUntilCorrect.class,
  TestEndPerformCausesError.class,
  TestExtraneousInputEOFExpecting.class,
  TestNoErrorOnCompilerDirectives.class,
  TestVariablesAreCaseInsensitive.class,
  TestMissingCopybooksReturnsError.class,
  TestCorrectErrorUnderscorePosition.class,
  TestExtraSymbolsNotCauseErrorOnNextLine.class,
  TestVariableStructureIsBuiltWithCopybooks.class,
  TestCobolStringWithContinuationLineConcatenatedCorrectly.class,
})
public class UseCaseSuite {}
