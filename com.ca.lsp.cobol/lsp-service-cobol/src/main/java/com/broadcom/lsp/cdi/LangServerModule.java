/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.broadcom.lsp.cdi;

import com.ca.lsp.cobol.service.*;
import com.ca.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.google.inject.AbstractModule;
import com.google.inject.name.Names;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.services.TextDocumentService;

/**
 * Created by lamgi04 on 2019-10-02
 */
//Binding Module
@Slf4j
public class LangServerModule extends AbstractModule {
    @Override
    protected void configure() {
        bind(String.class)
                .annotatedWith(Names.named("VERSION"))
                .toInstance("0.8");
        bind(TextDocumentService.class).to(MyTextDocumentService.class);
        bind(IMyLanguageServer.class).to(MyLanguageServerImpl.class);
        bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
    }
}
