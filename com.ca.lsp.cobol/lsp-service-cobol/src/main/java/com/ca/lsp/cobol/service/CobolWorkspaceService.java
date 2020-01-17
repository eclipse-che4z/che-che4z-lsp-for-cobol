package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import org.eclipse.lsp4j.services.WorkspaceService;

import java.io.IOException;

public interface CobolWorkspaceService
    extends WorkspaceService, EventObserver<RequiredCopybookEvent> {
  String getContentByCopybookName(String copybookName) throws IOException;
}
