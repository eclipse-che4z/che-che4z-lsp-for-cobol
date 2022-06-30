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

import com.google.inject.ImplementedBy;
import lombok.NonNull;
import org.eclipse.lsp.cobol.domain.databus.impl.DefaultDataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.DataEvent;

/**
 * This interface represents API to work with databus.
 */
@ImplementedBy(DefaultDataBusBroker.class)
public interface DataBusBroker {

  void postData(@NonNull DataEvent dataEvent);

  void subscribe(@NonNull Object dataSubscriber);

  void unSubscribe(@NonNull Object dataSubscriber);
}
