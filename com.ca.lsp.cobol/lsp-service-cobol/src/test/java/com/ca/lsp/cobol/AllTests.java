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
package com.ca.lsp.cobol;

import com.ca.lsp.cobol.negative.NegativeTestSuite;
import com.ca.lsp.cobol.positive.PositiveTest;
import com.ca.lsp.cobol.service.*;
import com.ca.lsp.cobol.service.delegates.HighlightsTest;
import com.ca.lsp.cobol.service.delegates.actions.CodeActionsTest;
import com.ca.lsp.cobol.service.delegates.actions.FindCopybookCommandTest;
import com.ca.lsp.cobol.service.delegates.communications.ServerCommunicationsTest;
import com.ca.lsp.cobol.service.delegates.completions.*;
import com.ca.lsp.cobol.service.delegates.references.DocumentOccurrencesTest;
import com.ca.lsp.cobol.usecases.UseCaseSuite;
import org.junit.platform.runner.JUnitPlatform;
import org.junit.platform.suite.api.SelectClasses;
import org.junit.runner.RunWith;

/** The suite for all the tests in project that should be run. */
@RunWith(JUnitPlatform.class)

@SelectClasses({
  PositiveTest.class,
  NegativeTestSuite.class,
  MyDocumentModelTest.class,
  MyTextDocumentServiceTest.class,
  UseCaseSuite.class,
  VariableCompletionTest.class,
  CompletionsChainTest.class,
  SnippetCompletionTest.class,
  ParagraphCompletionTest.class,
  CopybookCompletionTest.class,
  DocumentOccurrencesTest.class,
  WorkspaceServiceTest.class,
  CompletionResolutionTest.class,
  CopybookServiceTest.class,
  HighlightsTest.class,
  LangServerBootstrapTest.class,
  DocumentExtensionTests.class,
  MyLanguageServerImplTest.class,
  CodeActionsTest.class,
  ServerCommunicationsTest.class,
  FindCopybookCommandTest.class,
  WatcherServiceImplTest.class
})
public class AllTests {}
