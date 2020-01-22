/*
 * Copyright (c) 2019 Broadcom.
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

import com.broadcom.lsp.domain.cobol.event.factory.RerunAnalysisSubscriberFactory;
import com.broadcom.lsp.domain.cobol.event.factory.FetchedCopybookSubscriberFactory;
import com.broadcom.lsp.domain.cobol.event.factory.RequiredCopybookSubscriberFactory;
import com.broadcom.lsp.domain.cobol.event.factory.UnknownCopybookSubscriberFactory;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;

import java.util.NoSuchElementException;

/** An abstract factory for the subscribers. */
public interface CopybookEventFactory {
  static CopybookSubscriber getFactory(DataEventType choice) {
    switch (choice) {
      case UNKNOWN_EVENT:
        return new UnknownCopybookSubscriberFactory();
      case FETCHED_COPYBOOK_EVENT:
        return new FetchedCopybookSubscriberFactory();
      case REQUIRED_COPYBOOK_EVENT:
        return new RequiredCopybookSubscriberFactory();
      case RERUN_ANALYSIS_EVENT:
        return new RerunAnalysisSubscriberFactory();
      default:
        throw new NoSuchElementException(
            String.format("No subscriber found for %s,%s", choice.getId(), choice.name()));
    }
  }
}
