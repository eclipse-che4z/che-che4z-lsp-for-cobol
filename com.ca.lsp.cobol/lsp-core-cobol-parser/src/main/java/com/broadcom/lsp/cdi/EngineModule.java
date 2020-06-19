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

package com.broadcom.lsp.cdi;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.*;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.ReplacingServiceImpl;
import com.google.inject.assistedinject.FactoryModuleBuilder;

/** This module provides DI bindings for COBOL language engine part. */
public class EngineModule extends DefaultModule {
  @Override
  protected void configure() {
    bind(CobolLanguageEngine.class);
    bind(CobolPreprocessor.class).to(CobolPreprocessorImpl.class);
    bind(CobolPreprocessor.class).to(CobolPreprocessorImpl.class);
    bind(CobolSemanticParser.class).to(CobolSemanticParserImpl.class);
    bind(CopybookResolution.class).toProvider(CopybookResolutionProvider.class);
    install(new FactoryModuleBuilder().build(CobolSemanticParserListenerFactory.class));
    bind(ReplacingService.class).to(ReplacingServiceImpl.class);
  }
}
