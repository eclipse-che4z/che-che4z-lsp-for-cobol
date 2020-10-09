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

package com.broadcom.lsp.cobol.core.preprocessor.delegates;

import com.broadcom.lsp.cobol.core.model.CopybookUsage;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import org.antlr.v4.runtime.BufferedTokenStream;

import javax.annotation.Nonnull;
import java.util.Deque;

public interface GrammarPreprocessorListenerFactory {
  GrammarPreprocessorListenerImpl create(
      @Nonnull String uri,
      @Nonnull BufferedTokenStream tokens,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull CopybookProcessingMode copybookProcessingMode);
}
