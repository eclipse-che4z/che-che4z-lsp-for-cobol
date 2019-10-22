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
package com.broadcom.lsp.cdi.module.service;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.ca.lsp.cobol.service.CobolWorkspaceService;
import com.ca.lsp.cobol.service.CobolWorkspaceServiceImpl;
import com.ca.lsp.cobol.service.IMyLanguageServer;
import com.ca.lsp.cobol.service.MyLanguageServerImpl;
import com.ca.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import lombok.extern.slf4j.Slf4j;

/**
 * Created on 2019-10-02
 */
//Binding Module
@Slf4j
public class ServiceModule extends DefaultModule {
    @Override
    protected void configure() {
        super.configure();
        bind(IMyLanguageServer.class).to(MyLanguageServerImpl.class);
        bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
        bind(CobolWorkspaceService.class).to(CobolWorkspaceServiceImpl.class);
    }
}
