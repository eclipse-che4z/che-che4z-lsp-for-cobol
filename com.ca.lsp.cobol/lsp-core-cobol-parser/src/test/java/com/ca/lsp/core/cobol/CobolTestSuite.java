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
package com.ca.lsp.core.cobol;

import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.GrammarPreprocessorImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolCommentEntriesMarkerImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolInlineCommentEntriesNormalizerImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolLineIndicatorProcessorImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.ContinuationLineTransformationTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl.CobolLineWriterImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorStringUtilsTest;
import com.ca.lsp.core.cobol.semantics.CobolVariableContextTest;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategyTest;
import com.ca.lsp.core.cobol.visitor.MisspelledKeywordDistanceTest;
import com.ca.lsp.core.cobol.visitor.VisitorSemanticAnalysisTest;
import org.junit.platform.runner.JUnitPlatform;
import org.junit.platform.suite.api.SelectClasses;
import org.junit.runner.RunWith;

/** This suite runs all the test of Cobol parser core. */
@RunWith(JUnitPlatform.class)
@SelectClasses({
  CobolLineReaderImplTest.class,
  ContinuationLineTransformationTest.class,
  CobolCommentEntriesMarkerImplTest.class,
  CobolVariableContextTest.class,
  CobolLineWriterImplTest.class,
  PreprocessorStringUtilsTest.class,
  MisspelledKeywordDistanceTest.class,
  VisitorSemanticAnalysisTest.class,
  CobolLineIndicatorProcessorImplTest.class,
  CobolErrorStrategyTest.class,
  CobolInlineCommentEntriesNormalizerImplTest.class,
  GrammarPreprocessorImplTest.class
})
public class CobolTestSuite {}
