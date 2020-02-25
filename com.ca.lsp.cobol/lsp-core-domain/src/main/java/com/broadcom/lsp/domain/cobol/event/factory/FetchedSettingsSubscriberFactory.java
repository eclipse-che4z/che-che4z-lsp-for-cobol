package com.broadcom.lsp.domain.cobol.event.factory;

import com.broadcom.lsp.domain.cobol.event.api.CopybookSubscriber;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.impl.FetchedSettingsEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;

public class FetchedSettingsSubscriberFactory
    implements CopybookSubscriber<FetchedSettingsEventSubscriber> {
  @Override
  public FetchedSettingsEventSubscriber create(EventObserver observer) {
    return new FetchedSettingsEventSubscriber(observer, new FetchedSettingsEvent());
  }
}
