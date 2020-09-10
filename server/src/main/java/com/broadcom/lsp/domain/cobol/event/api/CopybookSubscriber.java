package com.broadcom.lsp.domain.cobol.event.api;

public interface CopybookSubscriber<T> {
  T create(EventObserver observer);
}
