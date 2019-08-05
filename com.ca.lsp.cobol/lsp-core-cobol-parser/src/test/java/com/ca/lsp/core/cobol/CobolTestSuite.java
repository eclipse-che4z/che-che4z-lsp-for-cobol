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

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.ca.lsp.core.cobol.engine.CobolLangauageEngineTest;
import com.ca.lsp.core.cobol.parser.listener.FormatLitenerTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolCommentEntriesMarkerImplTest;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.ContinuationLineTransformationTest;

/**
 * This suite runs all the test of Cobol parser core.
 *
 * @author teman02
 */
@RunWith(Suite.class)
@SuiteClasses({
  CobolLineReaderImplTest.class,
  FormatLitenerTest.class,
  ContinuationLineTransformationTest.class,
  CobolLangauageEngineTest.class,
  CobolCommentEntriesMarkerImplTest.class
})
public class CobolTestSuite {}
