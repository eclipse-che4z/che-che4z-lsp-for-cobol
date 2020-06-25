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
package com.ca.lsp.cobol.usecases;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

/** The suite for the use case tests in the project that should be run. */
@RunWith(Suite.class)
@SuiteClasses({
  TestFormatTrim.class,
  TestSyntaxError.class,
  TestSkipStatement.class,
  TestVaryingCorrect.class,
  TestCopybookCaching.class,
  TestPerformUntilCorrect.class,
  TestSeveralReplacingTags.class,
  TestMappingWithReplacing.class,
  TestExtraLanguagesCleaned.class,
  TestEndPerformCausesError.class,
  TestRemarksAreUnsupported.class,
  TestCpyNameWithSpecialChar.class,
  TestErrorsInDifferentFiles.class,
  TestEntireProgramInCopybook.class,
  TestReplacingAppliedOneByOne.class,
  TestProcedureDivisionInCopybook.class,
  TestExtraneousInputEOFExpecting.class,
  TestNoErrorOnCompilerDirectives.class,
  TestVariablesAreCaseInsensitive.class,
  TestRemarksSectionIsUnsupported.class,
  TestMappingWithMultiDefinitions.class,
  TestMessageIfVariableNotDefined.class,
  TestMissingCopybooksReturnsError.class,
  TestResponsesNotContainLineBreaks.class,
  TestInvalidVariableStructureFound.class,
  TestReplacingNotAppliedRecursively.class,
  TestCorrectErrorUnderscorePosition.class,
  TestSameCopybooksWithDifferentCases.class,
  TestKeywordAsCopybookNotProducesNPE.class,
  TestMissingCopybookNotInVariableList.class,
  TestIdentificationDivisionInCopybook.class,
  TestUndefinedParentVariableUnderlined.class,
  TestEntireProcedureDivisionInCopybook.class,
  TestExtraSymbolsNotCauseErrorOnNextLine.class,
  TestVariableStructureIsBuiltWithCopybooks.class,
  TestVariableUsedSeveralTimesInOneStatement.class,
  TestReplacingPseudoTextReplacesLevelNumber.class,
  TestReplacingIdentifiersAppliedForFullTokens.class,
  TestIdentificationDivisionInCopybookWithError.class,
  TestCopybookWithRecursiveDependencyIsDetected.class,
  TestMisspelledKeywordWarningInCorrectPosition.class,
  TestRepetitiveVariableUsagesInAdjacentStatements.class,
  TestVariableStructureInCopybooksWithMissingLevels.class,
  TestSameCopybookReplacingDeclarationsNotProducesNPE.class,
  TestCopybookWithIndirectRecursiveDependencyIsDetected.class,
  TestCobolStringWithContinuationLineConcatenatedCorrectly.class,
})
public class UseCaseSuite {}
