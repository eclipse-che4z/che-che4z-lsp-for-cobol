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
import com.broadcom.lsp.cobol.domain.event.impl.CopybookDepEventSubscriber;
import com.broadcom.lsp.cobol.domain.event.model.CopybookDepEvent;

public class CopybookDepSubscriberFactory
    implements CopybookSubscriber<CopybookDepEventSubscriber> {

  @Override
  public CopybookDepEventSubscriber create(EventObserver observer) {
    return new CopybookDepEventSubscriber(observer, new CopybookDepEvent());
  }
}
