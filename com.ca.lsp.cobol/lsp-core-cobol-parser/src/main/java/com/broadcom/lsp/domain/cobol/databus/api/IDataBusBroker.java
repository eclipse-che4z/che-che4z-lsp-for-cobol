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

import com.broadcom.lsp.domain.cobol.databus.impl.IDataBusBrokerImpl;
import com.google.inject.ImplementedBy;
import com.google.inject.Singleton;

/**
 * Created by lamgi04 on 2019-10-01
 */

@ImplementedBy(IDataBusBrokerImpl.class)
public interface IDataBusBroker {
}
