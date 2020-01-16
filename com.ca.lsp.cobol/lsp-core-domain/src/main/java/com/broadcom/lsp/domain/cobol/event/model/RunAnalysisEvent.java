package com.broadcom.lsp.domain.cobol.event.model;

import lombok.Builder;

public class RunAnalysisEvent extends DataEvent {
  private String eventMessage;

  @Builder
  public RunAnalysisEvent(String eventMessage) {
    super(DataEventType.RUN_ANALYSIS_EVENT, DataEventType.RUN_ANALYSIS_EVENT.getId());
    this.eventMessage = eventMessage;
  }
}
