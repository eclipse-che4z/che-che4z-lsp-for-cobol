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

package org.eclipse.lsp.cobol.domain.event.factory;

import org.eclipse.lsp.cobol.domain.event.api.CopybookSubscriber;
import org.eclipse.lsp.cobol.domain.event.api.EventObserver;
import org.eclipse.lsp.cobol.domain.event.impl.AnalysisFinishedEventSubscriber;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisFinishedEvent;

/** This class is a factory for {@link AnalysisFinishedEventSubscriber} */
public class AnalysisFinishedSubscriberFactory
    implements CopybookSubscriber<AnalysisFinishedEventSubscriber> {

  @Override
  public AnalysisFinishedEventSubscriber create(EventObserver observer) {
    return new AnalysisFinishedEventSubscriber(observer, new AnalysisFinishedEvent());
  }
}
