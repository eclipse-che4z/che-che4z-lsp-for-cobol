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
package com.ca.lsp.cobol;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.positive.ZipTextRegistry;
import com.ca.lsp.cobol.service.MyTextDocumentService;
import com.ca.lsp.cobol.service.delegates.Communications;
import com.ca.lsp.cobol.service.delegates.ServerCommunications;
import com.ca.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import com.ca.lsp.cobol.service.mocks.TestLanguageServer;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.google.inject.name.Names;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import java.util.Optional;

public class TestModule extends DefaultModule {
  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";

  @Override
  protected void configure() {
    super.configure();
    bind(LanguageClient.class).to(TestLanguageClient.class);
    bind(LanguageServer.class).to(TestLanguageServer.class);
    bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
    bind(WorkspaceService.class).to(MockWorkspaceService.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(TextDocumentService.class).to(MyTextDocumentService.class);
    bind(CobolTextRegistry.class).to(ZipTextRegistry.class);
    bind(CobolSourceFormat.class).toInstance(CobolSourceFormat.FIXED);
    bind(String.class)
        .annotatedWith(Names.named(PATH_TO_TEST_RESOURCES))
        .toProvider(
            () -> Optional.ofNullable(System.getProperty(PATH_TO_TEST_RESOURCES)).orElse(""));
  }
}
