package com.broadcom.lsp.domain.cobol.event.factory;

import com.broadcom.lsp.domain.cobol.event.api.CopybookSubscriber;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.impl.RunAnalysisEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;

public class RunAnalysisSubscriberFactory
    implements CopybookSubscriber<RunAnalysisEventSubscriber> {
  @Override
  public RunAnalysisEventSubscriber create(EventObserver observer) {
    return new RunAnalysisEventSubscriber(observer, RunAnalysisEvent.builder().build());
  }
}
