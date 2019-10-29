package com.ca.lsp.cobol;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.ca.lsp.cobol.service.CobolWorkspaceServiceImpl;
import com.ca.lsp.cobol.service.IMyLanguageServer;
import com.ca.lsp.cobol.service.MyLanguageServerImpl;
import com.ca.lsp.cobol.service.MyTextDocumentService;
import com.ca.lsp.cobol.service.delegates.Communications;
import com.ca.lsp.cobol.service.delegates.ServerCommunications;
import com.ca.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.ca.lsp.cobol.service.mocks.TestLanguageServer;
import com.ca.lsp.cobol.service.mocks.TestWorkspaceService;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

public class TestModule extends DefaultModule {
    @Override
    protected void configure() {
        super.configure();
        bind(IMyLanguageServer.class).to(TestLanguageServer.class);
        bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
        bind(WorkspaceService.class).to(TestWorkspaceService.class);
        bind(Communications.class).to(ServerCommunications.class);
        bind(TextDocumentService.class).to(MyTextDocumentService.class);
    }
}
