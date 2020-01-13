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

package com.broadcom.lsp.domain.cobol.event.factory;

import com.broadcom.lsp.domain.cobol.event.api.CopybookObserver;
import com.broadcom.lsp.domain.cobol.event.api.CopybookSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.FetchedCopybookEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;

/** This class is a factory for {@link FetchedCopybookEventSubscriber} */
public class FetchedCopybookSubscriberFactory
    implements CopybookSubscriber<FetchedCopybookEventSubscriber> {
  @Override
  public FetchedCopybookEventSubscriber create(CopybookObserver observer) {
    return new FetchedCopybookEventSubscriber(observer, FetchedCopybookEvent.builder().build());
  }
}
