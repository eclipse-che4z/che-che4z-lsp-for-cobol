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
package com.broadcom.lsp.cobol.domain.event.factory;

import com.broadcom.lsp.cobol.domain.event.api.CopybookSubscriber;
import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.impl.FetchedSettingsEventSubscriber;
import com.broadcom.lsp.cobol.domain.event.model.FetchedSettingsEvent;

public class FetchedSettingsSubscriberFactory
    implements CopybookSubscriber<FetchedSettingsEventSubscriber> {
  @Override
  public FetchedSettingsEventSubscriber create(EventObserver observer) {
    return new FetchedSettingsEventSubscriber(observer, new FetchedSettingsEvent());
  }
}
