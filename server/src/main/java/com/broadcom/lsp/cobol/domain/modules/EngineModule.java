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

package com.broadcom.lsp.cobol.domain.modules;

import com.broadcom.lsp.cobol.core.engine.CobolLanguageEngine;
import com.broadcom.lsp.cobol.core.preprocessor.TextPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorListenerFactory;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.resolution.CopybookResolution;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.resolution.CopybookResolutionProvider;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.ReplacingServiceImpl;
import com.google.inject.assistedinject.FactoryModuleBuilder;

/** This module provides DI bindings for COBOL language engine part. */
public class EngineModule extends DefaultModule {
  @Override
  protected void configure() {
    bind(CobolLanguageEngine.class);
    bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
    bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
    bind(GrammarPreprocessor.class).to(GrammarPreprocessorImpl.class);
    bind(CopybookResolution.class).toProvider(CopybookResolutionProvider.class);
    install(new FactoryModuleBuilder().build(GrammarPreprocessorListenerFactory.class));
    bind(ReplacingService.class).to(ReplacingServiceImpl.class);
  }
}
