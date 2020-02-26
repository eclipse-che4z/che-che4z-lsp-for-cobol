/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.domain.cobol.event.api;

import com.broadcom.lsp.domain.cobol.event.factory.*;
import com.broadcom.lsp.domain.cobol.event.model.*;

import java.util.NoSuchElementException;

/** An abstract factory for the subscribers. */
public interface CopybookEventFactory {
  // TODO: Update unit tests..
  static CopybookSubscriber getFactory(DataEventType choice) {
    switch (choice) {
      case UNKNOWN_EVENT:
        return new UnknownCopybookSubscriberFactory();
      case FETCHED_COPYBOOK_EVENT:
        return new FetchedCopybookSubscriberFactory();
      case REQUIRED_COPYBOOK_EVENT:
        return new RequiredCopybookSubscriberFactory();
      case RUN_ANALYSIS_EVENT:
        return new RunAnalysisSubscriberFactory();
      case FETCHED_SETTINGS_EVENT:
        return new FetchedSettingsSubscriberFactory();

      default:
        throw new NoSuchElementException(
            String.format("No subscriber found for %s,%s", choice.getId(), choice.name()));
    }
  }

  static DataEvent createEventByEventType(DataEventType choice) {
    switch (choice) {
      case UNKNOWN_EVENT:
        return UnknownEvent.builder().eventMessage("DUMMY_EVENT_NAME").build();
      case FETCHED_COPYBOOK_EVENT:
        return FetchedCopybookEvent.builder().build();
      case REQUIRED_COPYBOOK_EVENT:
        return RequiredCopybookEvent.builder().build();
      case RUN_ANALYSIS_EVENT:
        return new RunAnalysisEvent();
      case FETCHED_SETTINGS_EVENT:
        return FetchedSettingsEvent.builder().build();
      default:
        throw new NoSuchElementException(
            String.format("No DataEventType found for %s,%s", choice.getId(), choice.name()));
    }
  }
}
