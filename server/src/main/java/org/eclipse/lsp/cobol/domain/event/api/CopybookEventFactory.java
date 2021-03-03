/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.domain.event.api;

import org.eclipse.lsp.cobol.domain.event.factory.AnalysisFinishedSubscriberFactory;
import org.eclipse.lsp.cobol.domain.event.factory.RunAnalysisSubscriberFactory;
import org.eclipse.lsp.cobol.domain.event.factory.UnknownCopybookSubscriberFactory;
import org.eclipse.lsp.cobol.domain.event.model.*;

import java.util.NoSuchElementException;

/** An abstract factory for the subscribers. */
public interface CopybookEventFactory {
  static CopybookSubscriber getFactory(DataEventType choice) {
    switch (choice) {
      case UNKNOWN_EVENT:
        return new UnknownCopybookSubscriberFactory();
      case RUN_ANALYSIS_EVENT:
        return new RunAnalysisSubscriberFactory();
      case ANALYSIS_FINISHED_EVENT:
        return new AnalysisFinishedSubscriberFactory();

      default:
        throw new NoSuchElementException(
            String.format("No subscriber found for %s,%s", choice.getId(), choice.name()));
    }
  }

  static DataEvent createEventByEventType(DataEventType choice) {
    switch (choice) {
      case UNKNOWN_EVENT:
        return UnknownEvent.builder().eventMessage("DUMMY_EVENT_NAME").build();
      case RUN_ANALYSIS_EVENT:
        return new RunAnalysisEvent();
      case ANALYSIS_FINISHED_EVENT:
        return AnalysisFinishedEvent.builder().build();
      default:
        throw new NoSuchElementException(
            String.format("No DataEventType found for %s,%s", choice.getId(), choice.name()));
    }
  }
}
