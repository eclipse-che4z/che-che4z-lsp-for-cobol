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

package com.broadcom.lsp.domain.cobol.databus.api;

import com.broadcom.lsp.domain.cobol.factory.FetchedCopybookSubscriberFactory;
import com.broadcom.lsp.domain.cobol.factory.RequiredCopybookSubscriberFactory;
import com.broadcom.lsp.domain.cobol.factory.UnknownSubscriberFactoryImpl;
import com.broadcom.lsp.domain.cobol.model.DataEventType;

import java.util.NoSuchElementException;

/** A factory for the subscriber factories. */
public interface SubscriberFactoryProvider {
  static SubscriberAbstractFactory getFactory(DataEventType choice) {
    switch (choice) {
      case UNKNOWN_EVENT:
        return new UnknownSubscriberFactoryImpl();
      case FETCHED_COPYBOOK_EVENT:
        return new FetchedCopybookSubscriberFactory();
      case REQUIRED_COPYBOOK_EVENT:
        return new RequiredCopybookSubscriberFactory();
      default:
        throw new NoSuchElementException(
            String.format("No subscriber found for %s,%s", choice.getId(), choice.name()));
    }
  }
}
