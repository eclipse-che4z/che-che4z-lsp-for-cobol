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

package com.broadcom.lsp.cobol.core.preprocessor.delegates.resolution;

import com.broadcom.lsp.cobol.domain.databus.api.DataBusBroker;
import com.google.inject.Inject;
import com.google.inject.Provider;

/**
 * This class creates instances of {@link CopybookResolution} on demand. It requires the data bus
 * broker to the instances to register on it.
 */
public class CopybookResolutionProvider implements Provider<CopybookResolution> {

  private DataBusBroker broker;

  @Inject
  CopybookResolutionProvider(DataBusBroker broker) {
    this.broker = broker;
  }

  @Override
  public CopybookResolution get() {
    return new SynchronousCopybookResolution(broker);
  }
}
