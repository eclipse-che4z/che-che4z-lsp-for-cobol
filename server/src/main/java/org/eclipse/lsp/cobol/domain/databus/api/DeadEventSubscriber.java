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
package org.eclipse.lsp.cobol.domain.databus.api;

import com.google.common.eventbus.DeadEvent;
import com.google.inject.ImplementedBy;
import org.eclipse.lsp.cobol.domain.databus.impl.DefaultDeadEventSubscriber;

/**
 * This subscriber manages the events that cannot be handled.
 */
@ImplementedBy(DefaultDeadEventSubscriber.class)
public interface DeadEventSubscriber {

  /**
   * Handle event that have no listeners.
   *
   * @param event not handled event
   */
  void handleDeadEvent(DeadEvent event);
}
