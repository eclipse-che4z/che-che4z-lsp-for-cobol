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
package com.ca.lsp.cobol;

import com.ca.lsp.cobol.negative.NegativeTestSuite;
import com.ca.lsp.cobol.positive.PositiveTest;
import com.ca.lsp.cobol.service.DefinitionsAndUsagesTest;
import com.ca.lsp.cobol.service.MyDocumentModelTest;
import com.ca.lsp.cobol.service.MyTextDocumentServiceTest;
import com.ca.lsp.cobol.service.WorkspaceServiceTest;
import com.ca.lsp.cobol.service.delegates.LanguageEnginesTest;
import com.ca.lsp.cobol.service.delegates.ValidationTest;
import com.ca.lsp.cobol.service.delegates.completions.CompletionsChainTest;
import com.ca.lsp.cobol.service.delegates.completions.SnippetCompletionTest;
import com.ca.lsp.cobol.service.delegates.completions.VariableCompletionTest;
import com.ca.lsp.cobol.service.delegates.references.ReferencesTest;
import com.ca.lsp.cobol.usecases.TestResponsesNotContainLineBreaks;
import com.ca.lsp.cobol.usecases.UseCaseSuite;
import com.ca.lsp.cobol.utils.KeywordsTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

/**
 * The suite for all the tests in project that should be run.
 *
 * @author teman02
 */
@RunWith(Suite.class)
@SuiteClasses({
  PositiveTest.class,
  NegativeTestSuite.class,
  MyDocumentModelTest.class,
  MyTextDocumentServiceTest.class,
  UseCaseSuite.class,
  KeywordsTest.class,
  ValidationTest.class,
  LanguageEnginesTest.class,
  VariableCompletionTest.class,
  CompletionsChainTest.class,
  SnippetCompletionTest.class,
  ReferencesTest.class,
  DefinitionsAndUsagesTest.class,
  TestResponsesNotContainLineBreaks.class,
  WorkspaceServiceTest.class
})
public class AllTests {}
