package com.ca.lsp.cobol;

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;

public interface FileSystemTest extends EventObserver<RequiredCopybookEvent> {}
