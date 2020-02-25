/** //TODO: Add header here! */
package com.broadcom.lsp.domain.cobol.event.impl;

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;
import com.google.common.eventbus.AllowConcurrentEvents;
import com.google.common.eventbus.Subscribe;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

/** A subscriber for {@link FetchedSettingsEvent} */
@Slf4j
@AllArgsConstructor
public class FetchedSettingsEventSubscriber {
  @Getter @NonNull private EventObserver observer;
  @NonNull @Getter private FetchedSettingsEvent eventType;

  @Subscribe
  @AllowConcurrentEvents
  @SneakyThrows
  public void onDataHandler(FetchedSettingsEvent eventType) {
    LOG.debug(eventType.getHeader());
    observer.observerCallback(eventType);
  }
}
