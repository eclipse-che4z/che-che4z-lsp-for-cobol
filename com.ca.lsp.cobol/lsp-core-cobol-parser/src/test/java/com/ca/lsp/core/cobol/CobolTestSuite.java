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
package com.ca.lsp.core.cobol;

import com.ca.lsp.core.cobol.engine.CobolLanguageEngineTest;
import com.ca.lsp.core.cobol.parser.listener.FormatListenerTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolCommentEntriesMarkerImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.ContinuationLineTransformationTest;
import com.ca.lsp.core.cobol.semantics.CobolCleanExtraLanguageTest;
import com.ca.lsp.core.cobol.semantics.CobolVariableCheckTest;
import com.ca.lsp.core.cobol.semantics.CobolVariableContextTest;
import com.ca.lsp.core.cobol.visitor.LevenshteinDistanceTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

/** This suite runs all the test of Cobol parser core. */
@RunWith(Suite.class)
@SuiteClasses({
  CobolLineReaderImplTest.class,
  FormatListenerTest.class,
  ContinuationLineTransformationTest.class,
  CobolLanguageEngineTest.class,
  CobolCommentEntriesMarkerImplTest.class,
  CobolVariableContextTest.class,
  CobolVariableCheckTest.class,
  CobolCleanExtraLanguageTest.class,
  LevenshteinDistanceTest.class,
})
public class CobolTestSuite {}
